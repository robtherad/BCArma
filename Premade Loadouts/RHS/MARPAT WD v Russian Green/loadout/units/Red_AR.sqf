removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "rhs_uniform_flora_patchless";
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "rhs_mag_an_m8hc";};
player addVest "rhs_6b23_6sh92";
for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_m67";};
for "_i" from 1 to 5 do {player addItemToVest "rhs_45Rnd_545X39_AK";};
player addBackpack "B_Kitbag_sgg";
for "_i" from 1 to 10 do {player addItemToBackpack "rhs_45Rnd_545X39_AK";};
player addHeadgear "rhs_6b27m";
player addGoggles "G_Bandanna_khk";
player addWeapon "rhs_weap_ak74m_plummag";
removeAllPrimaryWeaponItems player;
 
if (s_loadout_map == 0) then {
	player linkItem "ItemMap";
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";
if (s_loadout_radio == 0) then {
	player linkItem "ItemRadio";
};