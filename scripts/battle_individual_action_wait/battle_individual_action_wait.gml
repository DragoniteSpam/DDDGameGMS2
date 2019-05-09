/// @description  void battle_individual_action_wait(params);
/// @param params
// 0: time (seconds)
// [1]: continue automatically after wait period?

var params=argument0;

if (ds_list_size(params)==1){
    wait(params[| 0]);
} else {
    wait(params[| 0], params[| 1]);
}
