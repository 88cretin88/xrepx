function strip_html_tags(word){

    if((word===null)||(word==='')) {
        return false;
    }else{
        word = word.toString();
    return word.replace(/<[^>]*>/g, '');
    }
}

console.log(strip_html_tags('<p><strong><em>PHP Exercises</em></strong></p>'));