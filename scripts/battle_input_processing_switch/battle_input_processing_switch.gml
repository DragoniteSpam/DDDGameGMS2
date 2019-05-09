/// @description  void battle_input_processing_switch(battle input processing script);
/// @param battle input processing script

var pkmn=Battle.input_processing;

var text_list=ds_list_create();
var color_list=ds_list_create();

for (var i=0; i<ds_list_size(pkmn.owner.party); i++){
    ds_list_add(text_list, pkmn.owner.party[| i].name);
    if (alive(pkmn.owner.party[| i])){
        ds_list_add(color_list, c_black);
    } else {
        ds_list_add(color_list, c_red);
    }
}
ds_list_add(text_list, L("(Back)"));
ds_list_add(color_list, c_black);

var max_n=ds_list_size(text_list);

draw_menu_from_list(text_list, message_option_index, color_list);
message_option_index=menu_input(message_option_index, max_n);

ds_list_destroy(text_list);
ds_list_destroy(color_list);

if (Controller.release_x){
    Battle.view_details=!Battle.view_details;
}

if (Battle.view_details&&message_option_index<max_n-1){
    draw_pokemon_details(pkmn.owner.party[| message_option_index]);
}
 
// controls may be variable depending on what part of the battle is
// having you switch, so we package that up in a script and pass it
// as an argument   
script_execute(argument0);
