//Generates base channels for radios. 30hz-83hz is the longrange limit
if (!isServer) exitWith {};

opforBaseChannel = floor(random 53) + 30;
bluforBaseChannel = floor(random 53) + 30;
publicVariable "opforBaseChannel";
publicVariable "bluforBaseChannel";