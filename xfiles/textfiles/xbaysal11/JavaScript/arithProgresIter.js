//uset input
var inp = prompt("", "");

//converting to int
inp = Number(inp);

//iterative function
const sumTo = n => {
  var sum = 0;
  for (var i = 1; i <= n; i++) {
    sum += i;
  }
  return sum;
};

//logging
console.log(sumTo(inp));
