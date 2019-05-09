/// @description  int exp_reward(winner, loser);
/// @param winner
/// @param  loser

var a=1;    // 1 if wild pokémon, 1.5 if trainer pokémon, 1 if gen 7 rules
var b=get_pokemon(argument1.species).reward_exp;
var e=1;    // 1 if no lucky egg held, 1.5 if lucky egg held
var f=1;    // 1.2 if two hearts of affection, 1 otherwise
var l=get_pokemon_level(argument1);
var lp=get_pokemon_level(argument0);
var p=1;    // 1 if no experience power is active, (n) for experience point power
var s=2;    // no exp share:
            //   - twice the number of pokémon who have participated in the battle and survived
            // one+ exp share:
            //   - twice the number of pokémon who (have participated in the battle + held exp share)
            // exp all:
            //   - something else, deal with it later
            // THIS WILL REQUIRE THIS FUNCTION TO TAKE MORE PARAMETERS EVENTUALLY
var t=1;    // 1 if this bis ot, 1.5 if domestically obtained, 1.7 if internationally obtained
var v=1;    // 1.2 if should have evolved and gen 6+ rules, 1 otherwise

var level=get_pokemon_level(argument0);
var next=get_experience(level+1, get_pokemon(argument0.species).growth_rate);
var difference=next-argument0.experience;

if (World.settings.battle.use_scaled_exp){
    return floor((a*t*b*e*l*p*f*v)/(7*s));
} else {
    return floor((a*b*l)/(5*s)*(power(3*l+10, 2.5)/power(l+lp+10, 2.5)+1)*t*e*p);
}
