var a = prompt("a: ", "");
var b = prompt("b: ", "");

const pow = (x, n) => {
  if (n != 1) {
    return x * pow(x, n - 1);
  } else {
    return x;
  }
};

console.log(pow(a, b));
