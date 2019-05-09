/// @description  int menu_input(n, list size);
/// @param n
/// @param  list size
// search for examples of this script (control+shift+f) to see how it works
// important: argument1 should be the SIZE OF THE LIST. NOT the largest value.
// this script treats the largest value as list size minus one.

if (Controller.release_up){
    return max(--argument0, 0);
} else if (Controller.release_down){
    return min(++argument0, argument1-1);
} else if (Controller.release_left){
    return 0;
} else if (Controller.release_right){
    return argument1-1;
}

return argument0;
