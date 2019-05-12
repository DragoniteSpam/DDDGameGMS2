/// Adds a standard font definition for Scribble
///
/// Scribble requires all standard fonts to have their .yy file added as an included file
/// This means every time you modify a font you also need to update the included .yy file
///
/// (Including .yy files isn't necessary for spritefonts)
///
/// @param fontName   String name of the font to add
/// @param [path]     File path for the font's .yy file, including the .yy extension, relative to the font directory defined by scribble_init_start()
///                   If not specified, Scribble will look in the root of the font directory

var _font = argument[0];
var _path = global.__scribble_font_directory + ((argument_count > 1)? argument[1] : (_font + ".yy"));

if ( ds_map_exists(global.__scribble_font_data, _font) )
{
    show_error("Scribble:\nFont \"" + _font + "\" has already been defined\n ", false);
    return undefined;
}

if ( !is_string(_font) )
{
    if ( is_real(_font) )
    {
        show_error("Scribble:\nFonts should be initialised using their name as a string.\n(Input was \"" + string(_font) + "\", which might be font \"" + font_get_name(_font) + "\")\n ", false);
    }
    else
    {
        show_error("Scribble:\nFonts should be initialised using their name as a string.\n(Input was an invalid datatype)\n ", false);
    }
    exit;
}

if (asset_get_type(_font) == asset_sprite)
{
    show_error("Scribble:\nTo add a spritefont, please use scribble_init_add_spritefont()\n ", false);
    return scribble_init_add_spritefont(_font);
}

if (asset_get_type(_font) != asset_font)
{
    show_error("Scribble:\nFont \"" + _font + "\" not found in the project\n ", false);
    return undefined;
}

var _data;
_data[ __SCRIBBLE_FONT.NAME         ] = _font;
_data[ __SCRIBBLE_FONT.PATH         ] = _path;
_data[ __SCRIBBLE_FONT.TYPE         ] = __SCRIBBLE_FONT_TYPE.FONT;
_data[ __SCRIBBLE_FONT.GLYPHS_MAP   ] = undefined;
_data[ __SCRIBBLE_FONT.GLYPHS_ARRAY ] = undefined;
_data[ __SCRIBBLE_FONT.GLYPH_MIN    ] = 32;
_data[ __SCRIBBLE_FONT.GLYPH_MAX    ] = 32;
_data[ __SCRIBBLE_FONT.TEXTURE      ] = undefined;
_data[ __SCRIBBLE_FONT.SPACE_WIDTH  ] = undefined;
_data[ __SCRIBBLE_FONT.MAPSTRING    ] = undefined;
_data[ __SCRIBBLE_FONT.SEPARATION   ] = undefined;
global.__scribble_font_data[? _font ] = _data;

show_debug_message("Scribble: Added \"" + _font + "\" as a standard font");