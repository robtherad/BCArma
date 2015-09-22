_char = typeOf player;
//scripts\loadout parameters from slot screen
s_loadout_radio = ["s_loadout_radio",0] call BIS_fnc_getParamValue;
s_loadout_map = ["s_loadout_map",0] call BIS_fnc_getParamValue;

// Ensure script is run only once.
if (!isNil "loadout_assigned") exitWith {};
loadout_assigned = false;

switch (_char) do {
//Green - AAF/GUER - IND_F
 case "I_Soldier_AR_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Green_AR.sqf"};
 case "I_medic_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Green_CLS.sqf"};
 case "I_Soldier_A_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Green_AAR.sqf"};
 case "I_Soldier_SL_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Green_PLSL.sqf"};
 case "I_soldier_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Green_R.sqf"};
 case "I_Soldier_TL_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Green_TL.sqf"};
 case "I_soldier_UAV_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Green_UAVOP.sqf"};
 case "I_engineer_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Green_CE.sqf"};
 //Red - CSAT/EAST - OPF_F
 case "O_Soldier_AR_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Red_AR.sqf"};
 case "O_medic_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Red_CLS.sqf"};
 case "O_Soldier_A_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Red_AAR.sqf"};
 case "O_Soldier_SL_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Red_PLSL.sqf"};
 case "O_Soldier_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Red_R.sqf"};
 case "O_Soldier_TL_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Red_TL.sqf"};
 case "O_engineer_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Red_CE.sqf"};
 case "O_HeavyGunner_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Red_MG.sqf"};
 case "O_Soldier_lite_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Red_AG.sqf"};
 case "O_soldier_UAV_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Red_UAVOP.sqf"};
 case "O_Soldier_LAT_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Red_RAT.sqf"};
 case "o_soldier_unarmed_f": {[] call compile preprocessFileLineNumbers "scripts\loadout\Red_AM.sqf"};
 //Blue - NATO/WEST - BLU_F
 case "B_soldier_AR_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Blue_AR.sqf"};
 case "B_medic_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Blue_CLS.sqf"};
 case "B_Soldier_A_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Blue_AAR.sqf"};
 case "B_Soldier_SL_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Blue_PLSL.sqf"};
 case "B_Soldier_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Blue_R.sqf"};
 case "B_Soldier_TL_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Blue_TL.sqf"};
 case "B_HeavyGunner_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Blue_MG.sqf"};
 case "B_Soldier_lite_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Blue_AG.sqf"};
 case "B_engineer_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Blue_CE.sqf"};
 case "B_soldier_UAV_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Blue_UAVOP.sqf"};
 case "B_soldier_LAT_F": {[] call compile preprocessFileLineNumbers "scripts\loadout\Blue_RAT.sqf"};
 case "b_soldier_unarmed_f": {[] call compile preprocessFileLineNumbers "scripts\loadout\Blue_AM.sqf"};
};

// Generate loadout briefing page.
[] call compile preprocessFileLineNumbers "scripts\loadout\f_loadoutNotes.sqf";