removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "MNP_CombatUniform_6CO";
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
player addVest "MNP_Vest_6co_B";
for "_i" from 1 to 5 do {player addItemToVest "30Rnd_65x39_caseless_green_mag_Tracer";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
if ((s_loadout_radio == 0) or (s_loadout_radio == 1)) then {
	player addBackpack "tf_mr3000_bwmod_tropen";
} else {
	player addBackpack "B_Kitbag_cbr";
};
for "_i" from 1 to 2 do {player addItemToBackpack "150Rnd_93x64_Mag";};
player addHeadgear "MNP_Helmet_PAGST_US6co";
player addGoggles "G_Bandanna_khk";
player addWeapon "arifle_Katiba_C_F";
for "_i" from 1 to 4 do {player addItemToVest "30Rnd_65x39_caseless_green";};
player addPrimaryWeaponItem "acc_flashlight";
player addWeapon "Binocular";
if ((s_loadout_map == 0) or (s_loadout_map == 1)) then {
	player linkItem "ItemMap";
	player linkItem "ItemGPS";
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";
if ((s_loadout_radio == 0) or (s_loadout_radio == 1)) then {
	//player linkItem "ItemRadio";
};