if (!isServer) exitWith {};
{
    _x addEventHandler ["HandleRating",{abs(_this select 1)}];
} forEach playableUnits;
