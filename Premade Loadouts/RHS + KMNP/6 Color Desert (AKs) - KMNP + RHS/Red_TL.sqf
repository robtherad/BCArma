removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "MNP_CombatUniform_6CO";
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "rhs_mag_an_m8hc";};
player addVest "MNP_Vest_6co_A";
for "_i" from 1 to 4 do {player addItemToVest "rhs_mag_m18_green";};
for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_m67";};
for "_i" from 1 to 5 do {player addItemToVest "rhs_30Rnd_545x39_AK_green";};

player addWeapon "rhs_weap_ak74m_gp25";
removeAllPrimaryWeaponItems player;

if ((s_loadout_radio == 0) or (s_loadout_radio == 1)) then {
    player addBackpack "tf_mr3000_bwmod";
    for "_i" from 1 to 4 do {player addItemToBackpack "rhs_30Rnd_545x39_AK";};
    player linkItem "ItemRadio";
} else {
    player addBackpack "B_FieldPack_khk";
    for "_i" from 1 to 12 do {player addItemToBackpack "rhs_30Rnd_545x39_AK";};
};

for "_i" from 1 to 4 do {player addItemToBackpack "rhs_VOG25";};
for "_i" from 1 to 4 do {player addItemToBackpack "rhs_GRD40_White";};
for "_i" from 1 to 4 do {player addItemToBackpack "rhs_GRD40_Green";};
player addHeadgear "MNP_Helmet_6Co";

player addWeapon "Binocular";
if ((s_loadout_map == 0) or (s_loadout_map == 1)) then {
    player linkItem "ItemMap";
    if ((s_loadout_gps == 0) or (s_loadout_gps == 1)) then {player linkItem "ItemGPS";};
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";

missionNamespace setVariable ["bc_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
