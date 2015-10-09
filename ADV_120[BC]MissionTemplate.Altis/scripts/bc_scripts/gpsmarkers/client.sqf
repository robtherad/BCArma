/*
This script creates markers on units that have a GPS on them. These markers are only visible to a player if they also have a GPS.

If a unit with a GPS marker gets in a vehicle their marker will disappear. The text of the vehicle's marker though will change to the name of the vehicle with the name of the unit inside of it in parentheses next to it.
If a unit with a GPS marker dies their marker will be transferred to the next person in their group that has a GPS. If nobody else in the group has a GPS then the marker will stay where the person with GPS last was until a unit from that group picks up a GPS.
If a player who has a GPS drops it they will no longer be able to see the markers on their map. 
If a unit without a GPS picks one up they will be able to see all GPS marks on the map.

USAGE: If you have no vehicles in your mission set _westVehArray and _eastVehArray equal to nil as shown below. Those parameters can be found on lines 35 and 36 in this file.

_westVehArray = nil;
_eastVehArray = nil;

If you do have vehicles in your mission, make sure they are named and then add that name to the array for the team they are on. Either _westVehArray or _eastVehArray on lines 35 and 36 in this file. 

_westVehArray = [bluforTruck1,bluforTruck2]; 
_eastVehArray = [opforTruck1,opforTruck2]; 

If you want the vehicle to have a custom name instead of something weird looking like 'bluTruck' then add this to the vehicles initialization field in the editor and change the GPS marker name to whatever you want.

this setVariable ["bc_MarkerName", "GPS Marker Text Goes Here"];

Call this script on ALL CLIENTS in bc_init.sqf by using the following line:

[] execVM "scripts\bc_scripts\gpsmarkers\client.sqf";

*/
//Local script, dedicated server not needed
if (isDedicated) exitWith {};
//Check to see if mission parameters have markers enabled - Default OFF
_useMarkers = ["s_gps_markers",1] call BIS_fnc_getParamValue;
if (_useMarkers == 0) exitWith {};

_westVehArray = nil;
_eastVehArray = nil;
_hqArray = ["HQ","A SL","B SL","C SL","D SL","E SL","F SL","G SL","H SL"];
iteration = 0;

//CREATE NEW MARKERS
//Infantry
{ //forEach allGroups
	_markerName = str(iteration) + "_marker";
	_x setVariable ["markerName",_markerName];
	_markerPos = getPos (leader _x);
	_markerFaction = switch (faction player) do {
		case "BLU_F": { ["ColorBLUFOR","b_inf","b_hq"] };
		case "OPF_F": { ["ColorOPFOR","o_inf","o_hq"] };
		case "IND_F": { ["ColorGUER","n_inf","n_hq"] };
		default { ["ColorCivilian","mil_box","mil_triangle"] };
	};
	_marker = createMarkerLocal [_markerName,_markerPos];
	_marker setMarkerShapeLocal "ICON";
	_marker setMarkerColorLocal (_markerFaction select 0);
	if (groupID _x in _hqArray) then {
		_marker setMarkerTypeLocal (_markerFaction select 2);
	} else {
		_marker setMarkerTypeLocal (_markerFaction select 1);
	};
	_marker setMarkerTextLocal (groupID _x);
	_marker setMarkerSizeLocal [.75,.75];
	_marker setMarkerAlphaLocal 0;
	iteration = iteration + 1;
} forEach allGroups;

//Vehicles
if (!isNil "_westVehArray") then {
	{ //forEach _westVehArray
		_markerName = str(_x) + "_marker";
		_markerPos = getPos _x;
		_markerFaction = switch (faction player) do {
			case "BLU_F": { ["ColorBLUFOR","b_armor"] };
			case "OPF_F": { ["ColorOPFOR","o_armor"] };
			case "IND_F": { ["ColorINDFOR","n_armor"] };
			default { ["ColorCivilian","hd_dot"] };
		};
		_marker = createMarkerLocal [_markerName,_markerPos];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerColorLocal (_markerFaction select 0);
		_marker setMarkerTypeLocal (_markerFaction select 1);
		_markerString = _x getVariable "bc_MarkerName";
		if (!isNil "_markerString") then {
			_marker setMarkerTextLocal _markerString;
		} else {
			_marker setMarkerTextLocal str(_x);
			_x setVariable ["bc_MarkerName",str(_x)];
		};
		_marker setMarkerSizeLocal [.75,.75];
		_marker setMarkerAlphaLocal 0;
	} forEach _westVehArray;
};
if (!isNil "_eastVehArray") then {
	{ //forEach _eastVehArray
		_markerName = str(_x) + "_marker";
		_markerPos = getPos _x;
		_markerFaction = switch (faction player) do {
			case "BLU_F": { ["ColorBLUFOR","b_armor"] };
			case "OPF_F": { ["ColorOPFOR","o_armor"] };
			case "IND_F": { ["ColorINDFOR","n_armor"] };
			default { ["ColorCivilian","hd_dot"] };
		};
		_marker = createMarkerLocal [_markerName,_markerPos];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerColorLocal (_markerFaction select 0);
		_marker setMarkerTypeLocal (_markerFaction select 1);
		_markerString = _x getVariable "bc_MarkerName";
		if (!isNil "_markerString") then {
			_marker setMarkerTextLocal _markerString;
		} else {
			_marker setMarkerTextLocal str(_x);
			_x setVariable ["bc_MarkerName",str(_x)];
		};
		_marker setMarkerSizeLocal [.75,.75];
		_marker setMarkerAlphaLocal 0;
	} forEach _eastVehArray;
};

