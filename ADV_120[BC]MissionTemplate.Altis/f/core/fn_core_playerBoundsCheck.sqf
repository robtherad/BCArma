// Check if player is out of bounds - Requires a trigger named 'bc_missionAreaTrig' to exist
_playerInBounds = [bc_missionAreaTrig, player] call BIS_fnc_inTrigger;
if (isNil "bc_playerWarnedCount") then {bc_playerWarnedCount = 0};
if (!_playerInBounds && isNil "bc_isSpectator") then {
    bc_playerWarnedCount = bc_playerWarnedCount + 1;
    titleText ["WARNING!\n\nYou are outside of the mission area. Return immediately or YOU WILL BE KILLED!","PLAIN"];
    //Give player 5 iterations to get back into the playable area
    if (bc_playerWarnedCount > 5) then {
        player setDamage 1;
    };
} else {
    //reset player warning count since he's back in bounds
    if (bc_playerWarnedCount > 0) then {
        titleText ["","PLAIN DOWN",0.1];
        bc_playerWarnedCount = 0;
    };
    //player is a spectator, exit this PFH loop
    if (!isNil "bc_isSpectator") then {
        [bc_playerBoundsCheck_PFH] call CBA_fnc_removePerFrameHandler;
    };
};