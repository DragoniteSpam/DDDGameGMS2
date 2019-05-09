/// @description  string L(text, v0, .. vn);
/// @param text
/// @param  v0
/// @param  .. vn

var text=argument[0];
var lmap=World.language_text[World.language];

if (!ds_map_exists(lmap, text)){
    if (!ds_map_exists(World.language_text_not_found, text)){
        ds_map_add(World.language_text_not_found, text, true);
        debug("Not found in the language text files: "+text+". Perhaps want to re-extract the text?");
    }
} else {
    var text=lmap[? argument[0]];
}

// you can't actually print out a % followed by a number this
// way. if people actually need to do that for some reason i
// might fix it but until then it's staying like this.
for (var i=1; i<argument_count; i++){
    text=string_replace_all(text, "%"+string(i-1), string(argument[i]));
}

return text;
