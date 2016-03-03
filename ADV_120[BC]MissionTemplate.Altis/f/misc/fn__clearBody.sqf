// Remotely remove all posessions from a unit;
params ["_unit"];

// Emulate removeAllWeapons
removeAllWeapons _unit;
{
    _unit removeWeaponGlobal _x;
} forEach weapons _unit;
// Emulate removeAllItems
{
    _unit removeItem _x;
} forEach items _unit;

// Emulate removeAllAssignedItems
{
    _unit unassignItem _x;
    _unit removeItem _x;
} forEach assignedItems _unit;

removeUniform _unit;
removeVest _unit;
removeBackpackGlobal _unit;
removeHeadgear _unit;
removeGoggles _unit;