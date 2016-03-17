// Args: object to destroy
params ["_container", "_index"];
_container params ["_assignedTeam", "_objectiveType", "_argument", "_opposingTeam", "_message", "_objectiveComplete", "_holder"];

if (!alive _argument) then {
    // Objective destroyed
    (bc_objectiveList select _index) set [5,true];
    _holder = (bc_objectiveList select _index) select 6;
    {
        [_holder, "Succeeded"] remoteExecCall ["setTaskState",_x];
    } forEach _assignedTeam;
    {
        [_holder, "Failed"] remoteExecCall ["setTaskState",_x];
    } forEach _opposingTeam;
    
    (bc_objectiveList select _index) set [5,true];
};