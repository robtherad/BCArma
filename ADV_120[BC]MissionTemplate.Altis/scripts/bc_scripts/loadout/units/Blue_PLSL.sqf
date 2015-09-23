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
for "_i" from 1 to 6 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
player addBackpack "B_AssaultPack_rgr";
for "_i" from 1 to 8 do {player addItemToBackpack "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShell";};
player addItemToBackpack "FirstAidKit";
player addHeadgear "MNP_Helmet_Scorpion";
player addWeapon "arifle_MX_Black_F";
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