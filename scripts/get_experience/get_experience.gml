/// @description  int get_experience(level, growth rate);
/// @param level
/// @param  growth rate

var b=power(argument0, 3);

switch (argument1){
    case GrowthRates.ERRATIC:
        if (argument0<=50){
            return floor(b*(100-argument0));
        } else if (argument0<=68){
            return floor(b*(150-argument0)/100);
        } else if (argument0<=98){
            return floor(b*(floor((1911-10*argument0)/3))/500);
        }
        return floor(b*(160-argument0)/100);
    case GrowthRates.FAST:
        return floor(4*b/5);
    case GrowthRates.MEDIUM_FAST:
        return floor(b);
    case GrowthRates.MEDIUM_SLOW:
        // this gets max'd because of the lovely experience underflow glitch
        return max(floor(6*b/5-15*power(argument0, 2)+100*argument0-140), 1);
    case GrowthRates.SLOW:
        return floor(5*b/4);
    case GrowthRates.FLUCTUATING:
        if (argument0<=15){
            return floor(b*((floor((argument0+1)/3)+24)/50));
        } else if (argument0<=36){
            return floor(b*((argument0+14)/50));
        }
        return floor(b*((floor(argument0/2)+24)/50));
}
