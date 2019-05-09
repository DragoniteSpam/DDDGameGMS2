/// @description  string string_commas(n, ignore if only four digits?);
/// @param n
/// @param  ignore if only four digits?

var str=string(argument[0]);
var ignore=argument_count==2&&argument[1];
var len=string_length(str);

if (ignore&&len<=4){
    return str;
}

var comma="";
for (var i=len; i>0; i--){
    comma=string_char_at(str, i)+comma;
    if (i<len&&i>1&&(len-i+1)%3==0){
        comma=","+comma;
    }
}

return comma;
