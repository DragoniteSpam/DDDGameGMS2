/// @description  scr_help_add_item(guid, quantity);
/// @param guid
/// @param  quantity

var pocket_index=scr_help_get_item_pocket_index(argument0);

if (pocket_index==-1){
    debug("item pocket not found: "+guid_get(argument0).name);
} else {
    var pocket=World.player.inventory[pocket_index];
    var current=scr_help_has_item(argument0);
    
    if (current==-1){
        debug("you tried to remove "+string(argument1)+" x "+guid_get(argument0).name+" but you don't have any");
    } else {
        if (guid_get(argument0).pocket.stackable){
            var stack=pocket[| current];
            stack[@ 1]=stack[@ 1]-argument1;
            pocket[| current]=stack;
            if (stack[@ 1]<=0){
                ds_list_delete(pocket, current);
            }
        } else {
            // at this point you already know that the item exists in your inventory
            ds_list_delete(pocket, current)
        }
    }
}
