/*
This file will start all scripts part of the default BC template. Call this file from init.sqf using the following line of code.

[] execVM "f\bcInit.sqf";

*/

//====================================================================================================
//Spawn this in it's own thread or it stops everything called after it
//Disables Group Leader HUD
if (hasInterface) then {
    [] spawn {
        showHUD [true, true, true, true, true, true, false, true];
    };
};

//====================================================================================================
//difficulty Message
if(isServer) then {
    [] spawn {
        sleep 1;
        _diff = "Undefined";
        switch(difficulty) do {
            case 0: {_diff = "Recruit";};
            case 1: {_diff = "Regular";};
            case 2: {_diff = "Veteran";};
            case 3: {_diff = "Elite";};
        };
        _hintStr = "Mission Difficulty Setting = " + _diff;
        [_hintStr,"hint",true,true] call BIS_fnc_MP;
    };
};

//====================================================================================================
//Cancel unneeded calculations
disableRemoteSensors true;

//====================================================================================================
//Pre Briefing Client Scripts
if (!isDedicated) then {
    bc_core_showTags = [BC_fnc_core_showTags, 0.05, []] call CBA_fnc_addPerFrameHandler;
    bc_radHandle1 = [BC_fnc_radio_waitGear, 0.1, []] call CBA_fnc_addPerFrameHandler;
    bc_end_clientWait = [BC_fnc_end_clientWait, 5, []] call CBA_fnc_addPerFrameHandler;
};

//====================================================================================================
//Pre Briefing Server Scripts
if (isServer && isNil "bc_serverInit") then {
    bc_end_checkTime = [BC_fnc_end_checkTime, 10, []] call CBA_fnc_addPerFrameHandler;
    bc_end_checkAlive = [BC_fnc_end_checkAlive, 10, []] call CBA_fnc_addPerFrameHandler;

    bc_serverInit = true; //Set this so that the server stuff only runs once
};

//====================================================================================================
//Wait for mission to start
waitUntil {time > 0};

//====================================================================================================
//Post Briefing Client Scripts
if (!isDedicated) then {
    call BC_fnc_gps_init;
};

//====================================================================================================
//Disable AI contact reports
player setspeaker "NoVoice";
showSubtitles false;
enableSentences false;
enableRadio false;
player disableConversation true;
