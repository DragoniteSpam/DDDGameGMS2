/// @description  boolean get_press_a([clear?]);
/// @param [clear?]

var s=Controller.press_a;

if (argument_count==0||argument[0]){
    Controller.press_a=false;
}

return s;
