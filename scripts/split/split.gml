/// @description  array split(string, delimiter, [as real?,] [block quotes?]);
/// @param string
/// @param  delimiter
/// @param  [as real?
/// @param ] [block quotes?]

var ESCAPE = "\\";
var block = "";

var str, delimiter;
var asreal = false;
var blockquotes = true;
switch (argument_count){
    case 4:
        // this is on by default because you probably want to use them more often than not
        blockquotes = argument[3];
    case 3:
        // this will not check that it is safe to convert to a real. it's up to you
        // to not input garbage.
        asreal = argument[2];
    case 2:
        delimiter = argument[1];
        str = argument[0];
        break;
}

// im not sure if this will not blow up or not
if (string_length(str) == 0){
    return [];
}

var index = 0;
// This grows an array, so it's slow. Try not to use it in the step event, or otherwise
// more than necessary.
var terms;
terms[0] = "";
for (var i = 1; i <= string_length(str); i++){
    var c = string_char_at(str, i);
    var previous = string_char_at(str, i - 1);
    // break if:
    //  - you've met a delimiter
    //  - the previous character is not an escape
    //  - you're not in a block
    if (c == delimiter && previous != ESCAPE && block == ""){
        terms[++index] = "";
    } else {
        // block if:
        //  - you've met a quote character
        //  - the previous character is not an escape
        if ((c == "\"" || c == "'") && previous != ESCAPE){
            if (block == c){
                block = "";
            } else if (string_length(block) == 0){
                block = c;
            } else {
                terms[index] = terms[index] + string_char_at(str, i);
            }
        } else {
            // code duplication aaaaaaaa
            terms[index] = terms[index] + string_char_at(str, i);
        }
    }
}

if (asreal){
    for (var i = 0; i < array_length_1d(terms); i++){
        terms[i] = real(terms[i]);
    }
}

return terms;
