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
for "_i" from 1 to 8 do {player addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 2 do {player addItemToVest "30Rnd_556x45_Stanag_Tracer_Yellow";};
for "_i" from 1 to 2 do {player addItemToVest "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 2 do {player addItemToVest "1Rnd_Smoke_Grenade_shell";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
player addBackpack "B_AssaultPack_rgr";
for "_i" from 1 to 8 do {player addItemToBackpack "30Rnd_556x45_Stanag";};
for "_i" from 1 to 4 do {player addItemToBackpack "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 4 do {player addItemToBackpack "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToBackpack "30Rnd_556x45_Stanag_Tracer_Yellow";};
for "_i" from 1 to 2 do {player addItemToBackpack "1Rnd_Smoke_Grenade_shell";};
for "_i" from 1 to 2 do {player addItemToBackpack "HandGrenade";};
player addHeadgear "H_HelmetIA";
player addWeapon "arifle_TRG21_GL_F";
player addPrimaryWeaponItem "acc_flashlight";
player addWeapon "Binocular";
if ((s_loadout_map == 0) or (s_loadout_map == 1)) then {
	player linkItem "ItemMap";
	player linkItem "ItemGPS";
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";
if ((s_loadout_radio == 0) or (s_loadout_radio == 1)) then {
	player linkItem "ItemRadio";
};