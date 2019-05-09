/// @description  void question(string, option0, id0, .. optionn, idn);
/// @param string
/// @param  option0
/// @param  id0
/// @param  .. optionn
/// @param  idn

World.message_text=argument[0];
World.message_text_t=0;

for (var i=1; i<argument_count; i=i+2){
    ds_list_add(World.message_options, argument[i]);
    ds_list_add(World.message_option_ids, argument[i+1]);
}
