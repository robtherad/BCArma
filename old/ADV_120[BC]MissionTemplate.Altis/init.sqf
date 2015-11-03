//init.sqf - Executed when mission is started (before briefing screen)

[] execVM "briefing.sqf";

// set the group IDs
[] call compile preprocessFileLineNumbers "f\setGroupID\f_setGroupIDs.sqf";

// Generate automatic ORBAT briefing page
[] execVM "f\briefing\f_orbatNotes.sqf";

//Call the safeStart
[] execVM "f\safeStart\f_safeStart.sqf";

//Call scripts in BC Template
[] execVM "scripts\bc_scripts\bc_init.sqf";
