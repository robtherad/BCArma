// Args: escape marker/trigger
params ["_container", "_index"];
_container params ["_assignedTeam", "_objectiveType", "_argument", "_opposingTeam", "_message", "_objectiveComplete", "_holder"];

_escapees = {side _x in _assignedTeam && [_argument select 1, _x] call BIS_fnc_inTrigger} count allUnits;
_aliveTeam = {side _x in _assignedTeam} count allUnits;