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
["Blue_HQ","Command"],

["Blue_A","Alpha"],
["Blue_A1","Alpha - One"],
["Blue_A2","Alpha - Two"],

["Blue_B","Bravo"],
["Blue_B1","Bravo - One"],
["Blue_B2","Bravo - Two"],

["Blue_C","Charlie"],
["Blue_C1","Charlie - One"],
["Blue_C2","Charlie - Two"],

["Blue_D","Delta"],
["Blue_D1","Delta - One"],
["Blue_D2","Delta - Two"],
["Blue_D3","Delta - Three"],
["Blue_D4","Delta - Four"],

// Red team's turn

["Red_HQ","Command"],

["Red_E","Echo"],
["Red_E1","Echo - One"],
["Red_E2","Echo - Two"],

["Red_F","Foxtrot"],
["Red_F1","Foxtrot - One"],
["Red_F2","Foxtrot - Two"],

["Red_G","Golf"],
["Red_G1","Golf - One"],
["Red_G2","Golf - Two"],

["Red_H","Hotel"],
["Red_H1","Hotel - One"],
["Red_H2","Hotel - Two"],
["Red_H3","Hotel - Three"],
["Red_H4","Hotel - Four"]

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