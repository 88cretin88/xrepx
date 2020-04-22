var a = prompt("a: ", "");
var b = prompt("b: ", "");

const pow = (x, n) => {
  var result = x;
  for (var i = 1; i < n; i++) {
    result *= x;
  }
  return result;
};

console.log(pow(a, b));
