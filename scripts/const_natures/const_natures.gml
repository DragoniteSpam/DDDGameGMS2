enum Natures {
    HARDY,
    LONELY,
    BRAVE,
    ADAMANT,
    NAUGHTY,
    BOLD,
    DOCILE,
    RELAXED,
    IMPISH,
    LAX,
    TIMID,
    HASTY,
    SERIOUS,
    JOLLY,
    NAIVE,
    MODEST,
    MILD,
    QUIET,
    BASHFUL,
    RASH,
    CALM,
    GENTLE,
    SASSY,
    CAREFUL,
    QUIRKY
}

var array=array_create(Natures.QUIRKY);

array[Natures.HARDY]=add_nature_stats(L("Hardy"));
array[Natures.LONELY]=add_nature_stats(L("Lonely"), Stats.ATTACK, Stats.DEFENSE);
array[Natures.BRAVE]=add_nature_stats(L("Brave"), Stats.ATTACK, Stats.SPEED);
array[Natures.ADAMANT]=add_nature_stats(L("Adamant"), Stats.ATTACK, Stats.SPATTACK);
array[Natures.NAUGHTY]=add_nature_stats(L("Naughty"), Stats.ATTACK, Stats.SPDEFENSE);
array[Natures.BOLD]=add_nature_stats(L("Bold"), Stats.DEFENSE, Stats.ATTACK);
array[Natures.DOCILE]=add_nature_stats(L("Docile"));
array[Natures.RELAXED]=add_nature_stats(L("Relaxed"), Stats.DEFENSE, Stats.SPEED);
array[Natures.IMPISH]=add_nature_stats(L("Impish"), Stats.DEFENSE, Stats.SPATTACK);
array[Natures.LAX]=add_nature_stats(L("Lax"), Stats.DEFENSE, Stats.SPDEFENSE);
array[Natures.TIMID]=add_nature_stats(L("Timid"), Stats.SPEED, Stats.ATTACK);
array[Natures.HASTY]=add_nature_stats(L("Hasty"), Stats.SPEED, Stats.DEFENSE);
array[Natures.SERIOUS]=add_nature_stats(L("Serious"));
array[Natures.JOLLY]=add_nature_stats(L("Jolly"), Stats.SPEED, Stats.SPATTACK);
array[Natures.NAIVE]=add_nature_stats(L("Naive"), Stats.SPEED, Stats.SPDEFENSE);
array[Natures.MODEST]=add_nature_stats(L("Modest"), Stats.SPATTACK, Stats.ATTACK);
array[Natures.MILD]=add_nature_stats(L("Mild"), Stats.SPATTACK, Stats.DEFENSE);
array[Natures.QUIET]=add_nature_stats(L("Quiet"), Stats.SPATTACK, Stats.SPEED);
array[Natures.BASHFUL]=add_nature_stats(L("Bashful"));
array[Natures.RASH]=add_nature_stats(L("Rash"), Stats.SPATTACK, Stats.SPDEFENSE);
array[Natures.CALM]=add_nature_stats(L("Calm"), Stats.SPDEFENSE, Stats.ATTACK);
array[Natures.GENTLE]=add_nature_stats(L("Gentle"), Stats.SPDEFENSE, Stats.DEFENSE);
array[Natures.SASSY]=add_nature_stats(L("Sassy"), Stats.SPDEFENSE, Stats.SPEED);
array[Natures.CAREFUL]=add_nature_stats(L("Careful"), Stats.SPDEFENSE, Stats.SPATTACK);
array[Natures.QUIRKY]=add_nature_stats(L("Quirky"));

return array;
