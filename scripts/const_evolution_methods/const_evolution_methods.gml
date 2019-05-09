/// @description  array const_evolution_methods();

enum EvolutionMethods {
    HAPPINESS,
    HAPPINESSDAY,
    HAPPINESSNIGHT,
    LEVEL,
    TRADE,
    TRADEITEM,
    ITEM,
    ATTACKGREATER,
    ATKDEFEQUAL,
    DEFENSEGREATER,
    SILCOON,
    CASCOON,
    NINJASK,
    SHEDINJA,
    BEAUTY,
    ITEMMALE,
    ITEMFEMALE,
    DAYHOLDITEM,
    NIGHTHOLDITEM,
    HASMOVE,
    HASINPARTY,
    LEVELMALE,
    LEVELFEMALE,
    LOCATION,
    TRADESPECIES,
    LEVELDAY,
    LEVELNIGHT,
    LEVELDARKINPARTY,
    LEVELRAIN,
    HAPPINESSMOVETYPE,
}

var array;
array=array_create(EvolutionMethods.HAPPINESSMOVETYPE);

// these will never (hopefully) be seen by the player so you don't
// absolutely need to localize them
array[EvolutionMethods.HAPPINESS]=add_evolution_method("Happiness", null, "HAPPINESS");
array[EvolutionMethods.HAPPINESSDAY]=add_evolution_method("Happiness: Day", null, "HAPPINESSDAY");
array[EvolutionMethods.HAPPINESSNIGHT]=add_evolution_method("Happiness: Night", null, "HAPPINESSNIGHT");
array[EvolutionMethods.LEVEL]=add_evolution_method("Level", null, "LEVEL");
array[EvolutionMethods.TRADE]=add_evolution_method("Trade", null, "TRADE");
array[EvolutionMethods.TRADEITEM]=add_evolution_method("Trade: Item", null, "TRADEITEM");
array[EvolutionMethods.ITEM]=add_evolution_method("Item", null, "ITEM");
array[EvolutionMethods.ATTACKGREATER]=add_evolution_method("Attack > Defense", null, "ATTACKGREATER");
array[EvolutionMethods.ATKDEFEQUAL]=add_evolution_method("Attack = Defense", null, "ATKDEFEQUAL");
array[EvolutionMethods.DEFENSEGREATER]=add_evolution_method("Attack < Defense", null, "DEFENSEGREATER");
array[EvolutionMethods.SILCOON]=add_evolution_method("Silcoon", null, "SILCOON");
array[EvolutionMethods.CASCOON]=add_evolution_method("Cascoon", null, "CASCOON");
array[EvolutionMethods.NINJASK]=add_evolution_method("Ninjask", null, "NINJASK");
array[EvolutionMethods.SHEDINJA]=add_evolution_method("Shedinja", null, "SHEDINJA");
array[EvolutionMethods.BEAUTY]=add_evolution_method("Beauty", null, "BEAUTY");
array[EvolutionMethods.ITEMMALE]=add_evolution_method("Item: Male", null, "ITEMMALE");
array[EvolutionMethods.ITEMFEMALE]=add_evolution_method("Item: Female", null, "ITEMFEMALE");
array[EvolutionMethods.DAYHOLDITEM]=add_evolution_method("Hold Item: Day", null, "DAYHOLDITEM");
array[EvolutionMethods.NIGHTHOLDITEM]=add_evolution_method("Hold Item: Night", null, "NIGHTHOLDITEM");
array[EvolutionMethods.HASMOVE]=add_evolution_method("Has Move", null, "HASMOVE");
array[EvolutionMethods.HASINPARTY]=add_evolution_method("Has In Party", null, "HASINPARTY");
array[EvolutionMethods.LEVELMALE]=add_evolution_method("Level: Male", null, "LEVELMALE");
array[EvolutionMethods.LEVELFEMALE]=add_evolution_method("Level: Female", null, "LEVELFEMALE");
array[EvolutionMethods.LOCATION]=add_evolution_method("Location", null, "LOCATION");
array[EvolutionMethods.TRADESPECIES]=add_evolution_method("Trade: Species", null, "TRADESPECIES");
array[EvolutionMethods.LEVELDAY]=add_evolution_method("Level: Day", null, "LEVELDAY");
array[EvolutionMethods.LEVELNIGHT]=add_evolution_method("Level: Night", null, "LEVELNIGHT");
array[EvolutionMethods.LEVELDARKINPARTY]=add_evolution_method("Level: Dark in Party", null, "LEVELDARKINPARTY");
array[EvolutionMethods.LEVELRAIN]=add_evolution_method("Level: Rain", null, "LEVELRAIN");
array[EvolutionMethods.HAPPINESSMOVETYPE]=add_evolution_method("Happiness: Has Move of Type", null, "HAPPINESSMOVETYPE");

return array;
