/// @description  void battle_round_post_major_status_damage(params);
/// @param params
// 0: position

var pkmn=Battle.contestants[| argument0[| 0]];
var amount=0;
var msg="";

switch (pkmn.status){
    case MajorStatus.POISON:
        amount=pkmn.act[Stats.HP]*World.settings.battle.poison_damage;
        msg=L("%0 was hurt by poison!", pkmn.name);
        break;
    case MajorStatus.TOXIC:
        amount=pkmn.act[Stats.HP]*World.settings.battle.toxic_damage_t1*pkmn.status_turn;
        pkmn.status_turn++;
        msg=L("%0 was hurt by poison!", pkmn.name);
        break;
    case MajorStatus.BURN:
        amount=pkmn.act[Stats.HP]*World.settings.battle.burn_damage;
        msg=choose_gender(pkmn.gender, L("%0 was hurt by his burn!", pkmn.name),
            L("%0 was hurt by her burn!", pkmn.name),
            L("%0 was hurt by its burn!", pkmn.name));
        break;
}

// we say != instead of > because there may be some unusual situations where
// you gain hp from this instead of lose
if (amount!=0){
    // i'm guessing this is going to make it so that you can only gain up to
    // full hp, but there are no situations in this battle demo where that
    // would arise so i obviously haven't tested it yet
    amount=max(amount, pkmn.act_hp-pkmn.act[Stats.HP]);
    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_scroll_health, pkmn, amount));
    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, msg));
    battle_round_action_execute_faint_check(individual_actions, pkmn, pkmn, amount);
}

battle_advance();
