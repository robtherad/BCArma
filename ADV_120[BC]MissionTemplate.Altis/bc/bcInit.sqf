/*
This file will start all scripts part of the default BC template. Call this file from init.sqf using the following line of code.

[] execVM "bc\bc_init.sqf";
*/

//These scripts only execute on clients
if (!isDedicated) then {
	bc_core_showTags = [BC_fnc_core_showTags, 0, []] call CBA_fnc_addPerFrameHandler;
    bc_radHandle1 = [BC_fnc_radio_waitGear, 0, []] call CBA_fnc_addPerFrameHandler;
    bc_end_clientWait = [BC_fnc_end_clientWait, 5, []] call CBA_fnc_addPerFrameHandler;
};

//These scripts only execute on the server and only run once
if (isServer && isNil "bc_serverInit") then {
	bc_end_checkTime = [BC_fnc_end_checkTime, 10, []] call CBA_fnc_addPerFrameHandler;
    bc_end_checkAlive = [BC_fnc_end_checkAlive, 10, []] call CBA_fnc_addPerFrameHandler;
	call BC_fnc_core_addKilledEH;
    
    bc_serverInit = true; //Set this so that the server stuff only runs once
};

waitUntil {time > 0};

if (isServer && bc_serverInit) then {
    //Displays a hint with the current mission's difficulty setting
    switch(difficulty) do {
        case 0: {diff = "Recruit";};
        case 1: {diff = "Regular";};
        case 2: {diff = "Veteran";};
        case 3: {diff = "Elite";};
    };
    _hintStr = "Mission Difficulty Setting = " + diff;
    [_hintStr,"hint",true,true] call BIS_fnc_MP;
    
    bc_serverInit = false; //Make it false so that the second server function only runs once
};

if (!isDedicated) then {
    call BC_fnc_gps_init;
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