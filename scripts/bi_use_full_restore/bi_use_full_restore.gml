/// @description  BattleExecutableAction bi_use_full_restore(user, item index);
/// @param user
/// @param  item index

var user=argument0;
var item=argument1;

// you could check for the need to heal confusion, infatuation
// and any other minor statuses you may wish to add, if you want
if (pokemon_hp_f(user)==1&&user.status==MajorStatus.NONE&&!user.confused){
    message(L("%0 is pretty healthy already!", user.name));
    return noone;
}

return add_battle_executable_action(BattleActions.ITEM, user, noone, item);
