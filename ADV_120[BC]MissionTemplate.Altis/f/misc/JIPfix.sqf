if (time > 0 && {(_this select 0) isKindOf "Man"} && {isPlayer (_this select 0)}) then {
    (_this select 0) setPos [-1000,-1000,0];
    _ownerID = owner (_this select 0);
    [(_this select 0),objNull,0,0,true] remoteExec ["f_fnc_CamInit", _ownerID];
};