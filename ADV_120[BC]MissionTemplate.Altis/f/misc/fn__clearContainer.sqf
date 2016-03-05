// Remotely (from server) remove all items from an object
params ["_object"];

if (!isServer) exitWith {};

clearWeaponCargoGlobal _object;
clearMagazineCargoGlobal _object;
clearBackpackCargoGlobal _object;
clearItemCargoGlobal _object;