/// @description  void be_rollout(user, target, move id);
/// @param user
/// @param  target
/// @param  move id

var target=argument1;   // unused here

with (instance_create(0, 0, BattleAppliedEffect)){
    // this will start at 2^0 and grow to 2^4
    damage_modifier=power(2, argument0.momentum_turn);
    
    if (argument0.momentum_move==-1){
        argument0.momentum_move=argument2;
        argument0.momentum_turn=1;
    } else {
        // you can make momentum moves last as long as you want. it's
        // kind of broken after five though.
        argument0.momentum_turn++;
        if (argument0.momentum_turn==World.settings.battle.momentum_turn_limit){
            argument0.momentum_turn=0;
            argument0.momentum_move=-1;
        }
    }
    
    return id;
}
