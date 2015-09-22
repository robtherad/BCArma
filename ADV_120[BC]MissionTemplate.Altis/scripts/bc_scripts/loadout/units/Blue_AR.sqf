removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "MNP_CombatUniform_Ranger_A";
player addItemToUniform "FirstAidKit";
player addVest "MNP_Vest_Olive_2";
for "_i" from 1 to 4 do {player addItemToVest "100Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
player addItemToVest "100Rnd_65x39_caseless_mag_Tracer";
player addBackpack "B_AssaultPack_rgr";
for "_i" from 1 to 4 do {player addItemToBackpack "100Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShell";};
player addItemToBackpack "FirstAidKit";
player addItemToBackpack "100Rnd_65x39_caseless_mag_Tracer";
player addHeadgear "MNP_Helmet_Scorpion";
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