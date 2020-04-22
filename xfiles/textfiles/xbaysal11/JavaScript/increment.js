var i = 1;
// console.log(2 * ++i);
console.log(2 * i++); //write into i
console.log(2 * i++); //use writen before i++ and write new
console.log(2 * ++i); //write and then use

console.log((i *= 2));

var a = 1,
  b = 1,
  c,
  d;

c = ++a;
alert(c); // 2
d = b++;
alert(d); // 1

c = 2 + ++a;
alert(c); // 5
d = 2 + b++;
alert(d); // 4

alert(a); // 3
alert(b); // 3
