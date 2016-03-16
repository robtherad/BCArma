#include "settings.sqf";

_sideArray = [0,0,0];
// BLUFOR
if (_iswestPlaying) then {
    _aliveB = {side _x isEqualTo west} count allUnits;
    if (_aliveB isEqualTo 0) then {_sideArray set [0,1];} else {_sideArray set [0,0];};
    if (_canwestWithdraw) then {
        _withdrawnWest = {side _x isEqualTo west && ["bluforWithdrawMark", _x] call BIS_fnc_inTrigger} count allUnits;
        // If withdrawn count is the same as alive count AND at least 10 minutes have passed since mission start, count team as done
        if ( (_aliveB isEqualTo _withdrawnWest) && bc_withdrawTime) ) then {
            _sideArray set [0,1];
        };
    };
};
// OPFOR
if (_iseastPlaying) then {
    _aliveR = {side _x isEqualTo east} count allUnits;
    if (_aliveR isEqualTo 0) then {_sideArray set [1,1];} else {_sideArray set [1,0];};
    if (_caneastWithdraw) then {
        _withdrawnEast = {side _x isEqualTo east && ["bluforWithdrawMark", _x] call BIS_fnc_inTrigger} count allUnits;
        // If withdrawn count is the same as alive count AND at least 10 minutes have passed since mission start, count team as done
        if ( (_aliveR isEqualTo _withdrawnEast) && (time > bc_withdrawTime) ) then {
            _sideArray set [1,1];
        };
    };
};
// INDFOR
if (_isguerPlaying) then {
    _aliveG = {side _x isEqualTo independent} count allUnits;
    if (_aliveG isEqualTo 0) then {_sideArray set [2,1];} else {_sideArray set [2,0];};
    if (_canguerWithdraw) then {
        _withdrawnGuer = {side _x isEqualTo independent && ["bluforWithdrawMark", _x] call BIS_fnc_inTrigger} count allUnits;
        // If withdrawn count is the same as alive count AND at lguer 10 minutes have passed since mission start, count team as done
        if ( (_aliveG isEqualTo _withdrawnGuer) && (time > bc_withdrawTime) ) then {
            _sideArray set [2,1];
        };
    };
};

if !(_sideArray isEqualTo [0,0,0]) then {
    //_hintStr remoteExecCall ["hint", 0,true];
    call bc_fnc_points_prepAAR;
};
