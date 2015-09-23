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
for "_i" from 1 to 5 do {player addItemToVest "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 2 do {player addItemToVest "30Rnd_65x39_caseless_green_mag_Tracer";};
for "_i" from 1 to 2 do {player addItemToVest "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 2 do {player addItemToVest "1Rnd_Smoke_Grenade_shell";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
if ((s_loadout_radio == 0) or (s_loadout_radio == 1)) then {
	player addBackpack "tf_mr3000_bwmod";
} else {
	player addBackpack "MNP_B_WD_CA";
};
for "_i" from 1 to 9 do {player addItemToBackpack "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 2 do {player addItemToBackpack "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 2 do {player addItemToBackpack "1Rnd_Smoke_Grenade_shell";};
player addHeadgear "MNP_Helmet_PAGST_M81";
player addGoggles "G_Bandanna_khk";
player addWeapon "arifle_Katiba_GL_F";
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