/// @description  DataMove add_nature_stats(name, [stat raised], [stat lowered]);
/// @param name
/// @param  [stat raised]
/// @param  [stat lowered]
// Makes it easier to write code to add natures because you only have to
// specify the altered stats and not all of them

var stat_mods=array_create(Stats.SPEED+1);
array_clear(stat_mods, 1);

switch (argument_count){
    case 3:
        var up=1.1;
        var down=0.9;
        
        stat_mods[argument[1]]=up;
        stat_mods[argument[2]]=down;
    default:
        break;
}

return add_nature(argument[0], stat_mods[Stats.HP], stat_mods[Stats.ATTACK], stat_mods[Stats.DEFENSE],
    stat_mods[Stats.SPATTACK], stat_mods[Stats.SPDEFENSE], stat_mods[Stats.SPEED]);
