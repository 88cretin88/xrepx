//global var
var userName = "Flash";

const showMsg = () => {
  //function var
  var userName = "Baisalbek";
  //userName = "Baisalbek";
  console.log("userName: ", userName);
  var msg = "Hello " + userName;
  console.log("msg: ", msg);
};
//call function
showMsg();
console.log("userName: ", userName);
