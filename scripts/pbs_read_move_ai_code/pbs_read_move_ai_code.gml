/// @description  array pbs_read_move_ai_code(hex string);
/// @param hex string
// see comments in pbs_read_move_function code

var value=hex(argument0);
var effects=array_create(1);

switch (value){
    case $0:
        effects[0]=baim_no_effect;
        break;
    case $2:
        // ai does not play a role in the use of Struggle
        effects[0]=baim_no_effect;
        break;
    case $5:
        effects[0]=baim_poison_target;
        break;
    case $6:
        effects[0]=baim_poison_target;
        break;
    case $7:
        effects[0]=baim_paralyze_target;
        break;
    case $a:
        effects[0]=baim_burn_target;
        break;
    case $f:
        effects[0]=baim_flinch;
        break;
    case $13:
        effects[0]=baim_confuse;
        break;
    case $1c:
        effects[0]=baim_user_attack_raise_1;
        break;
    case $20:
        effects[0]=baim_user_sp_attack_raise_1;
        break;
    case $26:
        effects[0]=baim_user_attack_raise_1;
        effects[1]=baim_user_speed_raise_1;
        break;
    case $43:
        effects[0]=baim_target_defense_decrease_1;
        break;
    case $44:
        effects[0]=baim_target_speed_decrease_1;
        break;
    case $46:
        effects[0]=baim_target_sp_defense_decrease_1;
        break;
    case $47:
        effects[0]=baim_target_accuracy_decrease_1;
        break;
    case $75:
        // if you like ai, or maybe just have a lot of time on your hands,
        // you may want to write code for this
        effects[0]=baim_no_effect;
        break;
    case $a2:
        effects[0]=baim_reflect;
        break;
    case $a5:
        effects[0]=baim_no_effect;
        break;
    case $d0:
        // currently trap damage does not factor into ai
        effects[0]=baim_trap;
        // whirlpool also has the effect of $75
        break;
    case $d3:
        effects[0]=baim_no_effect;
        break;
    case $d5:
        effects[0]=baim_user_heal_half;
        break;
    case $ef:
        effects[0]=baim_trap;
        break;
    default:
        effects[0]=baim_no_effect;
        break;
}

return effects;
