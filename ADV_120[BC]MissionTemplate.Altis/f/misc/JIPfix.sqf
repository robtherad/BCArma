if (vehicle player == (_this select 0) && time > 0) then {
    (_this select 0) setPos [-1000,-1000,0];
    (_this select 0) setDamage 1; 
    hideBody (_this select 0);
};