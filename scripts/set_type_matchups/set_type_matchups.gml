/// @description  void set_type_matchups(type, typea, matchupa .. typen, matchupn);
/// @param type
/// @param  typea
/// @param  matchupa .. typen
/// @param  matchupn

for (var i=1; i<argument_count; i=i+2){
    type_matchups[argument[0], argument[i]]=argument[i+1];
}
