#include "settings.sqf";

_sideArray = [0,0,0];
if (_bluforEliminatedMessage) then {
    _aliveB = {faction _x == "BLU_F"} count allUnits;
    if (_aliveB == 0) then {_sideArray set [0,1];} else {_sideArray set [0,0];};
};
if (_redforEliminatedMessage) then {
    _aliveR = {faction _x == "OPF_F"} count allUnits;
    if (_aliveR == 0) then {_sideArray set [1,1];} else {_sideArray set [1,0];};
};
if (_greenforEliminatedMessage) then {
    _aliveG = {faction _x == "IND_F"} count allUnits;
    if (_aliveG == 0) then {_sideArray set [2,1];} else {_sideArray set [2,0];};
};

_hintStr = "";
_fill = " have been eliminated.\n";
switch _sideArray do {
    case [0,0,0]: { _hintStr = ""; };
    case [0,1,0]: { _hintStr = "OPFOR" + _fill; };
    case [0,0,1]: { _hintStr = "INDFOR" + _fill; };
    case [0,1,1]: { _hintStr = "OPFOR" + _fill + "INDFOR" + _fill; };
    case [1,0,0]: { _hintStr = "BLUFOR" + _fill; };
    case [1,1,0]: { _hintStr = "BLUFOR" + _fill + "OPFOR" + _fill; };
    case [1,0,1]: { _hintStr = "BLUFOR" + _fill + "INDFOR" + _fill; };
    case [1,1,1]: { _hintStr = "BLUFOR" + _fill + "OPFOR" + _fill + "INDFOR" + _fill; };
};
_hintStr remoteExecCall ["hint", 0,true];
