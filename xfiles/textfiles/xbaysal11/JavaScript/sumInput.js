//printing sum of inputs till none number
var sum = 0;
while (true) {
  var value = +prompt("vedite chislo");
  if (!value) break;
  sum += value;
}
console.log("summ " + sum);
