removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "U_B_CombatUniform_mcam";
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
player addVest "V_TacVest_khk";
player addBackpack "B_TacticalPack_mcamo";
player addItemToBackpack "130Rnd_338_Mag";
player addHeadgear "H_HelmetSpecB_paint2";
player addWeapon "MMG_02_camo_F";
player addPrimaryWeaponItem "bipod_01_F_blk";

player addItemToVest "130Rnd_338_Mag";

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
