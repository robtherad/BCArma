/*
Once called this script will loop over and over only on the server until the mission ends. It will count how many players are alive on each side and once a team is eliminated it will display a hint on all clients screens. 

It will also use the mission time limit set during the slotting screen as a time limit for the mission. When the time limit is 15 minutes from being reached it will display a hint warning all clients. Then, once the time limit is reached it will display another hint informing all players. For every 5 minutes after the time limit it will display another hint to all players.

If you want this mission to work with different teams than OPFOR and BLUFOR just comment out the teams you don't want and uncomment the teams you do want.

Call this file from initServer.sqf using the command below.

[] execVM "scripts\endconditions\loop.sqf";
*/
if (!isServer) exitWith {};

//Needs to be a sleep or the script tries to check the trigger during the briefing screen
sleep 5;
_missionSafeTime = ["f_param_mission_timer",0] call BIS_fnc_getParamValue;
_missionRunTimeMins = ["mission_runtime",45] call BIS_fnc_getParamValue;
_missionRuntimeMins = _missionRuntimeMins + _missionSafeTime;
_alertOver = 1; // Time elapsed warning
_alertEnd = 0; // Time elapsed warning
_alertSoon = 0; // 15 minute warning

sleep 1;
if (isNil "sectorControl") then {
	//Check to see if the sector control script is running.
	sectorControl = false;
};

fnc_sectorControl = {
	if (sectorControl) then {
		_opfPercent = round ((((eastPoints) / (endPoints))*100)*100) / 100;
		_bluPercent = round ((((westPoints) / (endPoints))*100)*100) / 100;
		
		_opfPercentStr = parseText format [" - (%1&#37;)",_opfPercent];
		_bluPercentStr = parseText format [" - (%1&#37;)",_bluPercent];
		
		hint parseText format["<t>%5<br/><br/>Sector Points<br/>BLUFOR - %1 / %2 - (%3&#37;)<br/>OPFOR - %4 / %2 - (%5&#37;)</t>",westPoints,endPoints,_bluPercent,eastPoints,_opfPercent,_hintStr];
		_hintStr = _hintStr + "\n\n\nSector Points\nBLUFOR - " + str(westPoints) + " / " + str(endPoints) + str(_bluPercentStr) + "\n" + "OPFOR - " + str(eastPoints) + " / " + str(endPoints) + str(_opfPercentStr);
	};
};

while {true} do {
	//BLUFOR dead
	_aliveBlue = {faction _x == "BLU_F"} count allUnits;
	if (_aliveBlue == 0) then {
		["BLUFOR has been eliminated.","hint",true,true] call BIS_fnc_MP;
	};
	sleep 3;
	
	//REDFOR dead
	_aliveRed = {faction _x == "OPF_F"} count allUnits;
	if (_aliveRed == 0) then {
		["OPFOR has been eliminated.","hint",true,true] call BIS_fnc_MP;
	};
	sleep 3;
	
	//GREENFOR dead
	/*
	_aliveGreen = {faction _x == "IND_F"} count allUnits;
	if (_aliveGreen == 0) then {
		["INDFOR has been eliminated.","hint",true,true] call BIS_fnc_MP;
	};
	sleep 2;
	*/
	
	//Time Limits
	if ((_missionRuntimeMins - 15) <= (time/60) && (_alertSoon == 0)) then {
		_hintStr = "There are only 15 minutes remaining until the time limit of " + str(paramsArray select 3) + " minutes is reached.";
		call fnc_sectorControl;
		[_hintStr,"hint",true,true] call BIS_fnc_MP;
		_alertSoon = 1;
	};
	if (_missionRuntimeMins <= (time/60) && (_alertEnd <= 4)) then {
		_hintStr = "The mission time limit of " + str(paramsArray select 3) + " minutes has been reached.";
		//Check to see if the sector control script is running and if it is then add information from that script to the message
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
	sleep 4;
};

