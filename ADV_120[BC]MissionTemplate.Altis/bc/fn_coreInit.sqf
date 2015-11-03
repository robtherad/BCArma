/*
This file will start all scripts part of the default BC template. Call this file from init.sqf using the following line of code.

[] execVM "bc\bc_init.sqf";
*/
bc_startTime = diag_tickTime;
call BC_fnc_radioInit;

//These scripts only execute on clients
if (!isDedicated) then {
	[] execVM "bc\nametag\tags.sqf";
	[] execVM "bc\gpsmarkers\client.sqf";
	call BC_fnc_load_set;
};

//These scripts only execute on the server and only run once
if (isServer && isNil "serverInit") then {
	[] execVM "bc\endconditions\loop.sqf";
	call BC_fnc_kd_addKilledEH;
	serverInit = true; //Set this to that the server stuff only runs once
	
	//Displays a hint with the current mission's difficulty setting
	if (isServer) then {
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
player setspeaker "NoVoice";
showSubtitles false; 
enableSentences false;
enableRadio false;
player disableConversation true;

//Experimental Command
disableRemoteSensors true;

//Disable group icons in bottom left as SL
showHUD [true, true, true, true, true, true, false, true];