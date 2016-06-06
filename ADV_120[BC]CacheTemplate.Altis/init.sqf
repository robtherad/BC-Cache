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
[] execVM "f\phxInit.sqf";

//Call the cache scripts
if (isServer) then {
	[] execVM "scripts\cache\objectives\s_cacheMarkersBlufor.sqf"; //calls c_cacheMarkersBlufor.sqf
};


[] execVM "scripts\randomstart\client.sqf";
[] execVM "scripts\randomstart\server.sqf";

[] execVM "scripts\veh_lock\veh_lock.sqf";
[] execVM "scripts\veh_cargo\veh_cargo.sqf";

[] execVM "scripts\veh_repair.sqf";