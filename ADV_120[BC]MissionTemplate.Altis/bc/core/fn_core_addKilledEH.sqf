/*
When the player dies they will have a hint pop up and display who they were killed by as well as all kills that they got during the mission.

This script adds event handlers to all units in the game.

MPKilled - Triggered when the unit is killed. EH can be added on any machine and EH code will trigger globally on every connected client and server.

Call this file on THE SERVER from bc_init.sqf using the command below.

[] execVM "scripts\bc_scripts\killdisplay\kd_addeventhandler.sqf";
*/
//No reason for everyone to run this script since addMPEventHandler is global.
if (!isServer) exitWith {};

{
	_x addMPEventHandler ["MPKilled",{_this call BC_fnc_core_mpKilled;}];
} forEach playableUnits;