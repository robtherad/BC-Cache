/*
Use this script by placing down triggers in the editor. The size of the trigger will be the size of the sectors. The trigger text will be the name of the sector. Place the trigger's name in the array on line 18 called phx_triggerArray. Finally, place two markers somewhere near the mission AO and name them opPointsMark and bluPointsMark. Don't put them too close together or when you zoom out they will overlap.

Make sure the triggers have the following parameters set:

Type - None
Activation - Anybody Repeatedly Present
Condition - this
Timer - Min, Mid, Max all set to 0.
Triggers can be any size, shape and be on any angle.

Call this script on THE SERVER in initServer.sqf with the line

[] execVM "scripts\sectors\server.sqf";
*/
[] execVM "scripts\sectors\clientListen.sqf";
if (!isServer) exitWith {};


phx_triggerArray = [cap1,cap2,cap3];
publicVariable "phx_triggerArray";
//["phx_triggerArray", phx_triggerArray] call CBA_fnc_publicVariable; //Used in f\spect\fn_DrawTags.sqf and fn_DrawMarkers.sqf

//initialize variables
phx_sec_iteration = 0;
phx_westPoints = 0;
phx_eastPoints = 0;
phx_sec_playing = 1;
phx_sec_pointsCounter = 1;
phx_sectorControl = true;
missionNamespace setVariable ["phx_sectorControlActive", true, true]; //Used to check if sector control module is running or not

if (isNil "phx_sec_quickestTime") then {
    //Time in minutes it would take to win if one team owned all points uncontested
    phx_sec_quickestTime = ["sc_quickest_ending",25] call BIS_fnc_getParamValue;
};
phx_endPoints = phx_sec_quickestTime * 60 * (count phx_triggerArray);

//Create markers for players to see whats going on
{//forEach phx_triggerArray
    //Get variables for a marker
    _markerName = str(phx_sec_iteration) + "_mark";
    _markerSize = triggerArea _x;
    _markerPos = getPos _x;

    //Build marker for area
    _marker = createMarker [_markerName,_markerPos];
    _marker setMarkerSize [_markerSize select 0,_markerSize select 1];
    _marker setMarkerDir (_markerSize select 2);
    _marker setMarkerColor "ColorBlack";
    _marker setMarkerBrush "SolidBorder";
    //Get marker's shape
    if(_markerSize select 3) then {
        _marker setMarkerShape "RECTANGLE";
    } else {
        _marker setMarkerShape "ELLIPSE";
    };

    //Build marker for text
    _markerName = str(phx_sec_iteration) + "_markText";
    _marker = createMarker [_markerName,_markerPos];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "hd_dot";
    _marker setMarkerText (triggerText _x + " - Neutral");

    //Set sector status to neutral for later
    _x setVariable ["phx_sec_curOwner",3];
    _x setVariable ["phx_sec_lastOwner",3,true];
    phx_sec_iteration = phx_sec_iteration + 1;
} forEach phx_triggerArray;
sleep 1;

