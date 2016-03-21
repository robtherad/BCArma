/* ----------------------------------------------------------------------------
Function: BC_fnc_gps_init
Description:
    Automatically runs bc_gpsMarkers_fnc_addMarker for all groups except the ones blacklisted in settings.sqf
Examples:
    (begin example)
        call BC_fnc_gps_init;
    (end)
---------------------------------------------------------------------------- */
private ["_missionParam","_vehArrays","_westVehArray","_eastVehArray","_indVehArray","_ignoreMarkerArray"];
#include "settings.sqf"

_missionParam = ["s_gps_markers",1] call BIS_fnc_getParamValue;
if !(_missionParam isEqualTo 1) exitWith {bc_gpsMarkers_disableGPS = true;};

_vehArrays = [[west,_westVehArray],[east,_eastVehArray],[independent,_indVehArray]];

// Add GPS markers to all groups except those blacklisted in settings file
{
    if !( (groupID _x in  _ignoreMarkerArray) || (_x in _ignoreMarkerArray) ) then {
        [_x,side _x] call bc_gpsMarkers_fnc_addMarker;
    };
} forEach allGroups;

// Add GPS markers to all whitelisted vehicles from settings file. 
{
    _x params ["_side","_array"];
    {
        [_x,_side] call bc_gpsMarkers_fnc_addMarker;
    } forEach _array;
} forEach _vehArrays;