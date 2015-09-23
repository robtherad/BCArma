removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "rhs_uniform_FROG01_wd";
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "rhs_mag_an_m8hc";};
player addVest "rhsusf_spc_squadleader";
for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_m67";};
for "_i" from 1 to 5 do {player addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
for "_i" from 1 to 4 do {player addItemToVest "rhs_mag_m18_red";};
if ((s_loadout_radio == 0) or (s_loadout_radio == 1)) then {
	player addBackpack "tf_rt1523g_big_bwmod";
	player addItemToBackpack "rhsusf_100Rnd_762x51";
} else {
	player addBackpack "rhsusf_assault_eagleaiii_coy";
	for "_i" from 1 to 3 do {player addItemToBackpack "rhsusf_100Rnd_762x51";};
};
player addHeadgear "rhsusf_lwh_helmet_marpatwd";
player addWeapon "rhs_weap_m4a1_carryhandle";
player addPrimaryWeaponItem "acc_flashlight";
for "_i" from 1 to 4 do {player addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};

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