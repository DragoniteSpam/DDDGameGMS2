/// @description  boolean boolean(string);
/// @param string

var text=string_lower(argument0);

switch (text){
    case "true":
    case "1":
        return true;
    case "false":
    case "0":
        return false;
}

show_error("you tried to read a boolean out of a non-boolean: "+text, true);
