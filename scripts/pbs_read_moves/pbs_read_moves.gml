/// @description  array pbs_read_moves(filename);
/// @param filename
// the move pbs is a csv.

var text=file_text_as_list(argument0);

var array=array_create(ds_list_size(text));

var A=ord("A");
var Z=ord("Z");

for (var i=0; i<ds_list_size(text); i++){
    var terms=split(text[| i], ",", false);
    
    var name="";
    var internal_name="";
    var effect_codes=ARRAY;
    var ai_codes=ARRAY;
    var base_power=50;
    var type=Types.NORMAL;
    var category=MoveCategories.PHYSICAL;
    var accuracy=100;
    var pp=20;
    var effect_chances=array_create(1);
    var target=0;
    var priority=0;
    var flags=0;
    var description="";
    
    switch (array_length_1d(terms)){
        case 14:
            description=terms[13];
        case 13:
            flags=0;
            for (var j=1; j<=string_length(terms[12]); j++){
                var c=string_ord_at(string_upper(terms[12]), j);
                if (is_clamped(c, A, Z)){
                    flags=flags|1<<(c-A);
                }
            }
        case 12:
            priority=real(terms[11]);
        case 11:
            // i could do math on this too but since the values need to be manually mapped to
            // an enum anyway there's not much point
            switch (terms[10]){
                case "00":
                default:
                    target=MoveTargets.ADJACENT;
                    break;
                case "01":
                    target=MoveTargets.NONE;
                    break;
                case "02":
                    target=MoveTargets.ADJACENTRANDOM;
                    break;
                case "04":
                    target=MoveTargets.ALLOPPONENTS;
                    break;
                case "08":
                    target=MoveTargets.ALLNONUSER;
                    break;
                case "10":
                    target=MoveTargets.USER;
                    break;
                case "20":
                    target=MoveTargets.BATTLEFIELD;
                    break;
                case "40":
                    target=MoveTargets.USERTEAM;
                    break;
                case "80":
                    target=MoveTargets.OPPONENTTEAM;
                    break;
                case "100":
                    target=MoveTargets.PARTNER;
                    break;
                case "200":
                    target=MoveTargets.SINGLETEAMMATE;
                    break;
                case "400":
                    target=MoveTargets.SINGLEOPPONENT;
                    break;
                case "800":
                    target=MoveTargets.SINGLEACROSS;
                    break;
            }
        case 10:
            effect_chances[0]=real(terms[9]);
            // status moves, etc. whose effects always trigger have a chance
            // listed as '0' in moves.txt
            if (effect_chances[0]==0){
                effect_chances[0]=100;
            }
        case 9:
            pp=real(terms[8]);
        case 8:
            accuracy=real(terms[7]);
        case 7:
            switch (string_lower(terms[6])){
                case "physical":
                default:
                    category=MoveCategories.PHYSICAL;
                    break;
                case "special":
                    category=MoveCategories.SPECIAL;
                    break;
                case "status":
                    category=MoveCategories.STATUS;
                    break;
            }
        case 6:
            type=get_type_from_name(terms[5], true);
        case 5:
            base_power=real(terms[4]);
        case 4:
            effect_codes=pbs_read_move_function_code(terms[3]);
            // It's possible, if unlikely, that the pbs effect codes are broken up into
            // multiple move effects: thunder fang may paralyze or flinch, for example.
            var ec=effect_chances[0];
            for (var j=array_length_1d(effect_codes)-1; j>=0; j--){
                effect_chances[j]=ec;
            }
            ai_codes=pbs_read_move_ai_code(terms[3]);
        case 3:
            name=terms[2];
        case 2:
            internal_name=terms[1];
    }
    
    array[i]=add_move(name, type, category, pp, base_power, accuracy, priority, target, description, ba_move_basic, effect_codes, effect_chances, flags, ai_codes, internal_name);
}

ds_list_destroy(text);

return array;
