game_has_focus = window_has_focus();

 /*
 * Everything in here is designed to make it easy(er) to
 * create reconfigure - able controls. Default controls act as if
 * you were playing with a gamepad, even if you're not; more
 * inputs can be added fairly easily.
 * Pay no attention to
 * any of this unless you want to change which buttons do what.
 */ 

last_up = up;
last_down = down;
last_left = left;
last_right = right;
last_a = a;
last_b = b;
last_x = x;
last_y = y;
last_l = l;
last_r = r;
last_l2 = l2;
last_r2 = r2;
last_ls = ls;
last_rs = rs;
last_rup = rup;
last_rdown = rdown;
last_rleft = rleft;
last_rright = rright;
last_pup = pup;
last_pdown = pdown;
last_pleft = pleft;
last_pright = pright;
last_start = start;
last_select = select;

// todo get rid of the hard - coded input constants / characters and
// instead make them configurable settings (World.settings.input)

if (gamepad_use && get_controller()){
    // If controller, gather raw input first. Can't be done all in one call because different buttons have
    // different functions to check them.
    ls_x = gamepad_axis_value(0, gp_axislh);
    ls_y = gamepad_axis_value(0, gp_axislv);
    ls_angle = get_stick_angle(ls_x, ls_y);
    ls_magnitude = get_stick_magnitude(ls_x, ls_y);
    up = match_cardinal_direction(ls_angle, ls_magnitude, CompassDirections.north);
    down = match_cardinal_direction(ls_angle, ls_magnitude, CompassDirections.south);
    left = match_cardinal_direction(ls_angle, ls_magnitude, CompassDirections.west);
    right = match_cardinal_direction(ls_angle, ls_magnitude, CompassDirections.east);
    a = gamepad_button_check(0, gp_face1);
    b = gamepad_button_check(0, gp_face2);
    x = gamepad_button_check(0, gp_face3);
    y = gamepad_button_check(0, gp_face4);
    start = gamepad_button_check(0, gp_start);
    select = gamepad_button_check(0, gp_select);
    l = gamepad_button_check(0, gp_shoulderlb);
    r = gamepad_button_check(0, gp_shoulderrb);
    l2 = gamepad_button_check(0, gp_shoulderl);
    r2 = gamepad_button_check(0, gp_shoulderr);
    ls = gamepad_button_check(0, gp_stickl);
    rs = gamepad_button_check(0, gp_stickr);
    pup = gamepad_button_check(0, gp_padu);
    pdown = gamepad_button_check(0, gp_padd);
    pleft = gamepad_button_check(0, gp_padl);
    pright = gamepad_button_check(0, gp_padr);
    rs_x = gamepad_axis_value(0, gp_axisrh);
    rs_y = gamepad_axis_value(0, gp_axisrv);
    rs_angle = get_stick_angle(rs_x, rs_y);
    rs_magnitude = get_stick_magnitude(rs_x, rs_y);
    rup = match_cardinal_direction(rs_angle, rs_magnitude, CompassDirections.north);
    rdown = match_cardinal_direction(rs_angle, rs_magnitude, CompassDirections.south);
    rleft = match_cardinal_direction(rs_angle, rs_magnitude, CompassDirections.west);
    rright = match_cardinal_direction(rs_angle, rs_magnitude, CompassDirections.east);
} else {
    // The keyboard can gather exact input directly from the keyboard, since all button checks are the same
    ls_x = 0;
    ls_y = 0;
    rs_x = 0;
    rs_y = 0;
    up = false;
    down = false;
    left = false;
    right = false;
    a = false;
    b = false;
    x = false;
    y = false;
    start = false;
    select = false;
    l = false;
    r = false;
    l2 = false;
    r2 = false;
    ls = false;
    rs = false;
    pup = false;
    pdown = false;
    pleft = false;
    pright = false;
}

