removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "MNP_CombatUniform_USMC_T";
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "rhs_mag_an_m8hc";};
player addVest "MNP_Vest_USMC";
for "_i" from 1 to 9 do {player addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_m67";};
player addItemToVest "rhsusf_100Rnd_762x51";
player addBackpack "B_FieldPack_khk";
for "_i" from 1 to 2 do {player addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
for "_i" from 1 to 3 do {player addItemToBackpack "rhsusf_100Rnd_762x51";};
player addHeadgear "MNP_Helmet_USMC";
player addWeapon "rhs_weap_m16a4_carryhandle";

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
