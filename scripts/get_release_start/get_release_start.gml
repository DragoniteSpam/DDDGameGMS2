/// @description  boolean get_release_start([clear?]);
/// @param [clear?]

var s=Controller.release_start;

if (argument_count==0||argument[0]){
    Controller.release_start=false;
}

return s;
