#include "settings.sqf"

_sideArray = [0,0,0];
// BLUFOR
if (_isWestPlaying) then {
    _aliveB = {side _x isEqualTo West} count allUnits;
    if (_aliveB isEqualTo 0) then {_sideArray set [0,1];} else {_sideArray set [0,0];};
    if (_canWestWithdraw) then {
        _withdrawnWest = {(side _x isEqualTo West) && (_x inArea "bluforWithdrawMark")} count allUnits;
        // If withdrawn count is the same as alive count AND at lEast 10 minutes have passed since mission start, count team as done
        if ( (_aliveB isEqualTo _withdrawnWest) && bc_withdrawTime) then {
            _sideArray set [0,1];
        };
    };
};
// OPFOR
if (_isEastPlaying) then {
    _aliveR = {side _x isEqualTo East} count allUnits;
    if (_aliveR isEqualTo 0) then {_sideArray set [1,1];} else {_sideArray set [1,0];};
    if (_canEastWithdraw) then {
        _withdrawnEast = {(side _x isEqualTo West) && (_x inArea "opforWithdrawMark")} count allUnits;
        // If withdrawn count is the same as alive count AND at lEast 10 minutes have passed since mission start, count team as done
        if ( (_aliveR isEqualTo _withdrawnEast) && (time > bc_withdrawTime) ) then {
            _sideArray set [1,1];
        };
    };
};
// INDFOR
if (_isGuerPlaying) then {
    _aliveG = {side _x isEqualTo independent} count allUnits;
    if (_aliveG isEqualTo 0) then {_sideArray set [2,1];} else {_sideArray set [2,0];};
    if (_canGuerWithdraw) then {
        _withdrawnGuer = {(side _x isEqualTo independent) && (_x inArea "indforWithdrawMark")} count allUnits;
        // If withdrawn count is the same as alive count AND at lGuer 10 minutes have passed since mission start, count team as done
        if ( (_aliveG isEqualTo _withdrawnGuer) && (time > bc_withdrawTime) ) then {
            _sideArray set [2,1];
        };
    };
};

if !(_sideArray isEqualTo [0,0,0]) then {
    //_hintStr remoteExecCall ["hint", 0,true];
    call bc_fnc_points_prepAAR;
};
