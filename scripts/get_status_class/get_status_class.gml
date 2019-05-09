/// @description  MajorStatus get_status_class(BattlePokemon);
/// @param BattlePokemon

if (!alive(argument0)){
    return MajorStatus.FAINT;
}

if (argument0.status==MajorStatus.TOXIC){
    return MajorStatus.POISON;
}

// if you want any other status effects to map onto each other
// do it here

return argument0.status;
