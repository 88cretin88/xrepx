function mirror_bits(n) {
    return parseInt(n.toString(2).split("").reverse().join(""), 2);
}
var alert1 = alert("56 = "+mirror_bits(56));
var alert2 = alert("234 = "+mirror_bits(234));