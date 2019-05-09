singleton();

/*
 * Everything in here is designed to make it easy(er) to
 * create reconfigure-able controls. Default controls act as if
 * you were playing with a gamepad, even if you're not; more
 * inputs can be added fairly easily.
 * Pay no attention to
 * any of this unless you want to change which buttons do what.
 */

gamepad_set_button_threshold(0, 0.1);

game_has_focus=window_has_focus();

gamepad_dead_zone=0.1;
gamepad_use=true;

// Joystick information
rs_angle=0;
ls_angle=0;
rs_magnitude=0;
ls_magnitude=0;
rs_x=0;
rs_y=0;
ls_x=0;
ls_y=0;

// Change in joystick information
d_rs_angle=0;
d_ls_angle=0;
d_rs_magnitude=0;
d_ls_magnitude=0;
d_ls_x=0;
d_ls_y=0;
d_rs_x=0;
d_rs_y=0;

// General
hasInput=false;
pressInput=false;
releaseInput=false;

up=false;
down=false;
left=false;
right=false;
a=false;
b=false;
x=false;
y=false;
l=false;
r=false;
l2=false;
r2=false;
ls=false;
rs=false;
rup=false;
rdown=false;
rleft=false;
rright=false;
pup=false;
pdown=false;
pleft=false;
pright=false;
start=false;
select=false;

console=false;
press_console=false;
release_console=false;
last_console=false;

// Previous input
last_up=false;
last_down=false;
last_left=false;
last_right=false;
last_a=false;
last_b=false;
last_x=false;
last_y=false;
last_l=false;
last_r=false;
last_l2=false;
last_r2=false;
last_ls=false;
last_rs=false;
last_rup=false;
last_rdown=false;
last_rleft=false;
last_rright=false;
last_pup=false;
last_pdown=false;
last_pleft=false;
last_pright=false;
last_start=false;
last_select=false;

// Change input
press_up=false;
press_down=false;
press_left=false;
press_right=false;
press_a=false;
press_b=false;
press_x=false;
press_y=false;
press_l=false;
press_r=false;
press_l2=false;
press_r2=false;
press_ls=false;
press_rs=false;
press_rup=false;
press_rdown=false;
press_rleft=false;
press_rright=false;
press_pup=false;
press_pdown=false;
press_pleft=false;
press_pright=false;
press_start=false;
press_select=false;

release_up=false;
release_down=false;
release_left=false;
release_right=false;
release_a=false;
release_b=false;
release_x=false;
release_y=false;
release_l=false;
release_r=false;
release_l2=false;
release_r2=false;
release_ls=false;
release_rs=false;
release_rup=false;
release_rdown=false;
release_rleft=false;
release_rright=false;
release_pup=false;
release_pdown=false;
release_pleft=false;
release_pright=false;
release_start=false;
release_select=false;

// Bound buttons
// todo make this an actual thing at some point
/*gp_bind_a=DEFAULT_GP_A;
gp_bind_b=DEFAULT_GP_B;
gp_bind_x=DEFAULT_GP_X;
gp_bind_y=DEFAULT_GP_Y;
gp_bind_start=DEFAULT_GP_START;
gp_bind_select=DEFAULT_GP_SELECT;
gp_bind_l=DEFAULT_GP_L;
gp_bind_r=DEFAULT_GP_R;
gp_bind_l2=DEFAULT_GP_L2;
gp_bind_r2=DEFAULT_GP_R2;
gp_bind_ls=DEFAULT_GP_LS;
gp_bind_rs=DEFAULT_GP_RS;
gp_bind_padu=DEFAULT_GP_PADU;
gp_bind_padd=DEFAULT_GP_PADD;
gp_bind_padl=DEFAULT_GP_PADL;
gp_bind_padr=DEFAULT_GP_PADR;

mk_bind_a_a=DEFAULT_MK_A_A;
mk_bind_a_b=DEFAULT_MK_A_B;
mk_bind_b=DEFAULT_MK_B;
mk_bind_x=DEFAULT_MK_X;
mk_bind_y=DEFAULT_MK_Y;
mk_bind_start=DEFAULT_MK_START;
mk_bind_select=DEFAULT_MK_SELECT;
mk_bind_l=DEFAULT_MK_L;
mk_bind_r=DEFAULT_MK_R;
mk_bind_l2=DEFAULT_MK_L2;
mk_bind_r2=DEFAULT_MK_R2;
mk_bind_ls=DEFAULT_MK_LS;
mk_bind_rs=DEFAULT_MK_RS;
mk_bind_padu=DEFAULT_MK_PADU;
mk_bind_padd=DEFAULT_MK_PADD;
mk_bind_padl=DEFAULT_MK_PADL;
mk_bind_padr=DEFAULT_MK_PADR;*/

// Labels
cn[JS.LEFT]="Left Stick Left";
cn[JS.RIGHT]="Left Stick Right";
cn[JS.UP]="Left Stick Up";
cn[JS.DOWN]="Left Stick Down";
cn[JS.A]="A";
cn[JS.B]="B";
cn[JS.X]="X";
cn[JS.Y]="Y";
cn[JS.START]="Start";
cn[JS.SELECT]="Select";
cn[JS.LT]="L";
cn[JS.RT]="R";
cn[JS.L2]="L2";
cn[JS.R2]="R2";
cn[JS.LS]="Left Stick";
cn[JS.RS]="Right Stick";
cn[JS.RUP]="Right Stick Up";
cn[JS.RDOWN]="Right Stick Down";
cn[JS.RLEFT]="Right Stick Left";
cn[JS.RRIGHT]="Right Stick Right";
cn[JS.PUP]="D-Pad Up";
cn[JS.PDOWN]="D-Pad Down";
cn[JS.PLEFT]="D-Pad Left";
cn[JS.PDOWN]="D-Pad Down";

/* */
/// Joystick/gamepad constants
enum JS {
    UP,
    DOWN,
    LEFT,
    RIGHT,
    A,
    B,
    X,
    Y,
    START,
    SELECT,
    LT,
    RT,
    L2,
    R2,
    LS,
    RS,
    PUP,
    PDOWN,
    PLEFT,
    PRIGHT,
    RUP,
    RDOWN,
    RLEFT,
    RRIGHT
}

/* */
/// Compass directions
enum CompassDirections {
    east=0,
    northeast=45,
    north=90,
    northwest=135,
    west=180,
    southwest=225,
    south=270,
    southeast=315,
    no=400
}

/* */
/*  */
