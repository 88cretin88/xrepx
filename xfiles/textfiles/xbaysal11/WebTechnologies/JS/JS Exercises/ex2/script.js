function swapping(n){
    if (n%2!=0){
        return false;
    }
    var result = 0,
        x = 1;
    while (n != 0){
        var dg1 = n % 10,
            dg2 = ((n - dg1) / 10) % 10;
        result += x * (10 * dg1 + dg2);
        n = Math.floor(n / 100);
        x *= 100;
    }
    return result;

}
var prompt = prompt("enter numbers")
var alert = alert(swapping(prompt));
