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
_markerArray = ["randomstart", "randomstart_1", "randomstart_2", "randomstart_3", "randomstart_4", "randomstart_5", "randomstart_6", "randomstart_7"];

//Select a marker from the array at random.
randomMarker = _markerArray call BIS_fnc_selectRandom;

//Broadcast the selected marker to all clients on the server.
publicVariable "randomMarker";