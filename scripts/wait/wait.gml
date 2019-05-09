/// @description  void wait(seconds, [continue after wait?]);
/// @param seconds
/// @param  [continue after wait?]

World.message_wait=argument[0];

if (argument_count==2){
    World.message_continue_after_wait=argument[1];
}
