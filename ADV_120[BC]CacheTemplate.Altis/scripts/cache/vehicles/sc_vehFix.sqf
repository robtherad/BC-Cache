//This script handles the fixing of vehicles and runs on both the client and the server.
if (!isServer && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

if (!isServer) exitWith {};

#include "veh_settings.sqf";
_vehArray = _vehArray + _heliArray;

while {phx_missionRuntimeMins >= floor(time/60)} do {
	{	
		if ( (_x distance (getMarkerPos "repair") < 150) && ((damage _x)>0) && (local _x) && (((getPosATL _x) select 2)) < 1) then {
			_dmg = damage _x;
			if ((_dmg - .1) <= 0) then {
				_x setDamage 0;
			} else {
				_x setDamage (_dmg-.1);
			};
		};
		if ( (_x distance (getMarkerPos "repair") < 150) && ((fuel _x)<1)&& (local _x)  && (((getPosATL _x) select 2)) < 1) then {
			_fuel = fuel _x;
			if ((_fuel + .1) >= 1) then {
				_x setFuel 1;
			} else {
				_x setFuel (_fuel+.1);
			};
		};
	} forEach _vehArray;
	uisleep 10;
};