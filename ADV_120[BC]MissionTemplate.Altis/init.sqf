//init.sqf - Executed when mission is started (before briefing screen)
if (!didJIP) then {
//Create briefing
[] execVM "briefing.sqf";

//Set the group IDs
[] call compile preprocessFileLineNumbers "f\setGroupID\f_setGroupIDs.sqf";

//Generate automatic ORBAT briefing page
[] execVM "f\briefing\f_orbatNotes.sqf";

//Call the safeStart
[] execVM "f\safeStart\f_safeStart.sqf";

//Call BC Template
[] execVM "f\bcInit.sqf";





// ==================================================
// ==================================================
// DO NOT CALL ANY SCRIPTS BELOW THIS LINE
// ==================================================
// ==================================================
} else {
// MACHINE DID JIP
bc_missionSafeTime = ["f_param_mission_timer",0] call BIS_fnc_getParamValue; //Default - 0 minute safestart
bc_missionRunTime = ["mission_runtime",45] call BIS_fnc_getParamValue; //Default - 45 minute battle phase
bc_missionRuntimeMins = bc_missionRunTime + bc_missionSafeTime;

bc_end_clientWait = [BC_fnc_end_clientWait, 5, []] call CBA_fnc_addPerFrameHandler;
};