//Get parameters from slotting screen.
_missionSafeTime = ["f_param_mission_timer",0] call BIS_fnc_getParamValue; //Default - 0 minute safestart
_missionRunTimeMins = ["mission_runtime",45] call BIS_fnc_getParamValue; //Default - 45 minute battle phase
_missionRuntimeMins = _missionRuntimeMins + _missionSafeTime;
_alertOver = 1; // Time elapsed warning
_alertEnd = 0; // Time elapsed warning
_alertSoon = 0; // 15 minute warning

bc_sectorControl = missionNamespace getVariable "bc_sectorControlActive";
if (isNil "bc_sectorControl") then {	//Check to see if the sector control script is running.
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
if ((_missionRuntimeMins - 15) <= (time/60) && (_alertSoon == 0)) then {
    _hintStr = "There are only 15 minutes remaining until the time limit of " + str(paramsArray select 3) + " minutes is reached.";
    call fnc_sectorControl;
    [_hintStr,"hint",true,true] call BIS_fnc_MP;
    _alertSoon = 1;
};
if (_missionRuntimeMins <= (time/60) && (_alertEnd < 1)) then {
    _hintStr = "The mission time limit of " + str(paramsArray select 3) + " minutes has been reached.";
    call fnc_sectorControl;
    [_hintStr,"hint",true,true] call BIS_fnc_MP;
    _alertEnd = _alertEnd + 1;
};
if ((_missionRuntimeMins + (1*_alertOver)) <= (time/60)) then {
    _hintStr = "The mission is " + str(1*_alertOver) + " minute(s) past the time limit of " + str(paramsArray select 3) + " minutes.";
    call fnc_sectorControl;
    [_hintStr,"hint",true,true] call BIS_fnc_MP;
    _alertOver = _alertOver + 1;
};