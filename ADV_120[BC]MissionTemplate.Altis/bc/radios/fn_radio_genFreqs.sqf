/*
Gets called from bc_init.sqf on the server. If you are using every piece of the template there is nothing you need to change in this file.
*/
//Generates base channels for radios. 30hz-83hz is the longrange limit
if (!isServer) exitWith {};

_opforBaseChannel = floor(random 53) + 30;
_bluforBaseChannel = floor(random 53) + 30;
_broadcasted1 = ["bc_bluforBaseChannel", _bluforBaseChannel] call CBA_fnc_publicVariable;
_broadcasted2 = ["bc_opforBaseChannel", _opforBaseChannel] call CBA_fnc_publicVariable;