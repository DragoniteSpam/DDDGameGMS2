/// Where scribble gets created
// Sorta calls itself via the gml_pragma thing, so you don't need to actually run it anywhere in the game

gml_pragma("global", "__scribble_begin();");

scribble_init_start(PATH_FONT, "FGameMedium", false);
scribble_init_add_font("FGameMedium");              // the first font added is the default one
scribble_init_add_font("FGameHuge");
scribble_init_add_font("FGameLarge");
scribble_init_add_font("FGameMediumLarge");
scribble_init_add_font("FGameSmall");
scribble_init_end();