const compareString = (a, b) => {
  //splitting into arr
  var name1 = a.split("");
  var name2 = b.split("");

  console.log(name1, name2);

  isNaN(a, b) ? console.log(!(name1 > name2)) : console.log(+name1 > +name2);
};

//user input
var in1 = prompt("1-letter");
var in2 = prompt("2-letter");

//call funcrtion
compareString(in1, in2);
