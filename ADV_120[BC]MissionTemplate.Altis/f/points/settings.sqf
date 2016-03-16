/* ----------------------------------------------------------------------------
Instructions: For each team fill out the variables. These determine the automatic objectives for those teams.

_isteamPlaying: Determines if the points script will track the team's statistics for display in the mission ending screen. <BOOLEAN>
_endWhenDeadTeam: Determines if the mission should end when this team is dead. Useful for missions with three teams where one team dying/surviving shouldn't effect the mission's end. If false for all three teams, mission ends when only one team is left. <BOOLEAN>
_canteamWithdraw: Determines if the team should be allowed to withdraw or not. Should probably be false for defending teams. <BOOLEAN>
---------------------------------------------------------------------------- */

// ===================
// west - BLUFOR
_isWestPlaying = true;
_endWhenDeadWest = false;
_canWestWithdraw = true;

// ===================
// east - OPFOR
_isEastPlaying = true;
_endWhenDeadEast = false;
_canEastWithdraw = false;

// ===================
// independent - INDFOR
_isGuerPlaying = false;
_endWhenDeadGuer = false;
_canGuerWithdraw = false;

// Don't edit anything below this point
// ===================

if (isNil "bc_waitForOneTeam") then {
    _sum = 0;
    {
        if (_x) then {_sum = _sum + 1;};
    } forEach [_endWhenDeadWest, _endWhenDeadEast, _endWhenDeadGuer];
    if !(_sum > 0) then {
        bc_waitForOneTeam = true;
    } else {
        bc_waitForOneTeam = false;
    }:
};