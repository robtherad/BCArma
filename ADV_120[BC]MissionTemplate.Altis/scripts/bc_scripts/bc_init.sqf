/*
This file will start all scripts part of the default BC template. Call this file from init.sqf using the following line of code.

[] execVM "scripts\bc_scripts\bc_init.sqf";
*/

//These scripts only execute on clients
if (!isDedicated) then {
	[] execVM "scripts\bc_scripts\nametag\tags.sqf";
	[] execVM "scripts\bc_scripts\gpsmarkers\client.sqf";
	[] execVM "scripts\bc_scripts\loadout\setLoadout.sqf";
	[] execVM "scripts\bc_scripts\radios\client.sqf";
};

//These scripts only execute on the server and only run once
if (isServer && isNil "serverInit") then {
	[] execVM "scripts\bc_scripts\endconditions\loop.sqf";
	[] execVM "scripts\bc_scripts\killdisplay\kd_addeventhandler.sqf";
	[] execVM "scripts\bc_scripts\radios\server.sqf";
	serverInit = true; //Set this to that the server stuff only runs once
	
	//Displays a hint with the current mission's difficulty setting
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
};

//Attempt to eliminate AI contact reports
waitUntil {!(isNull player) && time > 1}; 
player setspeaker "NoVoice";
showSubtitles false; 
enableSentences false;
enableRadio false;
player disableConversation true;

//Experimental Command
disableRemoteSensors true;

//Disable group icons in bottom left as SL
showHUD [true, true, true, true, true, true, false, true];