// The keyboard can gather exact input directly from the keyboard, since all button checks are the same
ls_x = ls_x - keyboard_check(ord("A")) + keyboard_check(ord("D"));
ls_y = ls_y - keyboard_check(ord("W")) + keyboard_check(ord("S"));
ls_x -= (keyboard_check(vk_left) - keyboard_check(vk_right));
ls_y -= (keyboard_check(vk_up) - keyboard_check(vk_down));
// Don't need tolerance checks here because keyboard checks are binary.
ls_angle = get_stick_angle(ls_x, ls_y);
up = up || match_cardinal_direction(ls_angle, ls_y, CompassDirections.north);
down = down || match_cardinal_direction(ls_angle, ls_y, CompassDirections.south);
left = left || match_cardinal_direction(ls_angle, ls_x, CompassDirections.west);
right = right || match_cardinal_direction(ls_angle, ls_x, CompassDirections.east);
a = a || (keyboard_check(vk_enter) || mouse_check_button(mb_left));
b = b || (keyboard_check(ord("J")) || mouse_check_button(mb_right));
x = x || keyboard_check(ord("K"));
y = y || keyboard_check(ord("L"));
start = start || keyboard_check(vk_escape);
select = select || keyboard_check(vk_backspace);
l = l || keyboard_check(vk_nokey /*vk_lcontrol*/ ) || mouse_wheel_up();
r = r || keyboard_check(vk_nokey /*vk_rcontrol*/ ) || mouse_wheel_down();
l2 = l2 || keyboard_check(vk_nokey /*vk_lshift*/ );
r2 = r2 || keyboard_check(ord("Z"));
ls = ls || (keyboard_check(vk_nokey /*vk_lalt*/ ) || mouse_check_button(mb_middle));
rs = rs || keyboard_check(vk_nokey /*vk_ralt*/ );
var _u =  -keyboard_check(vk_left) + keyboard_check(vk_right);
var _r =  -keyboard_check(vk_up) + keyboard_check(vk_down);
dpad_angle = get_stick_angle(_u, _r);
pup = pup || match_cardinal_direction(dpad_angle, _r, CompassDirections.north);
pdown = pdown || match_cardinal_direction(dpad_angle, _r, CompassDirections.south);
pleft = pleft || match_cardinal_direction(dpad_angle, _u, CompassDirections.west);
pright = pright || match_cardinal_direction(dpad_angle, _u, CompassDirections.east);
// Mouse: only check these if the cursor is locked (not on a menu or something)
// this will override the gamepad rs_x and rs_y but that's probably okay because
// you probably won't be checking these directly anyway.
rs_x = clamp((window_mouse_get_x() - window_get_width() / 2) / 10,  - 1, 1);
rs_y = clamp((window_mouse_get_y() - window_get_height() / 2) / 10,  - 1, 1);
if (World.settings.input.invert_y){
    rs_y =  -rs_y;
}
if (World.settings.input.invert_x){
    rs_x =  -rs_x;
}
rs_angle = get_stick_angle(rs_x, rs_y);
rs_magnitude = get_stick_magnitude(rs_x, rs_y);
rup = rup || match_cardinal_direction(rs_angle, rs_magnitude, CompassDirections.north);
rdown = rdown || match_cardinal_direction(rs_angle, rs_magnitude, CompassDirections.south);
rleft = rleft || match_cardinal_direction(rs_angle, rs_magnitude, CompassDirections.west);
rright = rright || match_cardinal_direction(rs_angle, rs_magnitude, CompassDirections.east);
// "stick" magnitudes are a binary 1 or 0 with keyboard controls,
// since you can't partially press a key.
// pdate: i have no idea why it looks like this since it completely breaks the left stick if
// a gamepad is actually plugged in.
// ls_magnitude = (up || down || left || right);
ls_magnitude = get_stick_magnitude(ls_x, ls_y);

if (abs(ls_x) < 0.1){
    ls_x = 0;
}
if (abs(ls_y) < 0.1){
    ls_y = 0;
}
if (abs(rs_x) < 0.1){
    rs_x = 0;
}
if (abs(rs_y) < 0.1){
    rs_y = 0;
}

press_up = (!last_up) && up;
press_down = (!last_down) && down;
press_left = (!last_left) && left;
press_right = (!last_right) && right;
press_a = (!last_a) && a;
press_b = (!last_b) && b;
press_x = (!last_x) && x;
press_y = (!last_y) && y;
press_l = (!last_l) && l;
press_r = (!last_r) && r;
press_l2 = (!last_l2) && l2;
press_r2 = (!last_r2) && r2;
press_ls = (!last_ls) && ls;
press_rs = (!last_rs) && rs;
press_rup = (!last_rup) && rup;
press_rdown = (!last_rdown) && rdown;
press_rleft = (!last_rleft) && rleft;
press_rright = (!last_rright) && rright;
press_pup = (!last_pup) && pup;
press_pdown = (!last_rdown) && pdown;
press_pleft = (!last_pleft) && pleft;
press_pright = (!last_pright) && pright;
press_start = (!last_start) && start;
press_select = (!last_select) && select;

release_up = last_up && (!up);
release_down = last_down && (!down);
release_left = last_left && (!left);
release_right = last_right && (!right);
release_a = last_a && (!a);
release_b = last_b && (!b);
release_x = last_x && (!x);
release_y = last_y && (!y);
release_l = last_l && (!l);
release_r = last_r && (!r);
release_l2 = last_l2 && (!l2);
release_r2 = last_r2 && (!r2);
release_ls = last_ls && (!ls);
release_rs = last_rs && (!rs);
release_rup = last_rup && (!rup);
release_rdown = last_rdown && (!rdown);
release_rleft = last_rleft && (!rleft);
release_rright = last_rright && (!rright);
release_pup = last_pup && (!pup);
release_pdown = last_pdown && (!pdown);
release_pleft = last_pleft && (!pleft);
release_pright = last_pright && (!pright);
release_start = last_start && (!start);
release_select = last_select && (!select);