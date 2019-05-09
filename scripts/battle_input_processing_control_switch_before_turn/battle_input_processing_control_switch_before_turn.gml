/// @description  void battle_input_processing_control_switch_before_turn();
// Of course, you could not hard-code this behavior. In fact, if you're
// trying to make a custom battle system, I suggest you do that. But in
// the meantime I'm going to hard-code this.

// This value should be set whenever the input stage is set to this.
// Yes, I gave it that ridiculously long name to be funny.
var opt_out=Battle.misc_data[? "allowed to not send anybody in"];

if (Controller.release_a){
    if (World.message_option_index==ds_list_size(Camera.following.party)){
        if (opt_out){
            battle_input_processing_reset();
            battle_advance();
        } else {
            message(L("You need to select somebody to send in!"));
        }
    } else {
        var target=Battle.input_processing.owner.party[| World.message_option_index];
        
        if (!alive(target)){
            message(L("%0 is unable to fight!", target.name));
        } else if (battle_is_on_field(target)){
            message(L("%0 is already fighting!", target.name));
        } else {
            // todo in multi battles when all of your front line goes down: mark
            // BattlePokemon as 'selected' when you choose them here so they can't
            // be sent into both contestant slots at the same time.
            Battle.replacements[| Battle.misc_data[? "contestant slot to replace"]]=World.message_option_index;
            World.message_option_result=World.message_option_index;
            battle_input_processing_reset();
            battle_advance();
        }
    }
} else if (Controller.release_b){
    if (opt_out){
        battle_input_processing_reset();
        battle_advance();
    } else {
        message(L("You need to select somebody to send in!"));
    }
}
