/// Defines an event - a script that can be executed (with parameters) by an in-line command tag
///
///
///
/// @param name     Event name, as a string
/// @param script   Numerical script index e.g. your_script

var _name   = argument0;
var _script = argument1;

if ( !is_string(_name) )
{
    show_error("Scribble:\nEvent names should be strings.\n(Input to script was \"" + string(_name) + "\")\n ", false);
    exit;
}

if ( !is_real(_script) )
{
    show_error("Scribble:\nScripts should be numerical script indices e.g. scribble_add_event(\"example\", your_script);\n(Input to script was \"" + string(_name) + "\")\n ", false);
    exit;
}

if ( !script_exists(_script) )
{
    show_error("Scribble:\nScript (" + string(_script) + ") doesn't exist!\n ", false);
    exit;
}

if ( ds_map_exists(global.__scribble_colours, _name) )
{
    show_debug_message("Scribble: WARNING! Event name \"" + _name + "\" has already been defined as a colour" );
    exit;
}

if ( ds_map_exists(global.__scribble_flags, _name) )
{
    show_debug_message("Scribble: WARNING! Event name \"" + _name + "\" has already been defined as a flag" );
    exit;
}

var _old_script = global.__scribble_events[? _name ];
if ( is_real(_old_script) )
{
    show_debug_message("Scribble: WARNING! Overwriting event \"" + _name + "\" tied to script \"" + script_get_name(_old_script) + "()\"" );
}

global.__scribble_events[? _name ] = _script;
show_debug_message("Scribble: Tying event \"" + _name + "\" to script \"" + script_get_name(_script) + "()\"" );