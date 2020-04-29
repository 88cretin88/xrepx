import os, time
from threading import Thread, enumerate as tenum
from select import epoll, EPOLLIN, EPOLLHUP

class _spawn(Thread):
	def __init__(self, client, func, callback=None, start_callback=None, error_callback=None, *args, **kwargs):
		if not 'worker_id' in kwargs: kwargs['worker_id'] = gen_uid()
		Thread.__init__(self)
		self.func = func
		self.client = client
		self.args = args
		self.kwargs = kwargs
		if not 'worker' in self.kwargs: self.kwargs['worker'] = self
		self.callback = callback
		self.error_callback = error_callback
		self.data = None
		self.start_callback = start_callback
		self.started = time.time()
		self.ended = None
		self.worker_id = kwargs['worker_id']
		self.status = 'starting'
		self.start()

	def run(self):
		main = None
		self.name = str(self.func)
		for t in tenum():
			if t.name == 'MainThread':
				main = t
				break

		if not main:
			print('Main thread not existing')
			return
		
		if 'dependency' in self.kwargs:
			#dependency = self.kwargs['dependency']
			if type(self.kwargs["dependency"]) == str:
				print(f'{self.kwargs["dependency"]} is waiting to be converted into a process.')
				# Dependency is a progress-string. Wait for it to show up.
				while main and main.isAlive() and self.kwargs["dependency"] not in progress or progress[self.kwargs["dependency"]] is None:
					time.sleep(0.25)
				print(f'{self.kwargs["dependency"]} is converted into {progress[self.kwargs["dependency"]]}.')
				self.kwargs["dependency"] = progress[self.kwargs["dependency"]]

			if type(self.kwargs["dependency"]) == str:
				print(f" [E] {self.func} waited for progress {self.kwargs['dependency']} which never showed up. Aborting.")
				log(f"{self.func} waited for progress {self.kwargs['dependency']} which never showed up. Aborting.", level=2, origin='worker', function='run')
				self.ended = time.time()
				self.status = 'aborted'
				return None

			index = 0
			while main and main.isAlive() and type(self.kwargs["dependency"]) is str or self.kwargs['dependency'].ended is None:
				if type(self.kwargs["dependency"]) is str:
					if self.kwargs["dependency"] in progress:
						self.kwargs["dependency"] = progress[self.kwargs["dependency"]]
					index += 1

				if index > 10:
					print('Endless loop in spawn()!', self.func, self.kwargs["dependency"])
				time.sleep(0.25)

			print(f'  *** Dependency {self.kwargs["dependency"]} released for:', self.func)

			if self.kwargs["dependency"].data is None or not main or not main.isAlive():
				log('Dependency:', self.kwargs["dependency"].func, 'did not exit clearly. There for,', self.func, 'can not execute.', level=2, origin='worker', function='run')
				self.ended = time.time()
				self.status = 'aborted'
				return None
		else:
			self.kwargs['dependency'] = None

		print('--->', self.func, f'is now being called after dependency {self.kwargs["dependency"]}')
		log(self.func, f'is being called after dependency {self.kwargs["dependency"]}.', level=4, origin='worker', function='run')
		if self.kwargs["dependency"]:
			print(self.kwargs["dependency"])
			print(self.kwargs["dependency"].status)
			print(self.kwargs["dependency"].ended)
			print(self.kwargs["dependency"].data)

		if self.start_callback: self.start_callback(*self.args, **self.kwargs)
		self.status = 'running'
		self.data = self.func(*self.args, **self.kwargs)

		self.ended = time.time()
		
		if self.data is None:
			print(self.func, 'did not exit clearly.')
			log(self.func, 'did not exit clearly.', level=2, origin='worker', function='run')
			self.status = 'failed'
			if self.error_callback:
				self.error_callback(*self.args, **self.kwargs)
		elif self.callback:
			self.status = 'finished'
			print(self.func, f'has finished, calling callback {self.callback}.')
			log(self.func, f'has finished, calling callback {self.callback}.', level=4, origin='worker', function='run')
			self.callback(*self.args, **self.kwargs)
		else:
			self.status = 'finished'
			print(self.func, f'has finished with data: {self.data}')
			log(self.func, f'has finished with data: {self.data}', level=4, origin='worker', function='run')