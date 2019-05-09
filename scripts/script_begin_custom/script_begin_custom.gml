/// @description  void script_begin_custom(DataEventNode, Entity);
/// @param DataEventNode
/// @param  Entity

// I prefer to avoid structures like these but I couldn't think of a way around this
switch (guid_get(argument0.custom_guid).name){
    case "AddItem":
        script_begin_custom_add_item(argument0, argument1);
        break;
    case "RemoveItem":
        script_begin_custom_remove_item(argument0, argument1);
        break;
    default:
        script_begin_custom_unknown(argument0, argument1);
        break;
}
