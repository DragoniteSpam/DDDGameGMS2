/// @description  boolean get_press_x([clear?]);
/// @param [clear?]

var s=Controller.press_x;

if (argument_count==0||argument[0]){
    Controller.press_x=false;
}

return s;
