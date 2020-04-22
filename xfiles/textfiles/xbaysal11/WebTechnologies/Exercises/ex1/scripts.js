function capitalize_Words(word) {
    word = word.split(" ");

    for (var i = 0, x = word.length; i < x; i++) {
        word[i] = word[i][0].toUpperCase() + word[i].substr(1);
    }
    return word.join(" ");
}

console.log(capitalize_Words("js string exercises"));