/// @description  boolean get_press_y([clear?]);
/// @param [clear?]

var s=Controller.press_y;

if (argument_count==0||argument[0]){
    Controller.press_y=false;
}

return s;
