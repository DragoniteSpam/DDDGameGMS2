/// @description  double battle_ai_move_score(move id, user, target, [skill]);
/// @param move id
/// @param  user
/// @param  target
/// @param  [skill]

var move=get_move(argument[0]);
var user=argument[1];
var target=argument[2];
var skill=100;

switch (argument_count){
    case 4:
        skill=argument[3];
        break;
}

skill=max(TrainerAI.MINIMUM, skill);

var move_score=100;

for (var i=0; i<ds_list_size(move.ai_score_modification); i++){
    move_score=script_execute(move.ai_score_modification[| i], argument[0], user, target, skill, move_score);
}

// increase priority of attacking moves if ai has no live teammates
if (pokemon_live_teammate_count(user)==0){
    if (skill>=TrainerAI.MEDIUM&&!(skill>=TrainerAI.HIGH&&pokemon_live_teammate_count(target)>0)){
        if (move.value==0){
            move_score=move_score*2/3;
        } else if (pokemon_hp_f(target)<0.5){
            move_score=move_score*3/2;
        }
    }
}

// reduce priority of attacking moves if target is semi-invulnerable
if (target.invulnerable_state!=InvulnerableStates.NONE&&skill>=TrainerAI.HIGH){
    // todo you probably want to implement this if/when you impelement
    // fly, bounce, dig, dive, sky drop, shadow force and/or phantom force
}

// todo Choice items

// todo if user holds a King's Rock increase priority of moves that
// take advantage of its flinch chance (MoveFlgs.ITEM_FLINCH_CHANCE,
// I believe)

// smart trainers should be aware when they're put to sleep
if (user.status==MajorStatus.SLEEP&&skill>=TrainerAI.MEDIUM){
    // todo
}

// smart trainers should know when they're frozen
if (user.status==MajorStatus.FREEZE&&skill>=TrainerAI.MEDIUM){
    // todo MoveFlags.THAWABLE
}

// smart trainers should know when their target is frozen
if (target.status==MajorStatus.FREEZE&&skill>=TrainerAI.MEDIUM){
    // todo unlike "thaw user," "thaw target" is a function code instead
    // of a move flag, so you'll have to look somewhere else if you want
    // to determine this
}

// adjust priority of attacking moves based on their damage output
if (move.value>0){
    var modifier=get_matchup_on(move.type, target, noone, user);
    if (modifier==0||move_score<=0){
        move_score=0;
    } else {
        if (skill>TrainerAI.MEDIUM){
            // todo wonder guard if modifier<2
            
            // todo levitate or magnet rise, according to the Essentials AI, but
            // honestly that should be handled in get_matchup_on
            
            // todo flash fire, which should also be handled in get_matchup_on
            
            // todo water absorb, storm drain, dry skin, get_matchup_on
            
            // todo sap sipper, get_matchup_on
            
            // todo volt absorb, lightning rod, motor drive, get_matchup_on
            
            // this is mine not essentials'
            if (target.ability.on_contact!=null/*which is a script not a value*/){
                move_score=move_score-20;
            }
        }
        
        var output=battle_damage(move, user, target, false, noone, true);
        var accuracy=estimated_accuracy(move, user, target);
        
        output=output*accuracy;
        
        // todo output=output*2/3 if move is to be executed as a two-turn attack
        
        // todo if user has king's rock or razor fang prioritize applicable moves
        // slightly
        
        // todo if user has stench, prioritize non-flinching moves slightly
        
        // if level difference is significant prioritize attacking moves
        if (get_pokemon_level(user)>=1.2*get_pokemon_level(target)){
            output=output*1.2;
        }
        
        var f=output/target.act[Stats.HP];
        
        // moves that are likely to ko are equalized, and the prioritized
        f=min(f, 1.2);
        if (f>1){
            f=f+0.4;
        }
        
        // apply damage
        move_score=move_score+f*100;
    }
} else {
    // reduce priority of moves that don't deal attack, the the chagrin of competitive
    // battlers everywhere
    move_score=move_score-10;
    
    var accuracy=estimated_accuracy(move, user, target);
    move_score=move_score*accuracy;
    
    // if a move is significantly bad don't use it if you know what you're doing
    if (move_score<10&&skill>=TrainerAI.HIGH){
        move_score=0;
    }
}

return max(0, move_score);
