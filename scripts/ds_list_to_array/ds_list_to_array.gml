/// @description  array ds_list_to_array(list);
/// @param list

var array=array_create(ds_list_size(argument0));

for (var i=0; i<ds_list_size(argument0); i++){
    array[i]=argument0[| i];
}

return array;
