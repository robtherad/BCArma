// Args: [trigger]
params ["_container", "_index"];
_container params ["_assignedTeam", "_objectiveType", "_argument", "_opposingTeam", "_message", "_objectiveComplete", "_holder"];

// SECURE SECTOR
// Get information about sector
_defenderOwned = (_argument select 0) select 2 in _opposingTeam;
_defendersInArea = {side _x in _opposingTeam && [_argument select 1, _x] call BIS_fnc_inTrigger} count allUnits;

if (!_defenderOwned) then {
    // Attackers control zone.
    if (isNil {(bc_objectiveList select _index) select 6}) then {
        (bc_objectiveList select _index) set [6,time];
    } else {
        // Defenders don't control 
        _time = (bc_objectiveList select _index) select 6;
        if ( ((time > _time+300) && (_defendersInArea isEqualTo 0)) || ((time > _time+600) && (_defendersInArea > 0)) ) then {
            if (!(_defenderOwned) ) then {
            
            };
        };
    };
} else {
    // Defenders control zone.
    if (bc_objectiveList select _index) select 6;
};

// TODO: Add support for markers and triggers without using BI sector module?