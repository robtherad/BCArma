/*
Add a function for adding different types of objectives:
    [team, type, args, opposing team, (OPTIONAL) message] call bc_fnc_addObjective;
    
    [west, "Kill", obj3, east, "Destroy the enemy weapon's cache."] call bc_fnc_addObjective;
    
    Objective Types:
    
        "Kill" / "Destroy" - Eliminate supplied object. - "Defend"
        "Capture" / "Secure" - Remove all of the enemy from supplied location. - "Defend"
        "Escape" - Get all of the team to supplied location. - "Eliminate"
        
It should add the objectives using the BI task system as well as create all markers and add the objectives to the points system.
*/
#include "\y\bc\addons\main\script_macros.hpp"
params [
    ["_assignedTeam", nil, [[], sideUnknown], []], 
    ["_objectiveType", nil, [""]], 
    ["_argument",nil, [[]], []], 
    ["_opposingTeam", nil, [[], sideUnknown], []]
];

if (!isServer) exitWith {};

if (isNil "_assignedTeam") exitWith {};
if (isNil "_objectiveType") exitWith {};
if (isNil "_argument") exitWith {};
if (isNil "_opposingTeam") exitWith {};


_errorFound = false;

// Validate array of assigned teams
if (IS_ARRAY(_assignedTeam)) then {
    {
        if !(IS_SIDE(_x)) then {
            _errorFound = true;
            BC_LOGERROR_2("addObjective: Non-team in opposing teams array: %1 -- %2",_x,_this);
        };
    } forEach _assignedTeam;
};
if (_errorFound) exitWith {};

// Validate array of opposing teams
if (IS_ARRAY(_opposingTeam)) then {
    {
        if !(IS_SIDE(_x)) then {
            _errorFound = true;
            BC_LOGERROR_2("addObjective: Non-team in opposing teams array: %1 -- %2",_x,_this);
        };
    } forEach _opposingTeam;
};
if (_errorFound) exitWith {};

// Validate objective type
if !(_objectiveType in _objectiveArray) then {
    _errorFound = true;
    BC_LOGERROR_2("addObjective: Invalid objective type: %1 -- %2",_objectiveType,_this);
};
if (_errorFound) exitWith {};

// Search objective list to ensure no duplicates are being added
{
    if ( (_x select 0 isEqualTo _assignedTeam) && (_x select 1 isEqualTo _objectiveType) && (_x select 2 isEqualTo _argument) ) then {
        _errorFound = true;
        BC_LOGERROR_1("addObjective: Tried to add duplicate objective: %1",_this);
    };
} forEach bc_objectiveList;
if (_errorFound) exitWith {}; 

// Convert sides to array of sides if necessary. Keeps uniformity throughout process.
if (IS_SIDE(_assignedTeam)) then {_assignedTeam = [_assignedTeam];};
if (IS_SIDE(_opposingTeam)) then {_opposingTeam = [_opposingTeam];};

// bc_objectiveList pushBack [_assignedTeam, _objectiveType, _argument, _opposingTeam, false];

[_assignedTeam, _objectiveType, _argument, _opposingTeam] call bc_fnc_createObjective;