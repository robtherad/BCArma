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
params ["_assignedTeam", "_objectiveType", "_argument", "_opposingTeam", "_message", "_objectiveCompleted"];
private ["_task", "_name", "_long", "_pos"];

_holder = [];

switch (_objectiveType) do {
    // Args: [object, identifier string];
    case "Kill";
    case "Destroy": {
        // ASSIGNED TEAM
        if ((_argument select 0) isKindOf "Man") then {
            if (isNil {_argument select 1}) then {
                _argument set [1,(name (_argument select 0))];
            };
            _name = "Kill";
            _long = format["Kill the unit, %1.", _argument select 1];
            _pos = locationNull;
        } else {
            if (isNil {_argument select 1}) then {
                _argument set [1,""];
            };
            _name = "Destroy";
            _long = format["Destroy the marked object. %1", _argument select 1];
            _pos = getPos (_argument select 0);
        };
        {
            [_name, _long, _pos] remoteExec ["bc_fnc_createClientTask", _x];
        } forEach _assignedTeam;
        
        // Reset variables
        _name = nil;
        _long = nil;
        _pos = nil;
        
        // OPPOSING TEAM
        if !((_argument select 0) isKindOf "Man") then {
            if (isNil {_argument select 1}) then {
                _argument set [1,""];
            };
            _name = "Defend";
            _long = format["Defend the marked object. %1", _argument select 1];
            _pos = getPos (_argument select 0);
        };
        if (!isNil "_name" && !isNil "_long" && !isNil "_pos") then {
            {
                [_name, _long, _pos] remoteExec ["bc_fnc_createClientTask", _x];
            } forEach _opposingTeam;
        };
    };
    
    // Args: [trigger, sectorVar] -- Needs to run constantly to check sector status
    case "Capture";
    case "Secure": {
        // ASSIGNED TEAM
        _name = "Capture";
        _long = "Capture and secure area near the marked location.";
        _pos = getPos (_argument select 0);
        {
            [_name, _long, _pos] remoteExec ["bc_fnc_createClientTask", _x];
        } forEach _assignedTeam;
        
        // OPPOSING TEAM
        _name = "Prevent Capture";
        _long = "The other team is going to try to capture the marked objective. Hold onto the objective.";
        _pos = getPos (_argument select 0);
        {
            [_name, _long, _pos] remoteExec ["bc_fnc_createClientTask", _x];
        } forEach _opposingTeam;
    };
    
    // Args: [escape position]
    case "Escape": {
        _name = "Escape";
        _long = "Escape the AO and rally at the marked location.";
        _pos = getPos (_argument select 0);
        {
            [_name, _long, _pos] remoteExec ["bc_fnc_createClientTask", _x];
        } forEach _assignedTeam;
    };
    
    // Args: [threshold (between 0 and 100)]
    case "Avoid Casualties": {
        _name = "Avoid Casualties";
        _long = format["Your commander has told you that excessive casualties are not acceptable in this situation. If your unit takes more than %1 percent casualties your commander may have you relieved of your command.",_argument select 0];
        _pos = locationNull;
        {
            [_name, _long, _pos] remoteExec ["bc_fnc_createClientTask", _x];
        } forEach _assignedTeam;
    };  
};

if (isNil "bc_objectiveList") then {bc_objectiveList = [];};
bc_objectiveList pushBack [_assignedTeam, _objectiveType, _argument, _opposingTeam, _message, false, _holder];