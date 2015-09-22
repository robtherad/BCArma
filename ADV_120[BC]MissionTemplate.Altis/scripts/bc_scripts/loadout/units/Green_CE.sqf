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
for "_i" from 1 to 11 do {player addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
player addBackpack "B_Kitbag_rgr";
for "_i" from 1 to 2 do {player addItemToBackpack "SatchelCharge_Remote_Mag";};
player addItemToBackpack "ToolKit";
player addItemToBackpack "MineDetector";
player addHeadgear "H_HelmetIA";
player addWeapon "arifle_TRG21_F";
player addPrimaryWeaponItem "acc_flashlight";
if (s_loadout_map == 0) then {
	player linkItem "ItemMap";
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";
if (s_loadout_radio == 0) then {
	player linkItem "ItemRadio";
};