/// @description  color get_color_from_name(name);
/// @param name

switch (string_minimal(argument0)){
    // there's no real point in localizing these strings, unless
    // your PBS files are in some other language
    case "black":
        return c_black;
    case "blue":
        return c_blue;
    case "brown":
        return c_brown;
    case "gray":
        return c_gray;
    case "green":
        return c_green;
    case "pink":
        return c_pink;
    case "purple":
        return c_purple;
    case "red":
        return c_red;
    case "white":
        return c_white;
    case "yellow":
        return c_yellow;
}

// i'm guessing you're rarely going to get to this but just in case
// (if you omit the return the script will return 0 by default,
// which is also c_black)
return c_white;
