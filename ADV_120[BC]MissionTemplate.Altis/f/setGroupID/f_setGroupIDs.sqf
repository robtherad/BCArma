// F3 Set Group IDs
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// OPEN THE ARRAY CONTAING ALL GROUPS
// Do not comment or delete this line!
_groups = [

// ====================================================================================

// GROUP IDs: BLUFOR > NATO
// Automatically assigns intelligible names to groups
// GrpBlue_HQ
["Blue_HQ","HQ"],

["Blue_A","A SL"],
["Blue_A1","A1"],
["Blue_A2","A2"],

["Blue_B","B SL"],
["Blue_B1","B1"],
["Blue_B2","B2"],

["Blue_C","C SL"],
["Blue_C1","C1"],
["Blue_C2","C2"],

["Blue_D","MMG SL"],
["Blue_D1","MMG1"],
["Blue_D2","MMG2"],
["Blue_D3","MMG3"],
["Blue_D4","MMG4"],

// Red team's turn

["Red_HQ","HQ"],

["Red_E","E SL"],
["Red_E1","E1"],
["Red_E2","E2"],

["Red_F","F SL"],
["Red_F1","F1"],
["Red_F2","F2"],

["Red_G","G SL"],
["Red_G1","G1"],
["Red_G2","G2"],

["Red_H","MMG SL"],
["Red_H1","MMG1"],
["Red_H2","MMG2"],
["Red_H3","MMG3"],
["Red_H4","MMG4"]

// Always make sure there's no comma after the last entry!

// ====================================================================================

// END OF THE ARRAY CONTAING ALL GROUPS
// Do not comment or delete this line!
];

// ====================================================================================

// SET THE GROUP IDS

private ["_grp"];
{
    // Check first if the group exists
    _grp = missionNamespace getVariable[(_x select 0),grpNull];
    if(!isNull _grp) then {
        _grp setGroupId [(_x select 1),"GroupColor0"];
    };
} forEach _groups;