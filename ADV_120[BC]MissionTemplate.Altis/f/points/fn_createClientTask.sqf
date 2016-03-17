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
//#include "\y\bc\addons\main\script_macros.hpp"
params ["_name", "_long", "_pos"];
private ["_taskVar"];

_taskVar = player createSimpleTask [_name];
_taskVar setSimpleTaskDescription [_long, _name, _name];
if !(_pos isEqualTo locationNull) then {
    _taskVar setSimpleTaskDestination _pos;
};
_taskVar setTaskState "Created";
if (isNil "bc_taskList") then {bc_taskList = [];};
bc_taskList pushBack _taskVar;