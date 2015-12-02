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
for "_i" from 1 to 2 do {player addItemToVest "100Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
player addBackpack "B_TacticalPack_mcamo";
for "_i" from 1 to 4 do {player addItemToBackpack "100Rnd_65x39_caseless_mag";};
player addHeadgear "H_HelmetSpecB_paint2";
player addWeapon "arifle_MX_SW_F";
player addPrimaryWeaponItem "bipod_01_F_blk";
if (s_loadout_map == 0) then {
    player linkItem "ItemMap";
    if (s_loadout_gps == 0) then {player linkItem "ItemGPS";};
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";
if (s_loadout_radio == 0) then {
    player linkItem "ItemRadio";
};

missionNamespace setVariable ["bc_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
