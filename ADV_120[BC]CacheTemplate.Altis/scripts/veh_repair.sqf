//This script handles the fixing of vehicles and runs on both the client and the server.
_exitScript = false;
if (!isServer) then {
    if (side player != west) then {_exitScript = true};
};
if (_exitScript) exitWith {};
_exitScript = nil;

_vehArray = [apc1,apc2,apc3,apc4,hmmv,ah9,mh9,ch47];

while {bc_missionRuntimeMins >= floor(time/60)} do {
	{ // forEach _vehArray;
        if (local _x) then {
            if ( (_x distance (getMarkerPos "repair") < 50) && ((((getPosATL _x) select 2)) < 1) ) then {
                _dmg = damage _x;
                _fuel = fuel _x;
                // DMG
                if (_dmg>0) then {
                    if ((_dmg - .1) <= 0) then {
                        _x setDamage .2;
                        _x setDamage 0;
                    } else {
                        _x setDamage (_dmg-.1);
                    };
                };
                // FUEL
                if (_fuel<1) then {
                    if ((_fuel + .1) >= 1) then {
                        _x setFuel 1;
                    } else {
                        _x setFuel (_fuel+.1);
                    };
                };
                // MSG
                _dmg = damage _x;
                _fuel = fuel _x;
                if ( hasInterface && ((_dmg > 0) || (_fuel < 1)) && (_x == vehicle player)) then {
                    systemChat format["Repairing: (%1/100) || Refuelling: (%2/100)",floor(abs(_dmg-1)*100),floor(_fuel*100)];
                };
            };
        };
	} forEach _vehArray;
	uisleep 10;
};