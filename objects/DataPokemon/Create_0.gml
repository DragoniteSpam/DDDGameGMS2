event_inherited();

name="Base Pokemon";
kind="Base";
summary="very basic";

base_stat=array_create(6);
base_stat[Stats.HP]=60;
base_stat[Stats.ATTACK]=60;
base_stat[Stats.DEFENSE]=60;
base_stat[Stats.SPATTACK]=60;
base_stat[Stats.SPDEFENSE]=60;
base_stat[Stats.SPEED]=60;

// you can theoretically have as many types as you want, although i warn you,
// more than two is probably not a good idea
types=ds_list_create();
abilities=ds_list_create();
hidden_abilities=ds_list_create();
moves=ds_list_create();
move_levels=ds_list_create();
egg_moves=ds_list_create();
egg_groups=ds_list_create();

indices=ds_list_create();
evolutions=ds_list_create();

gender=0.5; // -1 means genderless, 0 means all male, 0.5 means 50/50, 1 means all female
growth_rate=GrowthRates.MEDIUM_SLOW;
reward_exp=50;
catch_rate=100;
happiness=70;
egg_steps=6000;

reward_ev[Stats.HP]=0;
reward_ev[Stats.ATTACK]=0;
reward_ev[Stats.DEFENSE]=0;
reward_ev[Stats.SPATTACK]=0;
reward_ev[Stats.SPDEFENSE]=0;
reward_ev[Stats.SPEED]=0;

height=1;
weight=10;
color=c_white;
shape=1;
habitat=Habitats.GRASSLAND;
incense=-1;

wild_items=array_create(100);

form_name="";
forms=ds_map_create();

// ehh

pbs_internal_name="BASEPOKEMON";

/// constants and stuff

enum Genders {
    MALE,
    FEMALE,
    GENDERLESS,
}

enum GrowthRates {
    ERRATIC,
    FAST,
    MEDIUM_FAST,
    MEDIUM_SLOW,
    SLOW,
    FLUCTUATING,
}

enum Habitats {
    CAVE,
    FOREST,
    GRASSLAND,
    MOUNTAIN,
    RARE,
    ROUGHTERRAIN,
    SEA,
    URBAN,
    WATERSEDGE,
}

