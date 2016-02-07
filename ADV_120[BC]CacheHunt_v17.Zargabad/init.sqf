//init.sqf - Executed when mission is started (before briefing screen)

//Create briefing
[] execVM "briefing.sqf";

//Set the group IDs
[] call compile preprocessFileLineNumbers "f\setGroupID\f_setGroupIDs.sqf";

//Generate automatic ORBAT briefing page
[] execVM "f\briefing\f_orbatNotes.sqf";

//Call the safeStart
[] execVM "f\safeStart\f_safeStart.sqf";

//Call BC Template
[] execVM "f\bcInit.sqf";

[] execVM "scripts\cache\cache_init.sqf";

//Lower the radio ranges
player setVariable ["tf_sendingDistanceMultiplicator", 0.18];


//Shut off all the lights in Zargabad
_types = ["Lamps_Base_F", "PowerLines_base_F", "Land_PowerPoleWooden_L_F", "Land_PowerPoleWooden_F", "Land_LampHarbour_F", "Land_LampShabby_F", "Land_PowerPoleWooden_L_F", "Land_PowerPoleWooden_small_F", "Land_LampDecor_F", "Land_LampHalogen_F", "Land_LampSolar_F", "Land_LampStreet_small_F", "Land_LampStreet_F", "Land_LampAirport_F","Land_fs_roof_F","Land_fs_sign_F"];

for [{_i=0},{_i < (count _types)},{_i=_i+1}] do
{
    // lightsmarker is a marker I placed. 1000 is the distance around the marker
    _lamps = (getPos areaOp) nearObjects [_types select _i, 5000];
    //sleep 1;
    {_x setDamage 0.95} forEach _lamps;
} forEach _types;