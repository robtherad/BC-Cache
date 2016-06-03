//init.sqf - Executed when mission is started (before briefing screen)
if (!didJIP) then {
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

[] spawn {
    waitUntil {CBA_missionTime > 10};
    systemChat " ";
    systemChat "OPFOR are allowed to move freely throughout the AO to prepare their defence. BLUFOR must stay in their starting zone until safestart is over. Read the section '[BC] Mission Notes' in your journal.";
    systemChat " ";
};
} else {
// MACHINE DID JIP
phx_missionSafeTime = ["f_param_mission_timer",0] call BIS_fnc_getParamValue; //Default - 0 minute safestart
phx_missionRunTime = ["mission_runtime",45] call BIS_fnc_getParamValue; //Default - 45 minute battle phase
phx_missionRuntimeMins = phx_missionRunTime + phx_missionSafeTime;

phx_end_clientWait = [phx_fnc_end_clientWait, 5, []] call CBA_fnc_addPerFrameHandler;
};