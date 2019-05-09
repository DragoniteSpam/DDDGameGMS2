event_inherited();

name="Base Move";
pbs_internal_name="BASEMOVE";
summary="very basic";

type=Types.NORMAL;
value=50;
pp=20;
accuracy=100;
priority=0;
target=MoveTargets.ADJACENT;
category=MoveCategories.PHYSICAL;
flags=0;

effects=ds_list_create();
effect_odds=ds_list_create();
ai_score_modification=ds_list_create();

animation=ba_move_basic;
animation_blending_color=c_white;

// ujrpg variables
mp_cost=0;
sp_cost=0;
is_combo=false;
cooldown=0;

/// constants and stuff

enum MoveTargets {
    ADJACENT,
    NONE,
    ADJACENTRANDOM,
    ALLOPPONENTS,
    ALLNONUSER,
    USER,
    BATTLEFIELD,
    USERTEAM,
    OPPONENTTEAM,
    PARTNER,
    SINGLETEAMMATE,
    SINGLEOPPONENT,
    SINGLEACROSS
}

enum MoveCategories {
    PHYSICAL,
    SPECIAL,
    STATUS,
    PHYSICAL_ATK_SPECIAL_DEF,
    SPECIAL_ATK_PHYSICAL_DEF,
}

// Each 'letter' in the PBS move flag value corresponds to
// a bit. Game Maker stores numbers in double-precision
// floating point so you SHOULD be able to add quite a lot
// of these (64 bits), but floating point is weird so don't
// depend on it. I'd use an int64 ('long') instead but the
// logical operators apparently won't give you an int64 back
// and that might make things complicated.

// If for some reason you need to add more than 32-ish move
// flags it's probably safest and least headache-inducing to
// make a MoveFlagsB enum and variable.
enum MoveFlags {
    /*a*/CONTACT=1<<0,
    /*b*/PROTECTABLE_OFFENSE=1<<1,
    /*c*/PROTECTABLE_STATUS=1<<2,
    /*d*/SNATCHABLE=1<<3,
    /*e*/COPYABLE=1<<4,
    /*f*/ITEM_FLINCH_CHANCE=1<<5,
    /*g*/THAWABLE=1<<6,
    /*h*/HIGH_CRITICAL_HIT=1<<7,
    /*i*/BITING=1<<8,
    /*j*/PUNCHING=1<<9,
    /*k*/SOUND=1<<10,
    /*l*/POWDER=1<<11,
    /*m*/PULSE=1<<12,
    /*n*/BOMB=1<<13
}

/* */
/*  */
