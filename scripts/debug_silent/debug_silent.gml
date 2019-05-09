/// @description  void debug_silent(v1, v2, .. vn);
/// @param v1
/// @param  v2
/// @param  .. vn
// logs a message without printing it to the console

if (DEBUG){
    var str="";
    for (var i=0; i<argument_count; i++){
        str=str+string(argument[i]);
    }
    
    buffer_write(World.debug_log, buffer_text, str+N);
    World.debug_modified=true;
}
