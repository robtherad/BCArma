// F3 Set Group IDs
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// This script has been modified from it's original form.
// ====================================================================================

// OPEN THE ARRAY CONTAING ALL GROUPS
// Do not comment or delete this line!
_groups = [

// ====================================================================================
// Automatically assigns intelligible names to groups
// format: [group,groupID,BC_LongName]


// BLUFOR
["Blue_HQ","HQ","Headquarters"],

["Blue_A","A","Alpha Squad"],
["Blue_A1","A1","Alpha One"],
["Blue_A2","A2","Alpha Two"],

["Blue_B","B","Bravo Squad"],
["Blue_B1","B1","Bravo One"],
["Blue_B2","B2","Bravo Two"],

["Blue_C","C","Charlie Squad"],
["Blue_C1","C1","Charlie One"],
["Blue_C2","C2","Charlie Two"],

["Blue_D","D","Delta Squad"],
["Blue_D1","D1","Delta One"],
["Blue_D2","D2","Delta Two"],
["Blue_D3","D3","Delta Three"],
["Blue_D4","D4","Delta Four"],


// REDFOR
["Red_HQ","HQ","Headquarters"],

["Red_E","E","Echo Squad"],
["Red_E1","E1","Echo One"],
["Red_E2","E2","Echo Two"],

["Red_F","F","Foxtrot Squad"],
["Red_F1","F1","Foxtrot One"],
["Red_F2","F2","Foxtrot Two"],

["Red_G","G","Golf Squad"],
["Red_G1","G1","Golf One"],
["Red_G2","G2","Golf Two"],

["Red_H","H","Hotel Squad"],
["Red_H1","H1","Hotel One"],
["Red_H2","H2","Hotel Two"],
["Red_H3","H3","Hotel Three"],
["Red_H4","H4","Hotel Four"]

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
		_grp setVariable ["BC_LongName",_x select 2];
    };
} forEach _groups;