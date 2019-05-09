/// @description  scr_help_add_item(guid, quantity);
/// @param guid
/// @param  quantity

var pocket_index=scr_help_get_item_pocket_index(argument0);

if (pocket_index==-1){
    debug("item pocket not found: "+guid_get(argument0).name);
} else {
    var pocket=World.player.inventory[pocket_index];
    var current=scr_help_has_item(argument0);
    
    if (guid_get(argument0).pocket.stackable){
        if (current==-1){
            ds_list_add(pocket, array_compose(argument0, argument1));
        } else {
            var stack=pocket[| current];
            stack[@ 1]=stack[@ 1]+argument1;
            pocket[| current]=stack;
        }
    } else {
        if (current>-1||argument1>1){
            debug("!!! Hey some developer is a big dumb idiot and you tried to give a key item more than once and they should go think about what they've done. event: "+guid_get(event_node_current.parent).name+"/"+event_node_current.name);
        } else {
            ds_list_add(pocket, array_compose(argument0, 1));
        }
    }
}
