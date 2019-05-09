/// @description  void script_proceed_custom(DataEventNode, Entity);
/// @param DataEventNode
/// @param  Entity

var node=argument0;
var entity=argument1;

var base=guid_get(argument0.custom_guid);

// sigh
switch (base.name){
    default:
    case "AddItem":
    case "RemoveItem":
        cutscene_begin(argument0.outbound[| 0], argument1);
        break;
}
