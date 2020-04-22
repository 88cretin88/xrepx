function multiply(){
    var number1 = document.getElementById("firstNum").value;
    var number2 = document.getElementById("secondNum").value;
    document.getElementById("result").innerHTML = parseFloat(number1 * number2);
}
function divide(){
    var number1 = document.getElementById("firstNum").value;
    var number2 = document.getElementById("secondNum").value;
    document.getElementById("result").innerHTML = parseFloat(number1 / number2) ;
}
