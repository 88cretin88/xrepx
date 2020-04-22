// Splitting var
var names = "flash, zoom, savitar, reverse, black-flash, god-flash";
var arr = names.split(", ");
// splitting every elem => .split('');
console.log(arr);

//printing each elem
for (let i = 0; i < arr.length; i++) {
  const element = arr[i];
  console.log(element);
}
