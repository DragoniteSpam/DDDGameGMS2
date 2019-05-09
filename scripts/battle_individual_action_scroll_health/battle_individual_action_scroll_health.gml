/// @description  void battle_individual_action_scroll_health(BattleIndividualAction);
/// @param BattleIndividualAction
// 0: target (single)
// 1: damage amount

var params=argument0;

Battle.input_ready=false;
with (instance_create(0, 0, BattleAnimator)){
    user=params[| 0];
    // this is to avoid imprecision that may occur while scrolling
    misc_data[? "initial"]=user.act_hp;
    // you can only heal up to maximum hp, and you can only take damage up to your
    // maximum hp
    misc_data[? "amount"]=clamp(params[| 1], user.act_hp-user.act[Stats.HP], user.act_hp);
    script=ba_scroll_health;
}
