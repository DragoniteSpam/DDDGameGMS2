/// @description  void draw_pokemon_details(BattlePokemon);
/// @param BattlePokemon
// this only draws the list, it does not control it. you most
// likely want to use menu_input in conjunction with this.

if (argument0==-1){
    return false;
}

var base_species=get_pokemon(argument0.species);

var half_width=400;
var half_height=272;
var start_x=W/2-half_width;
var start_y=H/2-half_height;
var picture_width=sprite_get_width(argument0.spr_front);
var picture_height=sprite_get_height(argument0.spr_front);
var picture_buffer=16;
var content_x=start_x+picture_width;
var content_y=start_y;
var content_middle=content_x+half_width-picture_width/2-picture_buffer;

draw_rectangle_9s(spr_window9s_hgss, start_x, start_y, half_width*2, half_height*2);

// todo if you have a major status, tint the sprite the way your battle
// sprite would be
var c=World.major_status_colors[argument0.status];
draw_sprite_general(argument0.spr_front, 0, 0, 0, picture_width, picture_height, start_x+picture_buffer, H/2-picture_height/2, 1, 1, 0, c, c, c, c, 1);

draw_set_font(FGameMediumLarge);
draw_set_halign(fa_center);

var text=argument0.name;

if (argument0.name!=base_species.name){
    text=text+" ("+base_species.name+")";
}

draw_text(content_middle, start_y+48, string_hash_to_newline(text));

var symbol_x=content_middle-string_width(string_hash_to_newline(text))/2-sprite_get_width(spr_gender)*2-16;
draw_sprite_ext(spr_gender, argument0.gender, symbol_x, start_y+48, 2, 2, 0, c_white, 1);
symbol_x=symbol_x-sprite_get_width(spr_major_status)-16;
if (!alive(argument0)){
    draw_major_status(MajorStatus.FAINT, symbol_x, start_y+48);
} else {
    draw_major_status(argument0.status, symbol_x, start_y+48);
}

draw_set_font(FGameMedium);

// this feels off-centered but i can't for the life of me figure out why
// that would be, the math is really simple
var level=get_pokemon_level(argument0);
draw_text(start_x+picture_width/2, H/2+picture_height*0.6, string_hash_to_newline(L("Lv.")+" "+string(level)));
if (level<MAX_LEVEL){
    var to_next=get_experience(level+1, base_species.growth_rate)
    draw_text(start_x+picture_width/2, H/2+picture_height*0.6+64, string_hash_to_newline(L("%0#to next", string_commas(to_next-argument0.experience, true))));
}

draw_set_halign(fa_left);
var text=L("Item:");
draw_text_colour(content_x+picture_buffer, start_y+320, string_hash_to_newline(text), c_blue, c_blue, c_blue, c_blue, 1);
var text_width=string_width(string_hash_to_newline(text+" "));
if (argument0.item==-1){
    draw_text_colour(content_x+picture_buffer+text_width, start_y+320, string_hash_to_newline(L("(none)")), c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
} else {
    draw_text(content_x+picture_buffer+text_width, start_y+320, string_hash_to_newline(get_item(argument0.item).name));
}

text=L("Ability:");
var text_width=string_width(string_hash_to_newline(text+" "));
draw_text_colour(content_x+picture_buffer, start_y+448, string_hash_to_newline(text), c_blue, c_blue, c_blue, c_blue, 1);
draw_text(content_x+picture_buffer+text_width, start_y+448, string_hash_to_newline(argument0.ability.name));
draw_set_valign(fa_top);
draw_text_ext(content_x+picture_buffer, start_y+480-16, string_hash_to_newline(argument0.ability.summary), -1, half_width*2-picture_width-picture_buffer*2);
if (argument0.item!=-1){
    draw_text_ext(content_x+picture_buffer, start_y+352-16, string_hash_to_newline(get_item(argument0.item).summary), -1, half_width*2-picture_width-picture_buffer*2);
}

draw_set_valign(fa_center);

var stat_text=ds_list_create();
ds_list_add(stat_text, L("HP:"), L("Attack:"), L("Defense:"), L("Sp. Attack:"), L("Sp. Defense:"), L("Speed:"));

var nature=get_nature(argument0.nature);

for (var i=0; i<ds_list_size(stat_text); i++){
    if (i==Stats.HP){
        var bar_height=16;
        var bar_length=160;
        var yy=start_y+96+32*i;
        draw_text(content_x+picture_buffer, yy, string_hash_to_newline(stat_text[| i]));
        draw_text(content_x+picture_buffer+160, yy, string_hash_to_newline(string(argument0.act_hp)+"/"+string(argument0.act[i])));
        draw_health_bar(content_x+picture_buffer+80, yy+32-bar_height/2, content_x+picture_buffer+80+bar_length, yy+32+bar_height/2, pokemon_hp_f(argument0));
    } else {
        if (nature.affects[i]>1){
            var nc=c_red;
        } else if (nature.affects[i]<1){
            var nc=c_blue;
        } else {
            var nc=c_black;
        }
        draw_text_colour(content_x+picture_buffer, start_y+96+32*(i+1), string_hash_to_newline(stat_text[| i]), nc, nc, nc, nc, 1);
        if (argument0.mods[i]>0){
            var mc=c_red;
            var mtext=" (+"+string(argument0.mods[i])+")";
        } else if (argument0.mods[i]<0){
            var mc=c_blue;
            var mtext=" ("+string(argument0.mods[i])+")";
        } else {
            var mc=c_black;
            var mtext="";
        }
        draw_text_colour(content_x+picture_buffer+160, start_y+96+32*(i+1), string_hash_to_newline(string(floor(argument0.act[i]*math_mod(argument0, i)))+mtext), mc, mc, mc, mc, 1);
    }
}

ds_list_destroy(stat_text);

var width_category=sprite_get_width(spr_move_category);
var width_type=sprite_get_width(spr_move_type);

draw_text_colour(content_middle, start_y+96, string_hash_to_newline(L("Moves")), c_blue, c_blue, c_blue, c_blue, 1);
for (var i=0; i<array_length_1d(argument0.moves); i++){
    if (argument0.moves[i]==-1){
        draw_text(content_middle, start_y+128+32*i, string_hash_to_newline("---"));
    } else {
        var base_move=get_move(argument0.moves[i]);
        var f=argument0.move_pp[i]/total_move_pp(argument0, i);
        if (f>=0.5){
            var c=c_black;
        } else if (f>=0.25){
            var c=c_orange;
        } else if (f>0){
            var c=merge_color(c_red, c_orange, 0.5);
        } else {
            var c=c_red;
        }
        var yy=start_y+128+32*i;
        draw_text_colour(content_middle, yy, string_hash_to_newline(base_move.name), c, c, c, c, 1);
        draw_move_category(base_move.category, W/2+half_width-picture_buffer-width_category, yy);
        draw_type(base_move.type, W/2+half_width-picture_buffer-width_category-width_type, yy);
    }
}

draw_text_colour(content_middle, start_y+288, string_hash_to_newline(nature.name), c_blue, c_blue, c_blue, c_blue, 1);
draw_text(content_middle+string_width(string_hash_to_newline(nature.name+" ")), start_y+288, string_hash_to_newline(L("nature")));
