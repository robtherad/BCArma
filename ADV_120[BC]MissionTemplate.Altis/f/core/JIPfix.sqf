if (time > 0 && {(_this select 0) isKindOf "Man"}) then {
    (_this select 0) setPos [-1000,-1000,0];
    _ownerID = owner (_this select 0);
    [(_this select 0),objNull,0,0,true] remoteExec ["bc_spectator_fnc_CamInit", _ownerID];
};