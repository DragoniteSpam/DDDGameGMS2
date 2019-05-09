/// @description  BattleTeam battle_add_team(Pawn, SpriteSide);
/// @param Pawn
/// @param  SpriteSide

with (instance_create(0, 0, BattleTeam)){
    owner=argument0;
    name=L("%0's Team", owner.name);
    sprite_side=argument1;
    
    argument0.team=id;
    
    return id;
}