//main loop
while{phx_sec_playing == 1} do {
    phx_sec_iteration = 0;
    {//forEach phx_triggerArray
        private ["_sidePastOwned","_sideLastOwned","_textMarkerName","_bgMarkerName","_westCount","_eastCount","_sideCurOwned"];
        //Get owner of the cap from the last time it was checked
        _sidePastOwned = _x getVariable "phx_sec_curOwner";
        _sideLastOwned = _x getVariable "phx_sec_lastOwner";

        //Get marker names
        _textMarkerName = str(phx_sec_iteration) + "_markText";
        _bgMarkerName = str(phx_sec_iteration) + "_mark";

        //Figure out who dominates the sector - Use faction so TK's don't mess things up
        _westCount = {(alive _x) && (faction _x == "BLU_F")} count list _x;
        _eastCount = {(alive _x) && (faction _x == "OPF_F")} count list _x;

        //Western Controlled - 0
        if(_westCount > _eastCount) then {
            _sideCurOwned = 0;
            if (_sideCurOwned == _sidePastOwned) then {
                phx_westPoints = phx_westPoints + (1*(count phx_triggerArray));
            } else {
                _textMarkerName setMarkerText (triggerText _x + " - BLUFOR Controlled");
                _bgMarkerName setMarkerColor "ColorBLUFOR";
                _x setVariable ["phx_sec_lastOwner",_sideCurOwned,true];
            };
        };

        //Eastern Controlled - 1
        if(_eastCount > _westCount) then {
            _sideCurOwned = 1;
            if (_sideCurOwned == _sidePastOwned) then {
                phx_eastPoints = phx_eastPoints + (1*(count phx_triggerArray));
            } else {
                _textMarkerName setMarkerText (triggerText _x + " - OPFOR Controlled");
                _bgMarkerName setMarkerColor "ColorOPFOR";
                _x setVariable ["phx_sec_lastOwner",_sideCurOwned,true];
            };
        };

        //Contested Objective - 2
        if((_westCount == _eastCount) && (_westCount != 0)) then {
            _sideCurOwned = 2;
            _textMarkerName setMarkerText (triggerText _x + " - CONTESTED");
            _bgMarkerName setMarkerColor "ColorBlack";
            _x setVariable ["phx_sec_lastOwner",_sideCurOwned,true];
        };

        //Neutral Objective - 3
        if((_westCount == _eastCount) && (_westCount == 0)) then {
            _sideCurOwned = 3;
            //For objectives that a side controls but no longer occupies
            if (_sideLastOwned == 0) then {
                phx_westPoints = phx_westPoints + (1*(count phx_triggerArray));
            };
            if (_sideLastOwned == 1) then {
                phx_eastPoints = phx_eastPoints + (1*(count phx_triggerArray));
            };
        };

        //Set current owner
        _x setVariable ["phx_sec_curOwner",_sideCurOwned];

        //Sector has changed sides
        if ((_sideCurOwned != _sideLastOwned) && (_sideCurOwned != 3)) then {
            [[_sideCurOwned, _x],"scripts\sectors\client.sqf"] remoteExecCall ["BIS_fnc_execVM", 0];
        };
        //++ for marker names
        phx_sec_iteration = phx_sec_iteration + 1;
        sleep 1;
    } forEach phx_triggerArray;

    //Update score markers in upper right
    _opfPercent = round (((phx_eastPoints / phx_endPoints)*100)*100) / 100;
    _bluPercent = round (((phx_westPoints / phx_endPoints)*100)*100) / 100;
    phx_bluText = "BLUFOR - " + str(phx_westPoints) + " / " + str(phx_endPoints) + " - (" + str(_bluPercent) + "%)";
    phx_opfText = "OPFOR - " + str(phx_eastPoints) + " / " + str(phx_endPoints) + " - (" + str(_opfPercent) + "%)";
    "bluPointsMark" setMarkerText phx_bluText;
    "opPointsMark" setMarkerText phx_opfText;
    publicVariable "phx_bluText";
    publicVariable "phx_opfText";
    //["phx_bluText", phx_bluText] call CBA_fnc_publicVariable; //Used in sectors\clientListen.sqf
    //["phx_opfText", phx_opfText] call CBA_fnc_publicVariable; //Used in sectors\clientListen.sqf

    //Throw a reminder hint at key point values
    if ((phx_westPoints >= ((phx_endPoints / 4) * phx_sec_pointsCounter)) || (phx_eastPoints >= ((phx_endPoints / 8) * phx_sec_pointsCounter))) then {
        _currentState = 4;
        [[_currentState,phx_sec_pointsCounter,phx_westPoints,phx_eastPoints,phx_endPoints],"scripts\sectors\client.sqf"] remoteExecCall ["BIS_fnc_execVM", 0];
        phx_sec_pointsCounter = phx_sec_pointsCounter + 1;
    };
    //Ending conditions
    if (phx_westPoints >= phx_endPoints) then {
        _currentState = 5;
        [[_currentState,phx_sec_pointsCounter,phx_westPoints,phx_eastPoints,phx_endPoints],"scripts\sectors\client.sqf"] remoteExecCall ["BIS_fnc_execVM", 0];
        phx_sec_playing = 0;
    };
    if (phx_eastPoints >= phx_endPoints) then {
        _currentState = 6;
        [[_currentState,phx_sec_pointsCounter,phx_westPoints,phx_eastPoints,phx_endPoints],"scripts\sectors\client.sqf"] remoteExecCall ["BIS_fnc_execVM", 0];
        phx_sec_playing = 0;
    };
};
