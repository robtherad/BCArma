removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "MNP_CombatUniform_RO_Rg";
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "rhs_mag_an_m8hc";};
player addVest "MNP_Vest_RU_T";
for "_i" from 1 to 5 do {player addItemToVest "rhs_30Rnd_762x39mm";};
for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_m67";};
player addBackpack "MNP_B_RU2_FP";
for "_i" from 1 to 10 do {player addItemToBackpack "rhs_30Rnd_762x39mm";};
player addHeadgear "MNP_Helmet_RU_LT";
 
player addWeapon "rhs_weap_akm";
removeAllPrimaryWeaponItems player;

player addWeapon "rhs_weap_rpg26";
if (s_loadout_map == 0) then {
	player linkItem "ItemMap";
    if (s_loadout_gps == 0) then {player linkItem "ItemGPS";};
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";
if (s_loadout_radio == 0) then {
	player linkItem "ItemRadio";
};