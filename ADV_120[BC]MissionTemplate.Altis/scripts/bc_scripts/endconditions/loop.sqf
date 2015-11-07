/*
Once called this script will loop over and over only on the server until the mission ends. It will count how many players are alive on each side and once a team is eliminated it will display a hint on all clients screens. 

It will also use the mission time limit set during the slotting screen as a time limit for the mission. When the time limit is 15 minutes from being reached it will display a hint warning all clients. Then, once the time limit is reached it will display another hint informing all players. For every 5 minutes after the time limit it will display another hint to all players.

If you want this mission to work with different teams than OPFOR and BLUFOR just comment out the teams you don't want and uncomment the teams you do want.

Call this file on THE SERVER from bc_init.sqf using the command below.

[] execVM "scripts\bc_scripts\endconditions\loop.sqf";
*/
if (!isServer) exitWith {};
uisleep 5;

//Get parameters from slotting screen.
_missionSafeTime = ["f_param_mission_timer",0] call BIS_fnc_getParamValue; //Default - 0 minute safestart
_missionRunTimeMins = ["mission_runtime",45] call BIS_fnc_getParamValue; //Default - 45 minute battle phase
_missionRuntimeMins = _missionRuntimeMins + _missionSafeTime;
_alertOver = 1; // Time elapsed warning
_alertEnd = 0; // Time elapsed warning
_alertSoon = 0; // 15 minute warning

uisleep 1;

while {true} do {
	//BLUFOR dead
	_aliveBlue = {faction _x == "BLU_F"} count allUnits;
	if (_aliveBlue == 0) then {
		["BLUFOR has been eliminated.","hint",true,true] call BIS_fnc_MP;
	};
	uisleep 3;
	
	//REDFOR dead
	_aliveRed = {faction _x == "OPF_F"} count allUnits;
	if (_aliveRed == 0) then {
		["OPFOR has been eliminated.","hint",true,true] call BIS_fnc_MP;
	};
	uisleep 3;
	
	//GREENFOR dead
	/*
	_aliveGreen = {faction _x == "IND_F"} count allUnits;
	if (_aliveGreen == 0) then {
		["INDFOR has been eliminated.","hint",true,true] call BIS_fnc_MP;
	};
	uisleep 2;
	*/
	
	//Time Limits
	if ((_missionRuntimeMins - 15) <= (time/60) && (_alertSoon == 0)) then {
		_hintStr = "There are only 15 minutes remaining until the time limit of " + str(paramsArray select 3) + " minutes is reached.";
		[_hintStr,"systemChat",true,true] call BIS_fnc_MP;
		_alertSoon = 1;
	};
	if (_missionRuntimeMins <= (time/60) && (_alertEnd == 0)) then {
		_hintStr = "The mission time limit of " + str(paramsArray select 3) + " minutes has been reached.";
		[_hintStr,"systemChat",true,true] call BIS_fnc_MP;
		_alertEnd = _alertEnd + 1;
	};
	if ((_missionRuntimeMins + (1*_alertOver)) <= (time/60)) then {
		_hintStr = "The mission is " + str(1*_alertOver) + " minute(s) past the time limit of " + str(paramsArray select 3) + " minutes.";
		[_hintStr,"systemChat",true,true] call BIS_fnc_MP;
		_alertOver = _alertOver + 1;
	};
	uisleep 4;
};

