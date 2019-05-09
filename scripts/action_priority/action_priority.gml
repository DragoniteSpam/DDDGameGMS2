/// @description  double action_priority(BattleExecutableAction);
/// @param BattleExecutableAction
/* Components:
 *   - whole number: move/action priority
 *   - fractional part: speed
 */

var n=0;
var f=0;
var fmod=1;

switch (argument0.action){
    case BattleActions.IDLE:
        // you could just return zero, but normally for the purposes of testing you
        // want to have the events execute in the order that they would if this was
        // a normal move.
        n=0;
        break;
    case BattleActions.MOVE:
        n=get_move(argument0.value).priority;
        break;
    case BattleActions.SWITCH_FIRE_ABILITY:
        n=19;
        break;
    case BattleActions.SWITCH:
        n=20;
        battle_prioritize(add_battle_executable_action(BattleActions.SWITCH_FIRE_ABILITY, argument0.user, noone, 0));
        break;
    case BattleActions.ITEM:
        n=21;
        break;
    case BattleActions.FLEE:
        n=22;
        break;
    case BattleActions.AUTOHEAL:
        return 23;
    case BattleActions.AUTOKO:
        return 24;
    case BattleActions.AUTOVICTORY:
        return 25;
}

// i'm pretty sure this and maybe a few abilities are the only thing that will affect
// speed calculations so i'm okay-ish with hardcoding it
if (argument0.user.status==MajorStatus.PARALYZE){
    fmod=World.settings.battle.paralyze_speed_factor;
}

// add a random amount of floating point between -0.25 and 0.25 to account for speed ties
// the range of possible numerical speeds is about between 1 and 3,000, so dividing the
// result by 10,000 should be a pretty safe way to 'normalize' it to a decimal
f=(argument0.user.act[Stats.SPEED]*math_mod(argument0.user, Stats.SPEED)+random_range(-0.25, 0.25))/10000;

return n+f*fmod;
