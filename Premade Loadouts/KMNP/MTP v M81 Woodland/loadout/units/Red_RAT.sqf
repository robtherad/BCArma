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
for "_i" from 1 to 9 do {player addItemToVest "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
player addBackpack "MNP_B_WD_CA";
for "_i" from 1 to 4 do {player addItemToBackpack "30Rnd_65x39_caseless_green";};
player addHeadgear "MNP_Helmet_PAGST_M81";
player addGoggles "G_Bandanna_khk";
player addWeapon "arifle_Katiba_F";
player addPrimaryWeaponItem "acc_flashlight";
player addItemToBackpack "RPG32_HE_F";
player addWeapon "launch_RPG32_F";
if (s_loadout_map == 0) then {
	player linkItem "ItemMap";
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";
if (s_loadout_radio == 0) then {
	player linkItem "ItemRadio";
};