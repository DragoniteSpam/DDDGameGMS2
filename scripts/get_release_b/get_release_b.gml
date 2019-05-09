/// @description  boolean get_release_b([clear?]);
/// @param [clear?]

var s=Controller.release_b;

if (argument_count==0||argument[0]){
    Controller.release_b=false;
}

return s;
