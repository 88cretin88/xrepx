var namesObj = {
  hero: "Flash",
  enemy: "Savitar",
  speed: 1200
};

//amount of props
var count = 0;
for (var key in namesObj) {
  count++;
}
console.log(count);

//props
for (var key in namesObj) {
  console.log("Prop: " + key + " Val: " + namesObj[key]);
}
