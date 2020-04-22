//user input
var inp = prompt("", "100");
//number formatting
inp = Number(inp);

//Function SumTo
const sumTo = n => {
  return n == 1 ? 1 : n + sumTo(n - 1);
};
//log
console.log(sumTo(inp));
