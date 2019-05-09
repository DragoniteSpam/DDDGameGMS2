/// @description  void draw_pause();

switch (Pause.stage){
    case PauseStages.HIDDEN:
        break;
    case PauseStages.MAIN:
        draw_pause_main();
        break;
    case PauseStages.INVENTORY:
        draw_pause_inventory();
        break;
}
