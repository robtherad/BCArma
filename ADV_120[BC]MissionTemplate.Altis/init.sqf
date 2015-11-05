//init.sqf - Executed when mission is started (before briefing screen)
waitUntil {!isNull player};

[] execVM "briefing.sqf";

// set the group IDs
[] call compile preprocessFileLineNumbers "f\setGroupID\f_setGroupIDs.sqf";

// Generate automatic ORBAT briefing page
[] execVM "f\briefing\f_orbatNotes.sqf";

//Call the safeStart
[] execVM "f\safeStart\f_safeStart.sqf";

[] execVM "bc\bcInit.sqf";
