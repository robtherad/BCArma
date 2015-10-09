// F3 - ORBAT Notes
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// This script has been modified from it's original form.
// ====================================================================================

// This script will automatically generate an ORBAT page.

// Define needed variables
private ["_orbatText", "_groups", "_precompileGroups","_maxSlots","_freeSlots","_side"];
_side = side group player;
_orbatText = "<br />NOTE: The ORBAT below is only accurate at mission start.<br />
<br />
<font size='18'>GROUP LEADERS + MEDICS</font><br /><br />";
_groups = [];

waitUntil { !isNil "opforBaseChannel"; };
waitUntil { !isNil "bluforBaseChannel"; };

_groupIDs = [
// BLUFOR
["Blue_HQ",bluforBaseChannel],
["Blue_A",bluforBaseChannel+1],["Blue_A1",bluforBaseChannel+1.1],["Blue_A2",bluforBaseChannel+1.2],
["Blue_B",bluforBaseChannel+2],["Blue_B1",bluforBaseChannel+2.1],["Blue_B2",bluforBaseChannel+2.2],
["Blue_C",bluforBaseChannel+3],["Blue_C1",bluforBaseChannel+3.1],["Blue_C2",bluforBaseChannel+3.2],
["Blue_D",bluforBaseChannel+4],["Blue_D1",bluforBaseChannel+4.1],["Blue_D2",bluforBaseChannel+4.2],["Blue_D3",bluforBaseChannel+4.3],["Blue_D4",bluforBaseChannel+4.4],

// REDFOR
["Red_HQ",opforBaseChannel],
["Red_E",opforBaseChannel+1],["Red_E1",opforBaseChannel+1.1],["Red_E2",opforBaseChannel+1.2],
["Red_F",opforBaseChannel+2],["Red_F1",opforBaseChannel+2.1],["Red_F2",opforBaseChannel+2.2],
["Red_G",opforBaseChannel+3],["Red_G1",opforBaseChannel+3.1],["Red_G2",opforBaseChannel+3.2],
["Red_H",opforBaseChannel+4],["Red_H1",opforBaseChannel+4.1],["Red_H2",opforBaseChannel+4.2],["Red_H3",opforBaseChannel+4.3],["Red_H4",opforBaseChannel+4.4]
];
{
	// Add to ORBAT if side matches, group isn't already listed, and group has players
	if ((side _x == _side) && !(_x in _groups) && ({_x in playableUnits} count units _x) > 0) then {
		_groups pushBack _x;
	};
} forEach allGroups;


// Loop through the group, print out group ID, leader name and medics if present
{
	// Highlight the player's group with a different color (based on the player's side)
	_color = "#FFFFFF";
	if (_x == group player) then {
		_color = switch (side player) do {
			 case west: {"#0080FF"};
			 case east: {"#B40404"};
			 case independent: {"#298A08"};
			 default {"#8904B1"};
 		};
	};

	_wrkGroup = _x;
	{
		_grp = missionNamespace getVariable[(_x select 0),grpNull];
		if (_grp == _wrkGroup) exitWith {freq = _x select 1;};
	} forEach _groupIDs;
	//Use BC_LongName but default to groupID if it's not defined
	_longName = _x getVariable ["BC_LongName",groupID _x];
	if (isNil "freq") then {
		_orbatText = _orbatText + format ["<font color='%3'>(%4 men) <b>%1</b> -- %2</font>", _longName, name leader _x,_color,count (units _x)] + "<br />";
	} else {
		_orbatText = _orbatText + format ["<font color='%3'>(%4 men) <b>%5 MHz -- %1</b> -- %2</font>", _longName, name leader _x,_color,count (units _x),freq] + "<br />";
	};
	// List medics too.
	{
		if (getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "attendant") == 1 && {_x != leader group _x}) then {
			_orbatText = _orbatText + format["         [M] %1",name _x] + "<br />";
		};
	} forEach units _x;
} forEach _groups;

// Insert final result into subsection ORBAT of section Notes
player createDiaryRecord ["diary", ["ORBAT", _orbatText]];