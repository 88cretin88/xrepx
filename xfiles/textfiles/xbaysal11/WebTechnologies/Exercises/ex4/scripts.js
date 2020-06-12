function lowest_num(arr){
    arr.sort(function(x,y){
        return x-y;
    });
    var num = [arr[0]];
    var result = [];

    for(var j=1; j < arr.length; j++){
        if(arr[j-1] !== arr[j]){
            num.push(arr[j]);
        }
    }

    result.push(num[1],num[num.length-2]);
    return result.join(',');
}

console.log(lowest_num([1,2,3,4,5]));