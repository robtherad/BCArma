/*
When the player dies they will have a hint pop up and display who they were killed by as well as all kills that they got during the mission.

This script is executed every time a unit is killed during the mission. Don't call this script from any init.sqf files.

0 unit: Object - Object the event handler is assigned to
1 killer: Object - Object that killed the unit
Contains the unit itself in case of collisions
*/

//No need for server to be running this script.
if (isServer) exitWith {};

_unit = _this select 0;
_killer = _this select 1;

showSubtitles false; //Apparently when you get a team kill it changes this variable?

//Make sure variable 'kills' isn't empty. If so, initialize.
if (isNil {kills}) then {
	kills = "You killed: \n";
	killCount = 0;
};

//Player has killed.
if (vehicle player == _killer) then {
	//Check for friendly fire
	if (faction player == faction _unit) then {
		friendly = " - [FRIENDLY]";
		if (player == _unit) then {
			friendly = " - [SELF]";
		};
	} else {
		friendly = "";
	};
	killDist = ceil (_killer distance _unit);
	killCount = killCount + 1;
	//Build string for use in readout.
	kills = kills + str(killCount) + ". " + (name _unit) + " (" + str(killDist) + "m)" + friendly + "\n";
};

//Player has died.
if (player == _unit) then {
	//Commence Readout
	sleep 5; // wait until death stuff is done
	//hint format ["You were killed by - %1 (%2m)\n\n%3",(name _killer),ceil (_killer distance _unit),kills];
	systemChat format ["You were killed by - %1 (%2m)",(name _killer),ceil (_killer distance _unit)];
	systemChat " ";
	kills2 = [kills, "\n"] call CBA_fnc_split;
	{
		systemChat format ["%1",_x];
	} forEach kills2;
};