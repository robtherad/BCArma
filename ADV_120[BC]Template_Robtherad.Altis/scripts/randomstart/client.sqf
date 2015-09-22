/*
This script will allow a team to be randomly placed at one of any predetermined markers. 

For this script to be effective you will need at least three markers. One marker must be called 'placemark' and must be placed near the team that you wish to be moved. The other two markers can be called anything you want but they must be defined in the server.sqf file in the _markerArray on line 14. If you wish to change the team being moved, change the _ranTeam variable on line 14 in the client.sqf file.

This file receives the randomly selected marker's name from the server and then grabs his position relative to a marker called 'placemark' and places him in the same position relative to the randomly selected marker.

Call this file from initPlayerLocal.sqf using the command below.

[] execVM "scripts\randomstart\client.sqf";
*/

//Set team to be placed at the randomly selected marker.
_ranTeam = west;
//Get the position of the placement marker. Place this nearby the team that is being moved.
_placeMarkerPos = getMarkerPos "placemark";

//Wait for server to select a marker from the list.
waitUntil {not isNil "randomMarker"};
_startMarkPos = getMarkerPos randomMarker;

//Make sure player is on the correct team.
if (side player == _ranTeam) then {	
	//Boundary marker for starting location
	_startMark = createMarkerLocal ["startZone",_startMarkPos];
	_startMark setMarkerShapeLocal "RECTANGLE";
	_startMark setMarkerSizeLocal [120, 60];
	_startMark setMarkerDirLocal (markerDir randomMarker);
	_startMark setMarkerBrushLocal "Solid";
	_startMark setMarkerColorLocal "ColorBLUFOR";
	//Text marker for starting location
	_startMarkTwo = createMarkerLocal ["startZoneTwo",_startMarkPos];
	_startMarkTwo setMarkerShapeLocal "ICON";
	_startMarkTwo setMarkerColorLocal "ColorBlack";
	_startMarkTwo setMarkerTypeLocal "hd_dot";
	_startMarkTwo setMarkerDirLocal (markerDir randomMarker);
	_startMarkTwo setMarkerTextLocal "BLUFOR Starting Zone";
	
	//Find player distance and direction to the placement marker.
	_dis = [player, _placeMarkerPos] call BIS_fnc_distance2D;
	_dir = (([player, _placeMarkerPos] call BIS_fnc_dirTo) + (markerDir randomMarker)) - 180;
	
	//Returns a position that is a specified distance and compass direction from the passed position or object.
	_newPos = [_startMarkPos, _dis, _dir] call BIS_fnc_relPos;
	
	//Move player
	player setPos [(_newPos select 0), (_newPos select 1)];
	player setDir (markerDir randomMarker);
};