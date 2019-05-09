/// @description  int scr_help_has_item(guid);
/// @param guid
// refers to the player's inventory; returns the index where the
// item stack can currently be found, or -1 if not found

var pocket_index=scr_help_get_item_pocket_index(argument0);

if (pocket_index==-1){
    debug("item pocket not found: "+guid_get(argument0).name);
} else {
    var pocket=World.player.inventory[pocket_index];
    for (var i=0; i<ds_list_size(pocket); i++){
        var stack=pocket[| i];
        if (stack[0]==argument0){
            return i;
        }
    }
}

return -1;
