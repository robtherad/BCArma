removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "U_I_CombatUniform";
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
player addVest "V_PlateCarrierIA2_dgtl";
for "_i" from 1 to 4 do {player addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "200Rnd_65x39_cased_Box";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
player addBackpack "B_AssaultPack_rgr";
for "_i" from 1 to 4 do {player addItemToBackpack "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToBackpack "200Rnd_65x39_cased_Box";};
player addItemToBackpack "200Rnd_65x39_cased_Box_Tracer";
player addHeadgear "H_HelmetIA";
player addWeapon "LMG_Mk200_F";
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