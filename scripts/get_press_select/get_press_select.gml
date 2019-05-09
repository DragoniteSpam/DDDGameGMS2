/// @description  boolean get_press_select([clear?]);
/// @param [clear?]

var s=Controller.press_select;

if (argument_count==0||argument[0]){
    Controller.press_select=false;
}

return s;
