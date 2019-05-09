/// @description  void babl_contact_paralyze_user(user, target, ability, move);
/// @param user
/// @param  target
/// @param  ability
/// @param  move

var ability=argument2;
var move=argument3;

// a bit of explanation: this script is supposed to be called when
// user makes contact with target. however, because this is target's
// ability activating on user, when the card is shown and the status
// is applied, the target becomes the user and the user becomes the
// target.
if (random(100)<World.settings.battle.ability_contact_chance){
    bia_show_ability_card(individual_actions, argument1)
    bia_apply_major_status(individual_actions, argument1, argument0, MajorStatus.PARALYZE, 1, noone);
}
