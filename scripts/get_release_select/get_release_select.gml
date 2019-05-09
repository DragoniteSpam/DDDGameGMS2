/// @description  boolean get_release_select([clear?]);
/// @param [clear?]

var s=Controller.release_select;

if (argument_count==0||argument[0]){
    Controller.release_select=false;
}

return s;
