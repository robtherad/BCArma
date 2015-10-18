/*
Do not call this script. It runs on clients when certain conditions are met in the server.sqf file in the sector control script.

passed arguments:

_this select 0: _sideCurOwned - Side that now controls the area
_this select 1: _x - a trigger
_this select 2: bc_westPoints
_this select 3: bc_eastPoints
_this select 4: bc_endPoints
*/

_sideCurOwned = _this select 0;

switch (_sideCurOwned) do {
	case 0: { hint format["BLUFOR have taken control of %1.",triggerText (_this select 1)]; };
	case 1: { hint format["OPFOR have taken control of %1.",triggerText (_this select 1)]; };
	case 2: { hint format["%1 is now contested.",triggerText (_this select 1)]; };
	case 4: {	//Throw a hint to remind players of the current points
				_opfPercent = round ((((_this select 3) / (_this select 4))*100)*100) / 100;
				_bluPercent = round ((((_this select 2) / (_this select 4))*100)*100) / 100;
				hint parseText format["<t>Sector Points<br/>BLUFOR - %1 / %2 - (%3&#37;)<br/>OPFOR - %4 / %2 - (%5&#37;)</t>",(_this select 2), (_this select 4),_bluPercent,(_this select 3),_opfPercent, " % "];
			};
	case 5: { //BLUFOR Win 
				hint "BLUFOR VICTORY!\n\nBLUFOR have reached the required number of points to win the match. Congratulations.";
				systemChat "BLUFOR have reached the required number of points to win the match."
			};
	case 6: { //OPFOR Win 
				hint "OPFOR VICTORY!\n\nOPFOR have reached the required number of points to win the match. Congratulations.";
				systemChat "OPFOR have reached the required number of points to win the match."
			};
};




