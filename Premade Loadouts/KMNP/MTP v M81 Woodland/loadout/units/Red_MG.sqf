removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "MNP_CombatUniform_Wood_A";
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
player addVest "MNP_Vest_M81";
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
player addItemToVest "150Rnd_93x64_Mag";
player addBackpack "MNP_B_WD_CA";
for "_i" from 1 to 2 do {player addItemToBackpack "150Rnd_93x64_Mag";};
player addHeadgear "MNP_Helmet_PAGST_M81";
player addGoggles "G_Bandanna_khk";
player addWeapon "MMG_01_tan_F";
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