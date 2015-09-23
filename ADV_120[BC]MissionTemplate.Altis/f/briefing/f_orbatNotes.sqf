// F3 - ORBAT Notes
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// This script will automatically generate an ORBAT page.

// Define needed variables
private ["_orbatText", "_groups", "_precompileGroups","_maxSlots","_freeSlots","_side"];
_side = side group player;
_orbatText = "<br />NOTE: The ORBAT below is only accurate at mission start.<br />
<br />
<font size='18'>GROUP LEADERS + MEDICS</font><br /><br />";
_groups = [];

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

	_orbatText = _orbatText + format ["<font color='%3'>(%4 men) <b>%1</b> -- %2</font>", groupId _x, name leader _x,_color,count (units _x)] + "<br />";

	// List medics too.
	{
		if (getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "attendant") == 1 && {_x != leader group _x}) then {
			_orbatText = _orbatText + format["         [M] %1",name _x] + "<br />";
		};
	} forEach units _x;
} forEach _groups;

// Insert final result into subsection ORBAT of section Notes
player createDiaryRecord ["diary", ["ORBAT", _orbatText]];