sleep 1;

//UPDATE EXISTING MARKERS
while{true} do {
	//Make sure player has GPS, if not there's no reason to run all the code
	//INFANTRY MARKERS
	{ //forEach allGroups
		_group = _x;
		_marker = _group getVariable "markerName";
		//If player has GPS then continue on, if not hide group markers.
		if("ItemGPS" in (assignedItems player)) then {
			//If player is on same side as group leader check that group for people who have GPS.
			if ((faction player) == (faction (leader _x))) then {
				_marker setMarkerAlphaLocal 1;
				{ //forEach allUnits in _group
					_unit = _x;
					//Check to see if ANY units in the group have a GPS and if they do put a marker on that person.
					if ("ItemGPS" in (assignedItems _unit)) then {
						//If unit has GPS but leader has GPS too, set the marker to the leader's position instead.
						if ((_unit != leader _group) && ("ItemGPS" in (assignedItems (leader _group)))) then {
							_unit = leader _group;
						};
						//If the unit being marked isn't on foot hide the marker since he will have a vehicle marker. If not, show the marker.
						if(vehicle _unit != _unit) then {
							_unitInside = (vehicle _unit) getVariable "bc_UnitInside";
							_lastInside = (vehicle _unit) getVariable "bc_LastInside";
							if (isNil "_lastInside") then {_lastInside = "Nobody"};
							if ((!isNil "_unitInside") && (_lastInside != groupID _group)) then {
								_string = ((vehicle _unit) getVariable "bc_UnitInside") + " | " + (groupID _group);
								(vehicle _unit) setVariable ["bc_UnitInside",_string];
								(vehicle _unit) setVariable ["bc_LastInside",groupID _group];
							} else {
								(vehicle _unit) setVariable ["bc_UnitInside",groupID _group];
								(vehicle _unit) setVariable ["bc_LastInside",groupID _group];
							};
							_marker setMarkerAlphaLocal 0;
						} else {
							_marker setMarkerAlphaLocal 1;
						};
						_marker setMarkerPosLocal (getPos _unit);
					};
				} forEach units _group;
			};
		} else {
			//NO GPS - Remove all markers from view
			_marker setMarkerAlphaLocal 0;
		};
	} forEach allGroups;
	
	//VEHICLE MARKERS
	
	//WEST
	if (!(isNil "_westVehArray") && (faction player == "BLU_F")) then {
		{
			_marker = str(_x) + "_marker";
			_unitInside = _x getVariable "bc_UnitInside";
			if("ItemGPS" in (assignedItems player)) then {
				if (!isNil "_unitInside") then {
					_markerText = (_x getVariable "bc_MarkerName") + " (" + (_x getVariable "bc_UnitInside") + ")";
					_x setVariable ["bc_UnitInside",nil];
					_x setVariable ["bc_LastInside",nil];
					_marker setMarkerTextLocal _markerText;
				} else {
					_markerText = (_x getVariable "bc_MarkerName");
					_marker setMarkerTextLocal _markerText;
				};
				_marker setMarkerAlphaLocal 1;
				_marker setMarkerPosLocal (getPos _x);
			} else {
				_marker setMarkerAlphaLocal 0;
			};
		} forEach _westVehArray;
	};
	//EAST
	if (!(isNil "_eastVehArray") && (faction player == "OPF_F")) then {
		{
			_marker = str(_x) + "_marker";
			_unitInside = _x getVariable "bc_UnitInside";
			if("ItemGPS" in (assignedItems player)) then {
				if (!isNil "_unitInside") then {
					_markerText = (_x getVariable "bc_MarkerName") + " (" + (_x getVariable "bc_UnitInside") + ")";
					_x setVariable ["bc_UnitInside",nil];
					_x setVariable ["bc_LastInside",nil];
					_marker setMarkerTextLocal _markerText;
				} else {
					_markerText = (_x getVariable "bc_MarkerName");
					_marker setMarkerTextLocal _markerText;
				};
				_marker setMarkerAlphaLocal 1;
				_marker setMarkerPosLocal (getPos _x);
			} else {
				_marker setMarkerAlphaLocal 0;
			};
		} forEach _eastVehArray;
	};
	sleep 2;
};