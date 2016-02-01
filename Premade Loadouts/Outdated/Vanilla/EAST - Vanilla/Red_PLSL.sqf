removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "U_O_CombatUniform_ocamo";
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
player addVest "V_TacVest_khk";
for "_i" from 1 to 5 do {player addItemToVest "30Rnd_65x39_caseless_green_mag_Tracer";};
for "_i" from 1 to 4 do {player addItemToVest "SmokeShellGreen";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};

player addWeapon "arifle_Katiba_F";
removeAllPrimaryWeaponItems player;

if (s_loadout_radio != 3) then {
    player linkItem "ItemRadio";
};

player addBackpack "B_TacticalPack_ocamo";
for "_i" from 1 to 10 do {player addItemToBackpack "30Rnd_65x39_caseless_green";};
player addHeadgear "H_HelmetO_ocamo";

player addWeapon "Binocular";
if (s_loadout_map != 3) then {
    player linkItem "ItemMap";
    if (s_loadout_gps != 3) then {player linkItem "ItemGPS";};
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";

missionNamespace setVariable ["bc_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
