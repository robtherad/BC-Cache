if (!isServer && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

if (!isServer && (faction player != "BLU_F")) exitWith {};

_vehArray = [];
if (!isNil "apc1") then {_vehArray pushBack apc1;};
if (!isNil "apc2") then {_vehArray pushBack apc2;};
if (!isNil "apc3") then {_vehArray pushBack apc3;};
if (!isNil "apc4") then {_vehArray pushBack apc4;};
if (!isNil "apc5") then {_vehArray pushBack apc5;};
if (!isNil "mh9") then {_vehArray pushBack mh9;};
if (!isNil "ch47") then {_vehArray pushBack ch47;};
if (!isNil "ah9") then {_vehArray pushBack ah9;};

while {true} do {
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