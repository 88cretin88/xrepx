//Array implementation
var arr = ["hello", "world", "anna", "hi", "man"];
// var arr = [6, 3, 4, 5, 7, 2, 1];
//add new element into index 5
arr[6] = "woman";
//rewrite index 2
arr[1] = "hey";

//add element into end of arr
arr.push("push");
//remove from end of arr
arr.pop();

//add element into beggining of arr
arr.unshift("unshift");
//remove elem from beggining of arr
arr.shift();

//sort int and string
arr.sort();

console.log(arr);
