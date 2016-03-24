//init.sqf - Executed when mission is started (before briefing screen)

// Activates the trigger used for the mission area. Delete the line below and the trigger if you want no mission boundary.
if (hasInterface) then {bc_playerBoundsCheck_PFH = [BC_fnc_core_playerBoundsCheck, 5, []] call CBA_fnc_addPerFrameHandler;};

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