/// @description  array pbs_read_move_function_code(hex string);
/// @param hex string

// I don't know why I'm doing this when the switch tree uses the
// hex codes anyway (i.e. I could just switch the string). But I don't
// like switching strings.
var value=hex(argument0);

var effects=array_create(1);

// These could be hashed, except some codes (Thunder Fang, etc)
// may get broken up into multiple codes, so these can't be hashed.
// actually, they could be hashed anyway, you'd just put an array
// or something in the hash, but that's a lot of work for a script
// whose only job is to re-interpret Essentials data.

var missing_codes=ds_map_create();

switch (value){
    case $0:
        effects[0]=be_no_effect;
        break;
    case $2:
        effects[0]=be_recoil_025;
        break;
    case $5:
        effects[0]=be_poison_target;
        break;
    case $6:
        effects[0]=be_badly_poison_target;
        effects[1]=be_always_hit_if_user_has_poison_type;
        break;
    case $7:
        effects[0]=be_paralyze_target;
        // todo Bolt Strike: doubles the power of the next Fusion Flare
        // used in this round
        // todo gen 6: Body Slam power doubles and accuracy is perfect
        // if target is Minimized
        break;
    case $a:
        effects[0]=be_burn_target;
        // todo Blue Flare: doubles the power of the next Fusion Bolt
        // used in this round
        // todo gen 6: Scald thaws the target if move hits and target
        // is frozen
        break;
    case $f:
        effects[0]=be_flinch;
        break;
    case $13:
        effects[0]=be_confuse;
        break;
    case $1c:
        effects[0]=be_user_attack_raise_1;
        break;
    case $20:
        effects[0]=be_user_sp_attack_raise_1;
        break;
    case $26:
        effects[0]=be_user_attack_raise_1;
        effects[1]=be_user_speed_raise_1;
        break;
    case $43:
        effects[0]=be_target_defense_decrease_1;
        break;
    case $44:
        effects[0]=be_target_speed_decrease_1;
        // todo Bulldoze: power is halved if Grassy Terrain is in effect
        break;
    case $46:
        effects[0]=be_target_sp_defense_decrease_1;
        break;
    case $47:
        effects[0]=be_target_accuracy_decrease_1;
        break;
    case $75:
        effects[0]=be_double_power_if_diving;
        break;
    case $a2:
        effects[0]=be_reflect;
        break;
    case $a5:
        // this is handled by accuracy?
        effects[0]=be_no_effect;
        break;
    case $d0:
        effects[0]=be_trap_damage_finite_turns;
        effects[1]=be_double_power_if_diving;
        break;
    case $d3:
        effects[0]=be_rollout;
        break;
    case $d5:
        effects[0]=be_user_heal_half;
        break;
    case $ef:
        effects[0]=be_trap_infinite_turns;
        break;
    default:
        effects[0]=be_not_implemented;
        if (!ds_map_exists(missing_codes, value)){
            debug("Unimplemented function code: "+string(value)+" (0x"+argument0+")");
            ds_map_add(missing_codes, value, value);
        }
        break;
}

ds_map_destroy(missing_codes);

return effects;
