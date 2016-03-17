//init.sqf - Executed when mission is started (before briefing screen)
// Restrict playable area for all sides to `missionArea` trigger
["DefaultArea", [], bc_missionAreaTrig] call bc_areaBoundary_fnc_addArea;
// Create briefing
[] execVM "briefing.sqf";
// Set the group IDs
[] call compile preprocessFileLineNumbers "f\setGroupID\f_setGroupIDs.sqf";
// Generate automatic ORBAT briefing page
[] execVM "f\briefing\f_orbatNotes.sqf";
// Call the safeStart
[] execVM "f\safeStart\f_safeStart.sqf";
// Call BC Template
[] execVM "f\bcInit.sqf";
// ----- Execute any other scripts below this line -----