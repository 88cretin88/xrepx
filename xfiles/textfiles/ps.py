#!/usr/bin/python

import socket

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

host = raw_input( "[*] host: " )
port = int(raw_input( "[*] port: " ))

def portscanner(port):
	if sock.connect_ex((host, port)):
		print 'Port %d is closed' % (port)
	else:
		print 'Port %d is open' % (port)
portscanner(port)
