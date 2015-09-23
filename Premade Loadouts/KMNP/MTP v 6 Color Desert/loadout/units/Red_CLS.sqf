removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "MNP_CombatUniform_6CO";
player addItemToUniform "FirstAidKit";
player addVest "MNP_Vest_6co_B";
for "_i" from 1 to 9 do {player addItemToVest "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 6 do {player addItemToVest "SmokeShell";};
player addBackpack "B_Kitbag_cbr";
for "_i" from 1 to 1 do {player addItemToBackpack "Medikit";};
for "_i" from 1 to 10 do {player addItemToBackpack "FirstAidKit";};
player addHeadgear "MNP_Helmet_PAGST_US6co";
player addGoggles "G_Bandanna_khk";
player addWeapon "arifle_Katiba_F";
player addPrimaryWeaponItem "acc_flashlight";
if (s_loadout_map == 0) then {
	player linkItem "ItemMap";
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";
if (s_loadout_radio == 0) then {
	player linkItem "ItemRadio";
};
[player,"MedB"] call bis_fnc_setUnitInsignia;