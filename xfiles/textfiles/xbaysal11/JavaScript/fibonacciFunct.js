var inp = prompt("", "");
inp = Number(inp);

const fibonacci = n => {
  if (n == 1) {
    return 1;
  } else if (n == 2) {
    return 1;
  } else {
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
};

console.log(fibonacci(inp));
