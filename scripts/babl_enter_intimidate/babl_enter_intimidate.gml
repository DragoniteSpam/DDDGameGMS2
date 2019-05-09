/// @description  void babl_enter_intimidate(queue, BattlePokemon);
/// @param queue
/// @param  BattlePokemon

bia_show_ability_card(argument0, argument1);

for (var i=0; i<ds_list_size(Battle.contestants); i++){
    var contestant=Battle.contestants[| i];
    // this isn't quite correct, intimidate only affects adjacent Pokémon,
    // but i've envisioned the battlefield as more of a circle than a line
    if (contestant!=noone&&contestant.owner.team!=argument1.owner.team){
        bia_apply_attack_decrease_1(argument0, argument1, contestant, noone);
    }
}
