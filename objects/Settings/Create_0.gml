// this is sadly less singleton than other things because it's going to get
// deactivated but you can still try
singleton();

battle=instance_create(0, 0, SettingsBattle);
gameplay=instance_create(0, 0, SettingsGameplay);
input=instance_create(0, 0, SettingsInput);

/// constants and stuff

// Not all of these are implemented. You can if you want, though.
// Some specific settings override these.
enum BattleGenerations {
    ONE,
    TWO,
    THREE,
    FOUR,
    FIVE,
    SIX,
    SEVEN
}

