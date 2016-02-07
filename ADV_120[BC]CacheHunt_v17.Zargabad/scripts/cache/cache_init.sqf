[] execVM "scripts\cache\sc_vehFix.sqf"; //DEAD END

if (!isDedicated) then {
	[] execVM "scripts\cache\c_lockVehs.sqf"; //DEAD END
    [] execVM "scripts\cache\c_cacheMarkers.sqf";
};

if (isServer) then {
	//[] execVM "scripts\cache\s_createCaches.sqf"; //calls c_cacheMarkers.sqf, s_watchCaches.sqf
	[] execVM "scripts\cache\s_vehCargo.sqf"; //DEAD END
	[] execVM "scripts\cache\s_cacheMarkersBlufor.sqf"; //calls c_cacheMarkersBlufor.sqf
};