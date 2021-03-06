if (!isServer) exitWith {};

#include "obj_settings.sqf";

//CALLED FROM s_createCaches.sqf
bc_cacheArray = _cacheArray;
bc_deadCacheArray = [];
publicVariable "bc_deadCacheArray";
publicVariable "bc_cacheArray";
//Check to see when caches are destroyed. Then update marker + display systemChat message to players.
while {true} do {
	{ //forEach bc_cacheArray
		if (!alive _x) then {
			_markerName = str(_x) + "Mark";
			_markerNameVar = _markerName + "Var";
			_markerText = missionNamespace getVariable [_markerNameVar,_markerName];
			//missionNamespace
			//_markerText = _x getVariable ["markerText",_markerName];
			_str = _markerText + " *DESTROYED*";
			missionNamespace setVariable [_markerNameVar,_str,true];
			//_x setVariable [_markerNameVar,_str];
            _realMarkerName = _x getVariable "cacheMarkerName";
			_realMarkerName setMarkerText _str;
			_realMarkerName setMarkerShape "ICON";
			_realMarkerName setMarkerType "hd_dot";
			_realMarkerName setMarkerColor "ColorBLUFOR";
			
			_hintStr = _markerText + " has been destroyed! " + str(count(bc_cacheArray)-1) + " caches remain.";
			[_hintStr,"systemChat"] call BIS_fnc_MP;
				if ((count (bc_cacheArray))-1 == 0) then {
					_hintStr = "All caches have been destroyed! BLUFOR is victorious!";
					[_hintStr,"systemChat"] call BIS_fnc_MP;
				};
			bc_deadCacheArray pushBack _x;
			bc_cacheArray = bc_cacheArray - bc_deadCacheArray;
			publicVariable "bc_deadCacheArray";
			publicVariable "bc_cacheArray";
		};
	} forEach bc_cacheArray;
	if (count bc_cacheArray == 0) then {
		_hintStr = "All caches have been destroyed! BLUFOR is victorious!";
		[_hintStr,"hint"] call BIS_fnc_MP;
	};
	uisleep 5;
};