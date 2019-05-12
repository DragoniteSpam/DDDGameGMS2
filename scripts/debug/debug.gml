/// @description  void debug(v1, v2, .. vn);
/// @param v1
/// @param  v2
/// @param  .. vn

if (DEBUG){
    var str = "";
    for (var i = 0; i < argument_count; i++){
        str = str + string(argument[i]);
    }
    
    show_debug_message(str);
    
    buffer_write(World.debug_log, buffer_text, str + N);
    World.debug_modified=true;
}
