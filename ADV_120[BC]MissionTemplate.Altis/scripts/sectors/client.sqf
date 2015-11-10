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
    case 0: { titleText [format["BLUFOR have taken control of %1.",triggerText (_this select 1)],"PLAIN DOWN"]; };
    case 1: { titleText [format["OPFOR have taken control of %1.",triggerText (_this select 1)],"PLAIN DOWN"]; };
    case 2: { titleText [format["%1 is now contested.",triggerText (_this select 1)],"PLAIN DOWN"]; };
    case 4: {    //Throw a hint to remind players of the current points
                _opfPercent = round ((((_this select 3) / (_this select 4))*100)*100) / 100;
                _bluPercent = round ((((_this select 2) / (_this select 4))*100)*100) / 100;
                _str = parseText format["<t>Sector Points\nBLUFOR - %1 / %2 - (%3&#37;)\nOPFOR - %4 / %2 - (%5&#37;)</t>",(_this select 2), (_this select 4),_bluPercent,(_this select 3),_opfPercent, " % "];
                titleText [str(_str),"PLAIN DOWN"];
            };
    case 5: { //BLUFOR Win 
                titleText ["BLUFOR VICTORY!\n\nBLUFOR have reached the required number of points to win the match. Congratulations.","PLAIN DOWN"];
            };
    case 6: { //OPFOR Win 
                titleText ["OPFOR VICTORY!\n\nOPFOR have reached the required number of points to win the match. Congratulations.","PLAIN DOWN"];
            };
};




