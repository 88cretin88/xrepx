var age = prompt("ur Age: ", "");

const checkAge =
  (age == Number(age) && age === "number") || age >= 18
    ? () => {
        console.log("hello");
      }
    : () => {
        age > 0 ? console.log("ur age is less then 18") : console.log("sorry");
      };

checkAge(age);
