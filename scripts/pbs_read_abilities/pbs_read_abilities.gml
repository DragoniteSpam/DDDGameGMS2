/// @description  array pbs_read_items(filename);
/// @param filename
// the ability pbs is a csv.

var text=file_text_as_list(argument0);

var array=array_create(ds_list_size(text));

for (var i=0; i<ds_list_size(text); i++){
    var terms=split(text[| i], ",", false);
    
    // as far as i know the ability file doesn't have variable entry sizes
    var internal_name=terms[1];
    var name=terms[2];
    var summary=terms[3];
    
    array[i]=add_ability(name, summary, internal_name);
}

ds_list_destroy(text);

return array;
