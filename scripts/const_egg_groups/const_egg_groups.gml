/// @description  array const_egg_groups();

enum EggGroups {
    MONSTER,
    WATER1,
    BUG,
    FLYING,
    FIELD,
    FAIRY,
    GRASS,
    HUMANLIKE,
    WATER3,
    MINERAL,
    AMORPHOUS,
    WATER2,
    DITTO,
    DRAGON,
    UNDISCOVERED,
}

var array;
array=array_create(EggGroups.UNDISCOVERED);

array[EggGroups.MONSTER]=add_egg_group(L("Monster"), false, false);
array[EggGroups.WATER1]=add_egg_group(L("Water 1"), false, false);
array[EggGroups.BUG]=add_egg_group(L("Bug"), false, false);
array[EggGroups.FLYING]=add_egg_group(L("Flying"), false, false);
array[EggGroups.FIELD]=add_egg_group(L("Field"), false, false);
array[EggGroups.FAIRY]=add_egg_group(L("Fairy"), false, false);
array[EggGroups.GRASS]=add_egg_group(L("Grass"), false, false);
array[EggGroups.HUMANLIKE]=add_egg_group(L("Human-like"), false, false);
array[EggGroups.WATER3]=add_egg_group(L("Water 3"), false, false);
array[EggGroups.MINERAL]=add_egg_group(L("Mineral"), false, false);
array[EggGroups.AMORPHOUS]=add_egg_group(L("Amorphous"), false, false);
array[EggGroups.WATER2]=add_egg_group(L("Water 2"), false, false);
array[EggGroups.DITTO]=add_egg_group(L("Ditto"), false, true);
array[EggGroups.DRAGON]=add_egg_group(L("Dragon"), false, false);
array[EggGroups.UNDISCOVERED]=add_egg_group(L("Undiscovered"), true, false);

return array;
