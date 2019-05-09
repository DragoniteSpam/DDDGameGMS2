/// @description  void script_draw_custom(DataEventNode, Entity);
/// @param DataEventNode
/// @param  Entity

var node=argument0;
var entity=argument1;

var base=guid_get(argument0.custom_guid);

// sigh
switch (base.name){
    default:
    case "RemoveItem":
    case "AddItem":
        script_help_draw_text();
        break;
}
