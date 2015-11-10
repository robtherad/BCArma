/*
When the player dies they will have a hint pop up and display who they were killed by as well as all bc_kills that they got during the mission.

This script is executed every time a unit is killed during the mission. Don't call this script from any init.sqf files.

0 unit: Object - Object the event handler is assigned to
1 killer: Object - Object that killed the unit
Contains the unit itself in case of collisions
*/

//No need for server to be running this script.
if (isDedicated) exitWith {};

_unit = _this select 0;
_killer = _this select 1;

showSubtitles false; //Apparently when you get a team kill it changes this variable?

//Make sure variable 'bc_kills' isn't empty. If so, initialize.
if (isNil {bc_kills}) then {
    bc_kills = "You killed: \n";
    bc_killCount = 0;
    bc_killsStruct = [bc_kills, "\n", "<br/>"] call CBA_fnc_replace;
    missionNamespace setVariable ["bc_killsStruct",bc_killsStruct];
};

//Player has killed.
if (vehicle player == _killer) then {
    //Check for friendly fire
    if (side player == side _unit) then {
        bc_friendly = " - [FRIENDLY]";
        if (player == _unit) then {
            bc_friendly = " - [SELF]";
        };
    } else {
        bc_friendly = "";
    };
    bc_killDist = ceil (_killer distance _unit);
    bc_killCount = bc_killCount + 1;
    //Build string for use in readout.
    bc_kills = bc_kills + str(bc_killCount) + ". " + (name _unit) + " (" + str(bc_killDist) + "m)" + bc_friendly + "\n";
    bc_killsStruct = [bc_kills, "\n", "<br/>"] call CBA_fnc_replace;
    missionNamespace setVariable ["bc_killsStruct",bc_killsStruct];
};

//Player has died.
if (player == _unit) then {
    //Check for friendly fire
    if (side player == side _killer) then {
        bc_friendly = " - [FRIENDLY]";
        if (player == _killer) then {
            bc_friendly = " - [SELF]";
        };
    } else {
        bc_friendly = "";
    };
    bc_killDist = ceil (_killer distance _unit);
    //Commence Readout
    bc_kills = "You were killed by - " + (name _killer) + " (" + str(bc_killDist) + "m)" + bc_friendly + "\n-\n" + bc_kills;
    bc_kills3 = bc_kills;
    bc_killsStruct = [bc_kills, "\n", "<br/>"] call CBA_fnc_replace;
    missionNamespace setVariable ["bc_killsStruct",bc_killsStruct];
    bc_kills2 = [bc_kills3, "\n"] call CBA_fnc_split;
    {
        systemChat format ["%1",_x];
    } forEach bc_kills2;
};