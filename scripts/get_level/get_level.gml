/// @description  int get_level(experience, growth rate);
/// @param experience
/// @param  growth rate

// this script used to be a glorious abuse of the postfix operator, but, alas, it didn't work.
// so i had no choice but to write less stupid code.
// but its memory shall live on in this comment.

/*
 * var n=0;
 * while (get_experience(1+n++, argument1)<=argument0){
 * }
 *
 * return n;
 */

var n=1;

while (argument0>=get_experience(1+n, argument1)){
    n++;
}

return n;
