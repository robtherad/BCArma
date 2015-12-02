removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "U_O_CombatUniform_ocamo";
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
player addVest "V_TacVest_khk";
player addItemToVest "150Rnd_93x64_Mag";
player addHeadgear "H_Bandanna_cbr";

player addWeapon "MMG_01_hex_F";
removeAllPrimaryWeaponItems player;
player addPrimaryWeaponItem "bipod_02_F_hex";

player addItemToVest "150Rnd_93x64_Mag";

if (s_loadout_map == 0) then {
    player linkItem "ItemMap";
    if (s_loadout_gps == 0) then {player linkItem "ItemGPS";};
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";
if (s_loadout_radio == 0) then {
    player linkItem "ItemRadio";
};

missionNamespace setVariable ["bc_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
