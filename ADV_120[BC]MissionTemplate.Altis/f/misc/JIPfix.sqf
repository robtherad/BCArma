if (vehicle player == (_this select 0) && time > 0) then {
    (_this select 0) setPos [-1000,-1000,0]; // Put player off-map
    (_this select 0) setDamage 1; // Kill JIP player to initiate respawn
    hideBody (_this select 0); // Hide the body
};