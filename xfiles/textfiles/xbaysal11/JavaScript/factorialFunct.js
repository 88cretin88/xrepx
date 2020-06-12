var inp = prompt("", "");

var factorial = n => {
  return n ? n * factorial(n - 1) : 1;
};
console.log(factorial(inp));
