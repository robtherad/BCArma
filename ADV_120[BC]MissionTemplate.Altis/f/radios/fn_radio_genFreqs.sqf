//Generates base channels for radios and broadcasts them to clients. 30MHz-87MHz is the longrange limit before taking into account how many freqs are needed
if (!isServer) exitWith {};

_opforBaseChannel = floor(random 50) + 30;
_bluforBaseChannel = floor(random 50) + 30;
_broadcasted1 = ["bc_bluforBaseChannel", _bluforBaseChannel] call CBA_fnc_publicVariable;
_broadcasted2 = ["bc_opforBaseChannel", _opforBaseChannel] call CBA_fnc_publicVariable;
