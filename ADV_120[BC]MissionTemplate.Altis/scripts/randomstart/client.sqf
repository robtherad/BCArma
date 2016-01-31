/*
This script will allow a team to be randomly placed at one of any predetermined markers. 

For this script to be effective you will need at least three markers. One marker must be called 'placemark' and must be placed near the team that you wish to be moved. The other two markers can be called anything you want but they must be defined in the server.sqf file in the _markerArray on line 18. If you wish to change the team being moved, change the _ranTeam variable on line 18 in the client.sqf file.

This file receives the randomly selected marker's name from the server and then grabs his position relative to a marker called 'placemark' and places him in the same position relative to the randomly selected marker.

Call this file on ALL CLIENTS from init.sqf using the command below.

[] execVM "scripts\randomstart\client.sqf";

DO NOT FORGET TO CALL THE SERVER SIDE OF THIS SCRIPT FROM INIT.SQF!

[] execVM "scripts\randomstart\server.sqf";
*/
if (isDedicated) exitWith {};
private ["_ranTeam","_placeMarkerPos","_startMarkerPos","_startMark","_startMarkTwo","_text","_color","_dis","_dir","_newPos"];

#include "settings.sqf";
//Get the position of the placement marker. Place this nearby the team that is being moved.
_placeMarkerPos = getMarkerPos "placemark";

//Wait for server to select a marker from the list.
waitUntil {not isNil "bc_randomMarker"};
_startMarkPos = getMarkerPos bc_randomMarker;

//Set up correct info based on team
switch (_ranTeam) do {
    case west: { _text = "BLUFOR Starting Zone"; _color = "ColorBLUFOR";};
    case east: { _text = "OPFOR Starting Zone"; _color = "ColorOPFOR";};
    case independent: { _text = "INDFOR Starting Zone"; _color = "ColorGUER";};
    default { systemChat "[BC] randomstart - Invalid entry for _ranTeam."; _text = "ERROR - Invalid Team"; _color = "ColorCivilian";};
};

//Make sure player is on the correct team.
if (side player == _ranTeam) then {    
    //Boundary marker for starting location
    _startMark = createMarkerLocal ["startZone",_startMarkPos];
    _startMark setMarkerShapeLocal "ELLIPSE";
    _startMark setMarkerSizeLocal [50, 50];
    _startMark setMarkerDirLocal (markerDir bc_randomMarker);
    _startMark setMarkerBrushLocal "SolidBorder";
    _startMark setMarkerColorLocal _color;
    //Text marker for starting location
    _startMarkTwo = createMarkerLocal ["startZoneTwo",_startMarkPos];
    _startMarkTwo setMarkerShapeLocal "ICON";
    _startMarkTwo setMarkerColorLocal "ColorBlack";
    _startMarkTwo setMarkerTypeLocal "hd_dot";
    _startMarkTwo setMarkerDirLocal (markerDir bc_randomMarker);
    _startMarkTwo setMarkerTextLocal _text;
    
    //Find player distance and direction to the placement marker.
    _dis = [player, _placeMarkerPos] call BIS_fnc_distance2D;
    _dir = (([player, _placeMarkerPos] call BIS_fnc_dirTo) + (markerDir bc_randomMarker)) - 180;
    
    //Returns a position that is a specified distance and compass direction from the passed position or object.
    _newPos = [_startMarkPos, _dis, _dir] call BIS_fnc_relPos;
    
    //Move player
    player setPos [(_newPos select 0), (_newPos select 1)];
    player setDir (markerDir bc_randomMarker);
};
