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
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "130Rnd_338_Mag";};
player addBackpack "B_AssaultPack_rgr";
for "_i" from 1 to 2 do {player addItemToBackpack "130Rnd_338_Mag";};
player addItemToBackpack "FirstAidKit";
player addHeadgear "MNP_Helmet_Scorpion";
player addWeapon "MMG_02_black_F";
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