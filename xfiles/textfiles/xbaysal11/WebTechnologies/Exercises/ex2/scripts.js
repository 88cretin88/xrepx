function alphabetize_string(word){

    return alert(word.split('').sort().join('').trim());

}
var string = prompt("Enter String: ");
console.log(alphabetize_string(string));