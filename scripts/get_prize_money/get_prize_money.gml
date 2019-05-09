/// @description  double get_prize_money(Pawn);
/// @param Pawn

return get_pawn_level(argument0)*get_trainer_class(get_trainer(argument0.trainer_index).class).reward;
