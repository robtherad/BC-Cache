bc_sectorControl = missionNamespace getVariable "bc_sectorControlActive";
if (isNil "bc_sectorControl") then {    //Check to see if the sector control script is running.
    bc_sectorControl = false;
};

//Function that adds the current point totals to hint popups when the sector control script is running.
fnc_sectorControl = {
    if (bc_sectorControl) then {
        _opfPercent = round ((((bc_eastPoints) / (bc_endPoints))*100)*100) / 100;
        _bluPercent = round ((((bc_westPoints) / (bc_endPoints))*100)*100) / 100;

        _opfPercentStr = parseText format [" - (%1&#37;)",_opfPercent];
        _bluPercentStr = parseText format [" - (%1&#37;)",_bluPercent];

        _hintStr = _hintStr + "\n\n\nSector Points\nBLUFOR - " + str(bc_westPoints) + " / " + str(bc_endPoints) + str(_bluPercentStr) + "\n" + "OPFOR - " + str(bc_eastPoints) + " / " + str(bc_endPoints) + str(_opfPercentStr);
    };
};

//Time Limits
if ((_missionRuntimeMins - 15) <= (time/60) && (bc_alertSoon == 0)) then {
    _hintStr = "There are only 15 minutes remaining until the time limit of " + str(bc_missionRunTime) + " minutes is reached.";
    call fnc_sectorControl;
    _hintStr remoteExecCall ["hint", 0];
    bc_alertSoon = 1;
};
if (_missionRuntimeMins <= (time/60) && (bc_alertEnd < 1)) then {
    _hintStr = "The mission time limit of " + str(bc_missionRunTime) + " minutes has been reached.";
    call fnc_sectorControl;
    _hintStr remoteExecCall ["hint", 0];
    bc_alertEnd = bc_alertEnd + 1;
};
if ((_missionRuntimeMins + (1*bc_alertOver)) <= (time/60)) then {
    _hintStr = "The mission is " + str(1*bc_alertOver) + " minute(s) past the time limit of " + str(bc_missionRunTime) + " minutes.";
    call fnc_sectorControl;
    _hintStr remoteExecCall ["hint", 0];
    bc_alertOver = bc_alertOver + 1;
};
