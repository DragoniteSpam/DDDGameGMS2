// this is sadly less singleton than other things because it's going to get
// deactivated but you can still try
singleton();

use_scaled_exp=true;
battle_style_shift=true;
battle_gen=BattleGenerations.SIX;

// Some game settings that you may not want the player to be able to
// mess with. (But they can if you want to!)

idle_allowed=true;
damage_filter_turns=5;
trap_finite_turns=5;
trapped_residual_damage=0.125; // 0.0625 in gen 5 and earlier
confuse_min_turns=1;
confuse_max_turns=4;
momentum_turn_limit=5;

paralyze_speed_factor=0.25;
paralyze_immobilization_odds=0.25;
poison_damage=0.125;
toxic_damage_t1=0.0625;
burn_damage=0.0625;

ability_contact_chance=30;
ability_low_health_move_power=1.5;
ability_low_health_threshold=1/3;
ability_shed_skin_heal_rate=30;

