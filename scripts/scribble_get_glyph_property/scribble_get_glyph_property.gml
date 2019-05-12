/// Returns a property value for a character in a font previously added to Scribble
///
/// Three properties are available:
/// 1) SCRIBBLE_GLYPH.X_OFFSET   - The relative x-position to display the glyph
/// 2) SCRIBBLE_GLYPH.Y_OFFSET   - The relative y-position to display the glyph
/// 3) SCRIBBLE_GLYPH.SEPARATION    - The 
///
/// @param fontName    The font name (as a string) of the font
/// @param character   The character (as a string)
/// @param property    The property to return. See description for more details
///
/// All optional arguments accept <undefined> to indicate that the default value should be used.

var _font      = argument0;
var _character = argument1;
var _property  = argument2;

var _font_data = global.__scribble_font_data[? _font ];

var _array = _font_data[ __SCRIBBLE_FONT.GLYPHS_ARRAY ];
if (_array == undefined)
{
    //If the glyph array doesn't exist for this font, use the ds_map fallback
    var _map = _font_data[ __SCRIBBLE_FONT.GLYPHS_MAP ];
    var _glyph_data = _map[? _character ];
}
else
{
    var _glyph_data = _array[ ord(_character) - _font_data[ __SCRIBBLE_FONT.GLYPH_MIN ] ];
}

if (_glyph_data == undefined)
{
    show_error("Scribble:\nCharacter \"" + _character + "\" not found for font \"" + _font + "\"", false);
    return undefined;
}

return _glyph_data[ _property ];