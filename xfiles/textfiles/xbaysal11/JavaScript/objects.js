var namesObj = {
  hero: "Flash",
  enemy: "Savitar",
  speed: 1200
};

//call property
console.log(namesObj.hero);
console.log(namesObj["speed"]);

//rewrite
namesObj.enemy = "Zoom";
console.log(namesObj.enemy);

//add
namesObj["girlFriend"] = "Bella";
console.log(namesObj);

//delete
delete namesObj.hero;
console.log(namesObj);
