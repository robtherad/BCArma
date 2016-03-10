/* ----------------------------------------------------------------------------
Function: BC_fnc_gps_init
Description:
    Automatically runs bc_gpsMarkers_fnc_addMarker for all groups except the ones blacklisted in settings.sqf
Examples:
    (begin example)
        call BC_fnc_gps_init;
    (end)
---------------------------------------------------------------------------- */

#include "settings.sqf"

{
    if !( (groupID _x || _x) in  _ignoreMarkerArray) then {
        [_x,side _x] call bc_gpsMarkers_fnc_addMarker;
    };
} forEach allGroups;