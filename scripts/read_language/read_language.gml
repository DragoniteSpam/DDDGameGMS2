/// @description  void read_language(map, language enum);
/// @param map
/// @param  language enum
/*
 * the 
 */

var f=file_text_open_read(PATH_LANGUAGE);

var codemap=ds_map_create();
for (var i=0; i<array_length_1d(language_codes); i++){
    ds_map_add(codemap, language_codes[i], i);
}

var default_string="";

while (!file_text_eof(f)){
    var line=file_text_read_string(f);
    var index;
    for (index=1; index<=string_length(line); index++){
        if (string_char_at(line, index)=="]"){
            break;
        }
    }
    var code=string_copy(line, 2, index-2);
    var content=string_replace(line, "["+code+"]", "");
    
    if (code=="default"){
        default_string=content;
    }
    
    if (string_length(content)>0){
        ds_map_add(language_text[codemap[? code]], default_string, content);
    }
    
    file_text_readln(f);
}

file_text_close(f);

ds_map_destroy(codemap);
