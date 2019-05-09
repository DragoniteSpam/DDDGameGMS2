name="Team"+string(instance_number(BattleTeam));
owner=noone;

sprite_side=SpriteSides.FRONT;

// in current pokémon the only ones that are used by any
// moves are defense (Reflect), special defense (Light
// Screen) and speed (Tailwind). doubling HP doesn't
// really make sense. doubling evasion would be a violation
// of intergalactic law.
double_stat=array_compose(0, 0, 0, 0, 0, 0, 0, 0);

