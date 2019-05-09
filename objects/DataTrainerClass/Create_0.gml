event_inherited();

name="Pawn";
internal_name="PAWN";

// When a trainer class is loaded from the file, it gets assigned a
// default sprite (and probably some other things) based on its index.
// You can override them if you want to, though.
index=0;
battle_sprite=ClassBattleSprites.PLAYERPAWN;
overworld_sprite=ClassOverworldSprites.PLAYERPAWN;

audio_battle=ClassBattleBGM.SILENCE;
audio_victory=ClassVictoryBGM.SILENCE;
audio_intro=ClassIntroME.SILENCE;

ai=32;
reward=32;

gender=Genders.GENDERLESS;

ai_notes=ds_list_create();

/// misc constants and stuff

enum ClassBattleBGM {
    SILENCE,
}

enum ClassVictoryBGM {
    SILENCE,
}

enum ClassIntroME {
    SILENCE,
}

enum ClassBattleSprites {
    PLAYERPAWN,
    PAWN_RIVAL,
}

enum ClassOverworldSprites {
    PLAYERPAWN,
    PAWN_RIVAL,
}

