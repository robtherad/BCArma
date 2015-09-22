removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "MNP_CombatUniform_OD_Rg";
player addItemToUniform "FirstAidKit";
player addVest "MNP_Vest_OD_B";
for "_i" from 1 to 6 do {player addItemToVest "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 2 do {player addItemToVest "30Rnd_65x39_caseless_green_mag_Tracer";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
player addBackpack "B_FieldPack_khk";
for "_i" from 1 to 8 do {player addItemToBackpack "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShell";};
player addItemToBackpack "FirstAidKit";
player addHeadgear "MNP_Helmet_PAGST_OD";
player addGoggles "G_Bandanna_khk";
player addWeapon "arifle_Katiba_F";
player addPrimaryWeaponItem "acc_flashlight";
player addWeapon "Binocular";
if (s_loadout_map != 3) then {
	player linkItem "ItemMap";
	player linkItem "ItemGPS";
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";
if (s_loadout_radio != 3) then {
	player linkItem "ItemRadio";
};