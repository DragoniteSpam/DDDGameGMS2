/// @description  int battle_damage(DataMove, user, target, [critical?], [effects list], [ignore randomness]);
/// @param DataMove
/// @param  user
/// @param  target
/// @param  [critical?]
/// @param  [effects list]
/// @param  [ignore randomness]

var move=argument[0];
var user=argument[1];
var target=argument[2];

var critical_hit=false;
var effects_list=noone;
var ignore_randomness=false;
switch (argument_count){
    case 6:
        ignore_randomness=argument[5];
    case 5:
        effects_list=argument[4];
    case 4:
        critical_hit=argument[3];
        break;
}

// todo sort these out
var mod_targets=1;
var mod_weather=1;
var mod_badge=1;
var mod_critical=1;
var mod_random=random_range(0.85, 1);
if (ignore_randomness){
    mod_random=1;
}
var mod_stab=1;
if (has_type(user, move.type)){
    mod_stab=1.5;
}
var mod_effects=1;
if (effects_list==noone){
    var mod_type=get_matchup_on(move.type, target);
} else {
    // todo some moves do a fixed amount of damage (i.e. Sonic Boom and Dragon Rage)
    // and some don't really use the damage formula (i.e. Night Shade and Seismic Toss)
    // and some are just weird (Bide, Counter, et al)
    var mod_type=get_matchup_on(move.type, target, effects_list);
    for (var i=0; i<ds_list_size(effects_list); i++){
        mod_effects=mod_effects*effects_list[| i].damage_modifier;
    }
}
var mod_burn=1;
var mod_other=1;
if (pokemon_hp_f(user)<=World.settings.battle.ability_low_health_threshold){
    mod_other=mod_other*user.ability.low_health_factor[move.type];
}
if (user.item!=-1){
    mod_other=mod_other*script_execute(get_item(user.item).battle_hold_damage_mod, user, target, move);
}
// todo target item, Chople Berry and whatnot

// no need to waste time with fancy arithmetic
// (you may want to do this with some of the other mods as well)
if (mod_type==0){
    return 0;
}

// todo abilities such as Huge Power, Rivalry, etc

if (critical_hit){
    // todo sniper increases critical hit damage, and maybe some other things
    mod_critical=2;
}

var level=get_pokemon_level(argument[1]);

var cat_offense, cat_defense;
var offense, defense, offense_mod, defense_mod;
switch (move.category){
    case MoveCategories.PHYSICAL:
        cat_offense=Stats.ATTACK;
        cat_defense=Stats.DEFENSE;
        break;
    case MoveCategories.SPECIAL:
        cat_offense=Stats.SPATTACK;
        cat_defense=Stats.SPDEFENSE;
        break;
    case MoveCategories.PHYSICAL_ATK_SPECIAL_DEF:
        cat_offense=Stats.ATTACK;
        cat_defense=Stats.SPDEFENSE;
        break;
    case MoveCategories.SPECIAL_ATK_PHYSICAL_DEF:
        cat_offense=Stats.SPATTACK;
        cat_defense=Stats.DEFENSE;
        break;
    case MoveCategories.STATUS:
        show_error("you somehow managed to do a damage calculation on a status move, good job", true);
        break;
}

offense=user.act[cat_offense];
defense=target.act[cat_defense];
offense_mod=math_mod(user, cat_offense);
defense_mod=math_mod(target, cat_defense);
if (critical_hit){
    offense_mod=max(offense_mod, 1);
    defense_mod=min(defense_mod, 1);
}
if (user.status=MajorStatus.BURN&&cat_offense==Stats.ATTACK){
    mod_burn=0.5;
}

var m=offense_mod/defense_mod*mod_weather*mod_badge*mod_critical*mod_random*mod_stab*mod_type*mod_burn*mod_effects*mod_other;

var base=(((2*level)/5+2)*move.value*offense/defense)/50+2;

return floor(base*m);
