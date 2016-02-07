[] execVM "scripts\cache\vehicles\sc_vehFix.sqf"; //DEAD END

if (!isDedicated) then {
	[] execVM "scripts\cache\vehicles\c_lockVehs.sqf"; //DEAD END
    [] execVM "scripts\cache\objectives\c_cacheMarkers.sqf";
};

if (isServer) then {
	[] execVM "scripts\cache\vehicles\s_vehCargo.sqf"; //DEAD END
	[] execVM "scripts\cache\objectives\s_cacheMarkersBlufor.sqf"; //calls c_cacheMarkersBlufor.sqf
};