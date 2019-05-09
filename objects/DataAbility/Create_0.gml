event_inherited();

name="Base Ability";
pbs_internal_name="BASEABILITY";
summary="it does something probably";

/*
 * Don't hard-code abilities into the battle system! Do this instead.
 * It's more work now but should save you a lot of trouble if/when you
 * want to change something.
 */

// Inner Focus?
can_flinch=true;
// the confusion and infatuation abilities are going to basically
// be the same thing

// Magnet Pull, Shadow Tag, Arena Trap?
can_escape=scr_true;

// Synchronize, Magic Bounce, Water Veil, Immunity, Limber?
status_acceptance=array_create(MajorStatus.NONE);
array_clear(status_acceptance, StatusAcceptance.YES);
minor_status_acceptance=StatusAcceptance.YES;

// Levitate, Water Absorb, Flash Fire, Lightningrod, Motor Drive,
// Thick Fat, perhaps some others?
damage_from=array_create(array_length_1d(World.all_types));
array_clear(damage_from, 1);

// Blaze, Overgrow, Torrent, Swarm?
low_health_factor=array_create(array_length_1d(World.all_types));
array_clear(low_health_factor, 1);

// Intimidate, weather abilities, terrain abilities, etc?
on_entry=null;
// there are some abilities that do things on exit, i.e. Natural Cure
// and whatever Ho-oh's Hidden Ability is called?

// Static, Cute Charm, Flame Body, Poison Point, Rough Skin?
on_contact=null;

// shed skin, speed boost, things that may happen on the end of
// each round?
on_round_end=null;

/* */
/// constants and stuff

enum StatusAcceptance {
    YES,
    NO,
    MIRROR,
    BOUNCE
}

/* */
/*  */
