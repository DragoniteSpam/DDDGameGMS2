/// @description  boolean pokemon_can_have_status(BattlePokemon, MajorStatus);
/// @param BattlePokemon
/// @param  MajorStatus

if (argument0.status!=MajorStatus.NONE){
    return false;
}

if (argument1==MajorStatus.NONE){
    return true;
}

// todo some abilities (Corrision) bypass the type check

// There are a lot of conditions to determine whether or not you're
// allowed to pick up a major status condition, so this switch tree
// only detects the ones that would make that a 'no' and the script
// returns true if none of them are met.
switch (argument1){
    case MajorStatus.POISON:
    case MajorStatus.TOXIC:
        if (get_matchup_on(Types.POISON, argument0)==0){
            return false;
        }
        if (has_type(argument0, Types.POISON)){
            return false;
        }
        if (argument0.ability.status_acceptance[argument1]==StatusAcceptance.NO){
            return false;
        }
        break;
    case MajorStatus.BURN:
        // No types are immune to fire but theoretically if any were
        // you'd probably want them to be immune to be immune to burn
        // also.
        if (get_matchup_on(Types.FIRE, argument0)==0){
            return false;
        }
        if (has_type(argument0, Types.FIRE)){
            return false;
        }
        if (argument0.ability.status_acceptance[argument1]==StatusAcceptance.NO){
            return false;
        }
        break;
    case MajorStatus.FREEZE:
        if (argument0.ability.status_acceptance[argument1]==StatusAcceptance.NO){
            return false;
        }
        break;
    case MajorStatus.SLEEP:
        if (argument0.ability.status_acceptance[argument1]==StatusAcceptance.NO){
            return false;
        }
        break;
    case MajorStatus.PARALYZE:
        // I think in Gen 6 Electric types can't be paralyzed but I'm
        // not certain
        if (argument0.ability.status_acceptance[argument1]==StatusAcceptance.NO){
            return false;
        }
        break;
}

return true;
