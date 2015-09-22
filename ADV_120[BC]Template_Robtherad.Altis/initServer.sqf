//initServer.sqf - Executed only on server when mission is started.

//[] execVM "scripts\randomstart\server.sqf";
[] execVM "scripts\endconditions\loop.sqf";
[] execVM "scripts\killdisplay\kd_addeventhandler.sqf";

//Displays a hint with the current difficulty setting at mission start
if (isServer) then {
	sleep 1;
	switch(difficulty) do {
		case 0: {diff = "Recruit";};
		case 1: {diff = "Regular";};
		case 2: {diff = "Veteran";};
		case 3: {diff = "Elite";};
	};
	_hintStr = "Mission Difficulty Setting = " + diff;
	[_hintStr,"hint",true,true] call BIS_fnc_MP;
};