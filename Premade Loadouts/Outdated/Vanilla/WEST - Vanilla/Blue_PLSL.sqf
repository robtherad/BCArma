removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "U_B_CombatUniform_mcam";
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
player addVest "V_TacVest_khk";
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 5 do {player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
for "_i" from 1 to 4 do {player addItemToVest "SmokeShellRed";};

player addWeapon "arifle_MX_F";

if (s_loadout_radio != 3) then {
    player linkItem "ItemRadio";
};
player addBackpack "B_TacticalPack_mcamo";
for "_i" from 1 to 6 do {player addItemToBackpack "30Rnd_65x39_caseless_mag";};

player addHeadgear "H_HelmetSpecB_paint2";
for "_i" from 1 to 4 do {player addItemToBackpack "30Rnd_65x39_caseless_mag";};

player addWeapon "Binocular";
if (s_loadout_map != 3) then {
    player linkItem "ItemMap";
    if (s_loadout_gps != 3) then {player linkItem "ItemGPS";};
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";

missionNamespace setVariable ["bc_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
