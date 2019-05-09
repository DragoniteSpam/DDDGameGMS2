/// @description  array pbs_read_trainer_classes(filename);
/// @param filename
// the trainer class pbs is a plain text file that isn't in any conventional format.
// some of it's csv-ish.

enum PBSParseTrainerState {
    CLASS,
    NAME,
    SIZE,
    PARTY
}

var state=PBSParseTrainerState.CLASS;
var state_party_index=0;

var text=file_text_as_list(argument0);
var trainer_list=ds_list_create();

var trainer_class, trainer_name, trainer_version, trainer_items, trainer_party;

// This script does error handling (or lack thereof). I'm going to try to add some
// kind of validation to the other pbs files at some point but because developers
// are more likely to mess with the trainer files than the other ones I'm prioritizing these.
var errors=ds_list_create();

for (var i=0; i<ds_list_size(text); i++){
    switch (state){
        case PBSParseTrainerState.CLASS:
            trainer_class=get_trainer_class_from_name(text[| i], true);
            
            if (trainer_class==-1){
                ds_list_add(errors, "not a trainer class in pbs trainers.txt: "+text[| i]);
            }
            
            trainer_name="";
            trainer_version=1;
            trainer_items=ARRAY;
            trainer_party=noone;
            state=PBSParseTrainerState.NAME;
            state_party_index=0;
            break;
        case PBSParseTrainerState.NAME:
            var name_split=split(text[| i], ",");
            switch (array_length_1d(name_split)){
                case 2:
                    trainer_version=real(name_split[2]);
                case 1:
                    trainer_name=name_split[0];
            }
            state=PBSParseTrainerState.SIZE;
            break;
        case PBSParseTrainerState.SIZE:
            var size_split=split(text[| i], ",");
            trainer_party=array_create(real(size_split[0]));
            var n=array_length_1d(size_split);
            if (n>1){
                trainer_items=array_create(n-1);
                array_copy(trainer_items, 0, size_split, 1, n-1);
                for (var j=1; j<n; j++){
                    trainer_items[j-1]=get_item_from_name(size_split[j], true);
                }
            }
            if (array_length_1d(trainer_party)>0){
                state=PBSParseTrainerState.PARTY;
            } else {
                state=PBSParseTrainerState.CLASS;
            }
            break;
        case PBSParseTrainerState.PARTY:
            var terms=split(text[| i], ",");
            
            var name="";
            var species=0;
            var level=5;
            var hold_item=-1;
            var moves=array_create(4);
            array_clear(moves, -1);
            var ability=-1;
            var gender=Genders.MALE;
            var form=0;
            var shiny=false;
            var nature=irandom(array_length_1d(all_natures)-1);
            var ivs=array_compose(10, 10, 10, 10, 10, 10);
            var happiness=70;
            var shadow=false;
            var ball=0;
            
            switch (array_length_1d(terms)){
                case 17:
                    // at some point you probably want to convert this to the internal item name of the
                    // ball instead and assign a ball id to the item, to keep things simple
                    if (string_length(terms[16])>0){
                        ball=real(terms[16]);
                    }
                case 16:
                    if (string_length(terms[15])>0){
                        shadow=boolean(terms[15]);
                    }
                case 15:
                    name=terms[14];
                case 14:
                    if (string_length(terms[13])>0){
                        happiness=real(terms[13]);
                    }
                case 13:
                    if (string_length(terms[12])>0){
                        array_clear(ivs, real(terms[12]));
                    }
                case 12:
                    if (string_length(terms[11])>0){
                        nature=get_nature_from_name(terms[11]);
                        if (nature==-1){
                            ds_list_add(errors, "bad nature in pbs trainers.txt: "+terms[11]+" of "+terms[0]);
                        }
                    }
                case 11:
                    shiny=string_lower(terms[10])=="shiny";
                case 10:
                    if (string_length(terms[9])>0){
                        form=real(terms[9]);
                    }
                case 9:
                    if (string_lower(terms[8])=="m"){
                        gender=Genders.MALE;
                    } else if (string_lower(terms[8])=="f"){
                        gender=Genders.FEMALE;
                    }
                case 8:
                    if (string_length(terms[7])>0){
                        ability=real(terms[7]);
                        if (ability==-1){
                            ds_list_add(errors, "bad ability in pbs trainers.txt: "+terms[7]+" of "+terms[0]);
                        }
                    }
                case 7:
                    if (string_length(terms[6])>0){
                        moves[3]=get_move_from_name(terms[6], true);
                        if (moves[3]==-1){
                            ds_list_add(errors, "bad move in pbs trainers.txt: "+terms[6]+" of "+terms[0]);
                        }
                    }
                case 6:
                    if (string_length(terms[5])>0){
                        moves[2]=get_move_from_name(terms[5], true);
                        if (moves[2]==-1){
                            ds_list_add(errors, "bad move in pbs trainers.txt: "+terms[5]+" of "+terms[0]);
                        }
                    }
                case 5:
                    if (string_length(terms[4])>0){
                        moves[1]=get_move_from_name(terms[4], true);
                        if (moves[1]==-1){
                            ds_list_add(errors, "bad move in pbs trainers.txt: "+terms[4]+" of "+terms[0]);
                        }
                    }
                case 4:
                    if (string_length(terms[3])>0){
                        moves[0]=get_move_from_name(terms[3], true);
                        if (moves[0]==-1){
                            ds_list_add(errors, "bad move in pbs trainers.txt: "+terms[3]+" of "+terms[0]);
                        }
                    }
                case 3:
                    if (string_length(terms[2])>0){
                        hold_item=get_item_from_name(terms[2], true);
                        if (hold_item==-1){
                            ds_list_add(errors, "bad item in pbs trainers.txt: "+terms[2]+" of "+terms[0]);
                        }
                    }
                case 2:
                    if (string_length(terms[1])>0){
                        level=real(terms[1]);
                    }
                case 1:
                    debug(terms[0])
                    species=get_pokemon_from_name(terms[0], true);
                    if (species==-1){
                        ds_list_add(errors, "not a pokémon species in pbs trainers.txt: "+terms[0]);
                    }
            }
            
            var ev_value=min(85, floor(level*1.5));
            var evs=array_compose(ev_value, ev_value, ev_value, ev_value, ev_value, ev_value);
            
            var base=get_pokemon(species);
            if (string_length(name)==0){
                name=base.name;
            }
                    
            if (species>-1){
                trainer_party[state_party_index]=add_trainer_pokemon(species, real(terms[1]), hold_item, moves, ability, gender, form, shiny, nature, ivs, evs, happiness, name, shadow, ball);
            }
            
            if (++state_party_index==array_length_1d(trainer_party)){
                ds_list_add(trainer_list, add_trainer(trainer_name, trainer_class, trainer_version, trainer_items, trainer_party));
                state=PBSParseTrainerState.CLASS;
            }
            break;
    }
}

if (ds_list_size(errors)>0){
    var error_string="";
    for (var i=0; i<ds_list_size(errors); i++){
        error_string=error_string+errors[| i]+N;
    }
    show_error(error_string, true);
}

ds_list_destroy(text);

// we can't tell the number of trainers in the pbs file based on the number of lines in it
// so we have to dynamically grow a list first and then convert the list to an array
var array=ds_list_to_array(trainer_list);
ds_list_destroy(trainer_list);

ds_list_destroy(errors);

return array;
