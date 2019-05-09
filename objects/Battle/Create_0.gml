/// @description  setup

singleton();

stage=BattleStages.BEGIN;
animator=noone;

input_ready=true;
input_processing=noone;

input_stage=BattleInputStages.GRAND;

result=BattleStatus.CONTINUE;

teams=ds_list_create();
contestants=ds_list_create();
drawables=ds_list_create();
replacements=ds_list_create();

actions=ds_queue_create();
round_actions=ds_queue_create();
individual_actions=ds_queue_create();
priority=ds_priority_create();

sprite_hash=ds_map_create();
misc_data=ds_map_create();

// misc data defaults

misc_data[? "stat raise animations"]=0;
misc_data[? "stat fall animations"]=0;

// less important settings

view_details=false;
view_item_pocket=ItemPockets.ITEMS;

// debug stuff

debug_win=noone;

/// battle constants

enum BattleStages {
    BEGIN,
    LOOP,
    END
}

enum BattleStatus {
    CONTINUE,
    WIN,
    DRAW,
}

enum BattleInputStages {
    GRAND,
    MOVE,
    ITEM,
    ITEM_INTERNAL,
    ITEM_POKEMON,
    SWITCH,
    FLEE,
    LEVEL_STAT_DELTA,
    LEVEL_STAT_TOTAL,
    // todo other screens such as the 'learn a new move' screen
    SWITCH_BEFORE_TURN,
}

