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
for "_i" from 1 to 9 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
player addBackpack "B_Kitbag_rgr";
player addItemToBackpack "FirstAidKit";
for "_i" from 1 to 7 do {player addItemToBackpack "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {player addItemToBackpack "130Rnd_338_Mag";};
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShell";};
player addHeadgear "MNP_Helmet_Scorpion";
player addWeapon "arifle_MX_Black_F";
player addPrimaryWeaponItem "acc_flashlight";
player addWeapon "Binocular";
if (s_loadout_map == 0) then {
	player linkItem "ItemMap";
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";
if (s_loadout_radio == 0) then {
	player linkItem "ItemRadio";
};