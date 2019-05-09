/// @description  BattleExecutableAction bi_no_use(user, item);
/// @param user
/// @param  item

var user=argument0;
var item=argument1;

message(L("%0 does not have an implemented effect yet!", get_item(item).name));

return noone;
