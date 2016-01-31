/*
This script will allow a team to be randomly placed at one of any predetermined markers. 

For this script to be effective you will need at least three markers. One marker must be called 'placemark' and must be placed near the team that you wish to be moved. The other two markers can be called anything you want but they must be defined in the server.sqf file in the _markerArray on line 18. If you wish to change the team being moved, change the _ranTeam variable on line 18 in the client.sqf file.

This file is run on the server to randomly select a marker from an array of markers. Once a marker is randomly selected the name of the marker is broadcast to all clients.

Call this file on THE SERVER from init.sqf using the command below.

[] execVM "scripts\randomstart\server.sqf";

DO NOT FORGET TO CALL THE CLIENT SIDE OF THIS SCRIPT FROM INIT.SQF!

[] execVM "scripts\randomstart\client.sqf";
*/
if (!isServer) exitWith {};
//Fill this array with the names of all markers you want to be considered for the randomized start.
#include "settings.sqf";

//Select a marker from the array at random.
bc_randomMarker = _markerArray call BIS_fnc_selectRandom;

//Broadcast the selected marker to all clients on the server.
publicVariable "bc_randomMarker";

//Move any objects which are defined in _objectArray
if (!isNil "_objectArray") then {
    _startMarkPos = getMarkerPos bc_randomMarker;
    _placeMarkerPos = getMarkerPos "placemark";
    {
        if (isNil {_objectArray select _forEachIndex}) then {
            _str = "[randomstart] ERROR - Tried to move non-existent object."; 
            _str remoteExecCall ["systemChat", 0];
        } else { 
            //Find object distance and direction to the placement marker.
            _dis = [_x, _placeMarkerPos] call BIS_fnc_distance2D;
            _dir = (([_x, _placeMarkerPos] call BIS_fnc_dirTo) + (markerDir bc_randomMarker)) - 180;
            
            //Returns a position that is a specified distance and compass direction from the passed position or object.
            _newPos = [_startMarkPos, _dis, _dir] call BIS_fnc_relPos;
            
            //Move object
            _x setPos [(_newPos select 0), (_newPos select 1)];
            _x setDir ((markerDir bc_randomMarker) + (getDir _x));
        };
    } forEach _objectArray;
};