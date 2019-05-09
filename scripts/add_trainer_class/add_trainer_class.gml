/// @description  DataMove add_trainer_class(name, reward, battle bgm, victory bgm, intro me, ai, ai notes, internal name, index);
/// @param name
/// @param  reward
/// @param  battle bgm
/// @param  victory bgm
/// @param  intro me
/// @param  ai
/// @param  ai notes
/// @param  internal name
/// @param  index
// there may be some move flags and stuff added later

with (instance_create(0, 0, DataTrainerClass)){
    name=argument0;
    reward=argument1;
    audio_battle=argument2;
    audio_victory=argument3;
    audio_intro=argument4;
    ai=argument5;
    
    for (var i=0; i<array_length_1d(argument6); i++){
        ds_list_add(ai_notes, argument6[i]);
    }
    
    pbs_internal_name=argument7;
    index=argument8;
    
    return id;
}
