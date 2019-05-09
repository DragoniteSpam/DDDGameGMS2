/// @description  boolean get_press_b([clear?]);
/// @param [clear?]

var s=Controller.press_b;

if (argument_count==0||argument[0]){
    Controller.press_b=false;
}

return s;
