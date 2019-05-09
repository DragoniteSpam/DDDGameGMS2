/// @description  int scr_help_get_item_pocket_index(guid);
/// @param guid
// returns the index of the item pocket, or -1 if it doesn't exist

var pocket=guid_get(argument0).pocket;
for (var i=0; i<array_length_1d(Database.all_item_pockets); i++){
    if (Database.all_item_pockets[i]==pocket){
        return i;
    }
}

return -1;
