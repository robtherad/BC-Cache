#include "obj_settings.sqf";
bc_cachesPlaced = true;
{
    _mark = _x getVariable ["cacheMarkerName",nil];
    if ( isNil "_mark" ) then { bc_cachesPlaced = false; };
} forEach _cacheArray;

if (!isNil "bc_cachesDeployed" && bc_cachesPlaced) then {
    [bc_cacheMarkersEH] call CBA_fnc_removePerFrameHandler;
    {
        _markerName = str(_x) + "MarkVar";
        _markerText = missionNamespace getVariable [_markerName,_markerName];
        _markerPosVar = str(_x) + "MarkPos";
        _cacheMarkerName = _x getVariable "cacheMarkerName";
        _pos = getMarkerPos _cacheMarkerName;
        missionNamespace setVariable [_markerPosVar,_pos];
        
        //Add local eventhandler to crates
        _x  addEventHandler["handleDamage",{ 
            _obj = _this select 0;
            if (_this select 4 == "SatchelCharge_Remote_Ammo") then{
                _obj removeAllEventHandlers "HandleDamage";
                _return = 1;
            } else{
                _return = 0;
            };
            _return
        }]; 
        
        if (side player == east) then {
            _markerstr = _x getVariable "cacheMarkerName";
            _markerstr setMarkerShapeLocal "ICON";
            _markerstr setMarkerTypeLocal "hd_dot";
            _markerstr setMarkerTextLocal _markerText;
            _markerstr setMarkerColorLocal "ColorOPFOR";
        };
    } forEach _cacheArray;
};