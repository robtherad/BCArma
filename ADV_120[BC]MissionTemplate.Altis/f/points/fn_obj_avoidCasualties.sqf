// Args: threshold (between 0 and 100)
params ["_container", "_index"];
_container params ["_assignedTeam", "_objectiveType", 
["_argument", nil, [0]],
"_opposingTeam", "_message", "_objectiveComplete", "_holder"];

if (isNil "_argument") exitWith {
    // Argument wasn't a number, this objective is broken.
    bc_objectiveList deleteAt _index;
};

_currentAlive = {side _x isEqualTo _assignedTeam} count allUnits;

// Save variable to _holder in main array so it doesn't need to be looked up every time


// Not in holder, find starting alive count
_startAlive = switch (_assignedTeam) do {
    case west: {bc_aliveStartArray select 0};
    case east: {bc_aliveStartArray select 1};
    case independent: {bc_aliveStartArray select 2};
    default {9999};
};
((bc_objectiveList select _index) select 6) pushBackUnique _startAlive; // Add to objective's array

if ((_currentAlive / _startAlive) isEqualTo _argument) then {
    _holder = (bc_objectiveList select _index) select 6;
    {
        [_holder, "Succeeded"] remoteExecCall ["setTaskState",_x];
    } forEach _assignedTeam;
    {
        [_holder, "Failed"] remoteExecCall ["setTaskState",_x];
    } forEach _opposingTeam;
    
    (bc_objectiveList select _index) set [5,true];
};