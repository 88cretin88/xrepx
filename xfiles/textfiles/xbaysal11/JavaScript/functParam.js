const showParam = (name, age) => {
  console.log("name: ", name);
  // age == undefined ? console.log("age: ", "no age") : console.log("age: ", age);
  // age = age || "no age";
  console.log("age: ", age);
};
showParam("aaa", 0);
