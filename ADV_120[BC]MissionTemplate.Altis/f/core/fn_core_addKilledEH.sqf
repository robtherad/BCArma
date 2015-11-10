if (!isServer) exitWith {};

{
    _x addMPEventHandler ["MPKilled",{_this call BC_fnc_core_mpKilled;}];
} forEach playableUnits;
