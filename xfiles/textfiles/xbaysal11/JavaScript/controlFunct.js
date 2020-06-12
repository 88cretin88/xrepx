var age = prompt("ur Age: ", "");

const checkAge = age => {
  if (isNaN(age) && age == "") {
    return false;
  } else {
    return true;
  }
};

if (checkAge(age)) {
  if (age >= 18) {
    console.log("u can pass");
  } else if (age < 18 && age > 0) {
    var agr = confirm("Parents agreements");
    if (agr) {
      console.log("u can pass");
    } else {
      console.log("u cant pass");
    }
  } else {
    console.log("u cant pass");
  }
}
