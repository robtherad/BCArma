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

_randomTeamArray = []; //

//Select a marker from each array at random then broadcast to all clients
if (_randomizeWest && (count _markerArrayWest > 0)) then { 
    bc_randomMarkerWest = _markerArrayWest call BIS_fnc_selectRandom; 
    publicVariable "bc_randomMarkerWest";
    _randomTeamArray pushBack [_placeMarkerWest, bc_randomMarkerWest, _objectArrayWest , "WEST"];
};
if (_randomizeEast && (count _markerArrayEast > 0)) then { 
    bc_randomMarkerEast = _markerArrayEast call BIS_fnc_selectRandom; 
    publicVariable "bc_randomMarkerEast";
    _randomTeamArray pushBack [_placeMarkerEast, bc_randomMarkerEast, _objectArrayEast, "EAST"];
};
if (_randomizeIndependent && (count _markerArrayIndependent > 0)) then { 
    bc_randomMarkerIndependent = _markerArrayIndependent call BIS_fnc_selectRandom; 
    publicVariable "bc_randomMarkerIndependent";
    _randomTeamArray pushBack [_placeMarkerIndependent, bc_randomMarkerIndependent, _objectArrayIndependent, "INDEPENDENT"];
};

{ //forEach _randomTeamArray

    // Unpack variables
    _placeMark = _x select 0;
    _randomMark = _x select 1;
    _objectArray = _x select 2;
    _teamName = _x select 3;
    
    //Move any objects which are defined in _objectArray
    if (count _objectArray > 0) then {
        _startMarkPos = getMarkerPos _randomMark;
        _placeMarkerPos = getMarkerPos _placeMark;
        {
            if (isNil {_objectArray select _forEachIndex}) then {
                _str = "[randomstart] ERROR - Tried to move non-existent object for team: " + _teamName; 
                _str remoteExecCall ["systemChat", 0];
            } else { 
                //Find object distance and direction to the placement marker.
                _dis = _x distance2D _placeMarkerPos;
                _dir = ((_x getDir _placeMarkerPos) + (markerDir _randomMark)) - 180;
                
                //Returns a position that is a specified distance and compass direction from the passed position or object.
                _newPos = _startMarkPos getPos [_dis, _dir];
                
                //Move object
                _x setPos [(_newPos select 0), (_newPos select 1)];
                _x setDir ((markerDir _randomMark) + (getDir _x));
            };
        } forEach _objectArray;
    };
} forEach _randomTeamArray;