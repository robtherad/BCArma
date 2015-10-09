/*
Gets called from bc_init.sqf on the server. If you are using every piece of the template there is nothing you need to change in this file.
*/
//Generates base channels for radios. 30hz-83hz is the longrange limit
if (!isServer) exitWith {};

opforBaseChannel = floor(random 53) + 30;
bluforBaseChannel = floor(random 53) + 30;
publicVariable "opforBaseChannel";
publicVariable "bluforBaseChannel";