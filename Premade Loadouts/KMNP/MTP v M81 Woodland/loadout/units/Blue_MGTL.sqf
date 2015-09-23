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
for "_i" from 1 to 5 do {player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
if ((s_loadout_radio == 0) or (s_loadout_radio == 1)) then {
	player addBackpack "tf_rt1523g_big_rhs";
} else {
	player addBackpack "B_Kitbag_mcamo";
};
for "_i" from 1 to 2 do {player addItemToBackpack "130Rnd_338_Mag";};
player addHeadgear "MNP_Helmet_DS";
player addWeapon "arifle_MXC_Black_F";
for "_i" from 1 to 4 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
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