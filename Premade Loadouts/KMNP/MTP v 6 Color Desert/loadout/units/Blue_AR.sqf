removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "MNP_CombatUniform_DS_A";
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
player addVest "MNP_Vest_DS_1";
for "_i" from 1 to 4 do {player addItemToVest "100Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
player addItemToVest "100Rnd_65x39_caseless_mag_Tracer";
player addBackpack "B_Kitbag_mcamo";
for "_i" from 1 to 4 do {player addItemToBackpack "100Rnd_65x39_caseless_mag";};
player addItemToBackpack "100Rnd_65x39_caseless_mag_Tracer";
player addHeadgear "MNP_Helmet_DS";
player addWeapon "arifle_MX_SW_Black_F";
player addPrimaryWeaponItem "acc_flashlight";
player addPrimaryWeaponItem "bipod_01_F_blk";
if (s_loadout_map == 0) then {
	player linkItem "ItemMap";
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";
if (s_loadout_radio == 0) then {
	player linkItem "ItemRadio";
};