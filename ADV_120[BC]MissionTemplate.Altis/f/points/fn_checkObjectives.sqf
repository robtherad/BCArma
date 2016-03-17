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
params ["_args", "_handle"];

// Check status of active objectives
if (!isNil "bc_objectiveList") then {
    {
        // Get used params out of x
        _objectiveType = _x select 1;
        _objectiveComplete = _x select 5;
        _nextRuntime = _x select 7;
        
        switch (_objectiveType) do {
            // Args: object to destroy
            case "Kill";
            case "Destroy": {
                if (!_objectiveComplete && (time > _nextRuntime)) then {
                    bc_objectiveList select _forEachIndex set [7,(time+5)];
                    [_x,_forEachIndex] call bc_fnc_obj_destroy;
                };
            };
            
            // Args: escape marker/trigger
            case "Escape": {
                if (!_objectiveComplete && (time > _nextRuntime)) then {
                    bc_objectiveList select _forEachIndex set [7,(time+20)];
                    [_x,_forEachIndex] call bc_fnc_obj_escape;
                };
            };
            
            // DO NOTHING OBJECTIVES - These don't need to be checked at all
            
            // Args: [trigger, sectorVar] -- Needs to run constantly to check sector status
            case "Capture";
            case "Secure": {};
            
            // Args: threshold (between 0 and 100)
            case "Avoid Casualties": {};
            
            default {};
        };
    } forEach bc_objectiveList;
};
