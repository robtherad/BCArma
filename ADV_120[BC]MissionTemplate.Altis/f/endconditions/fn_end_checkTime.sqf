//Get parameters from slotting screen.
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
if ((bc_missionRuntimeMins - 15) <= (time/60) && (bc_alertSoon == 0)) then {
    _hintStr = "15 minutes remaining.";
    call fnc_sectorControl;
    _hintStr remoteExecCall ["bc_fnc__hintThenClear", 0];
    bc_alertSoon = 1;
};
if (bc_missionRuntimeMins <= (time/60) && (bc_alertEnd < 1)) then {
    _hintStr = "The mission time limit has been reached.";
    call fnc_sectorControl;
    _hintStr remoteExecCall ["bc_fnc__hintThenClear", 0];
    bc_alertEnd = bc_alertEnd + 1;
};
if ((bc_missionRuntimeMins + (1*bc_alertOver)) <= (time/60)) then {
    _hintStr = str(1*bc_alertOver) + " minute(s) since limit.";
    call fnc_sectorControl;
    _hintStr remoteExecCall ["bc_fnc__hintThenClear", 0];
    bc_alertOver = bc_alertOver + 1;
};
