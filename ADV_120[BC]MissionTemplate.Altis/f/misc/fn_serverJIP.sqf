/* ----------------------------------------------------------------------------
Function: BC_fnc_serverJIP
Description:
    Sets a publicVariable with the current mission state. False for still in briefing, true for in game world.
---------------------------------------------------------------------------- */
if (!isServer) exitWith {};

bc_hasGameStarted = false;
publicVariable "bc_hasGameStarted";

[{
    params ["_args","_handle"];
    
    if (time > 0) then {
        bc_hasGameStarted = true;
        publicVariable "bc_hasGameStarted";
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
}, 0, []] call CBA_fnc_addPerFrameHandler;
