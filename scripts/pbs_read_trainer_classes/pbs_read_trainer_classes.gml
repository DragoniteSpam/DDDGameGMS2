/// @description  array pbs_read_trainer_classes(filename);
/// @param filename
// the trainer class pbs is a csv.

var text=file_text_as_list(argument0);

var array=array_create(ds_list_size(text));

for (var i=0; i<ds_list_size(text); i++){
    var terms=split(text[| i], ",", false);
    
    var name="";
    var internal_name="";
    var reward=32;
    var ai=32;
    var battle_bgm=ClassBattleBGM.SILENCE;
    var victory_bgm=ClassVictoryBGM.SILENCE;
    var intro_me=ClassIntroME.SILENCE;
    var gender=Genders.GENDERLESS;
    var index=0;
    var ai_notes=ARRAY;
    
    switch (array_length_1d(terms)){
        case 10:
            if (string_length(terms[9])>0){
                ai_notes=array_compose(terms[9]);
            }
        case 9:
            if (string_length(terms[8])>0){
                ai=real(terms[8]);
            }
        case 8:
            switch (string_lower(terms[7])){
                case "male":
                    gender=Genders.MALE;
                    break;
                case "female":
                    gender=Genders.FEMALE;
                    break;
                case "genderless":
                    gender=Genders.GENDERLESS;
                    break;
            }
        case 7:
            intro_me=get_class_intro_me_from_name(terms[6]);
        case 6:
            victory_bgm=get_class_victory_bgm_from_name(terms[5]);
        case 5:
            battle_bgm=get_class_battle_bgm_from_name(terms[4]);
        case 4:
            if (string_length(terms[3])>0){
                reward=real(terms[3]);
            }
        case 3:
            name=terms[2];
        case 2:
            internal_name=terms[1];
        case 1:
            index=real(terms[0]);
    }
    
    array[i]=add_trainer_class(name, reward, battle_bgm, victory_bgm, intro_me, ai, ai_notes, internal_name, index);
}

ds_list_destroy(text);

return array;
