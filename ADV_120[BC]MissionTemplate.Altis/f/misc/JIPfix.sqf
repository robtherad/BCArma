if ( (bc_hasGameStarted) && (vehicle player == (_this select 0)) ) then {
    (_this select 0) setPos [-1000,-1000,0];
    (_this select 0) setDamage 1; 
    hideBody (_this select 0);
};

if (vehicle player == (_this select 0)) then {
    [{
        params ["_args","_handle"];
        _args params ["_var"];
        
        // Variable not set yet, exit
        if (isNil "bc_hasGameStarted") exitWith {}; 
        
        // Variable set, game hasn't started yet. Player must not be a JIP. Remove PFH
        if (!bc_hasGameStarted) then {
            [_handle] call CBA_fnc_removePerFrameHandler; 
            bc_didJipCheck = true;
        };
        
        // Game started, player is JIP, put him in spectate
        if ( (bc_hasGameStarted) && (vehicle player == (_var select 0)) && (isNil "bc_didJipCheck")) then {
            bc_didJipCheck = true;
            (_var select 0) setPos [-1000,-1000,0];
            [(_var select 0),objNull,0,0,true] call f_fnc_CamInit;
            hideBody (_var select 0);
            [_handle] call CBA_fnc_removePerFrameHandler;
        } else {
            diag_log format["JIP Check: Something went wrong: %1",_var];
        };
    }, 0, [_this]] call CBA_fnc_addPerFrameHandler;
};