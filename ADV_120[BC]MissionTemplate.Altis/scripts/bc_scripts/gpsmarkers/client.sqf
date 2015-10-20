/*
This script creates markers on units that have a GPS on them. These markers are only visible to a player if they also have a GPS.

If a unit with a GPS marker gets in a vehicle their marker will disappear. The text of the vehicle's marker though will change to the name of the vehicle with the name of the unit inside of it in parentheses next to it.
If a unit with a GPS marker dies their marker will be transferred to the next person in their group that has a GPS. If nobody else in the group has a GPS then the marker will stay where the person with GPS last was until a unit from that group picks up a GPS.
If a player who has a GPS drops it they will no longer be able to see the markers on their map. 
If a unit without a GPS picks one up they will be able to see all GPS marks on the map.

If you do have vehicles in your mission, make sure they are named and then add that name to the array for the team they are on. Either _westVehArray or _eastVehArray on lines 37 and 38 in this file. 

	//No vehicles in mission
	_westVehArray = nil;
	_eastVehArray = nil;

	//Vehicles in mission
	_westVehArray = [bluforTruck1,bluforTruck2]; 
	_eastVehArray = [opforTruck]; 

If you want the vehicle to have a custom name instead of something weird looking like 'bluTruck' then add the following line to the vehicles initialization field in the editor to change the GPS marker name to whatever you want:

	this setVariable ["bc_MarkerName", "GPS Marker Text Goes Here"];

Call this script on ALL CLIENTS in bc_init.sqf by using the following line:

[] execVM "scripts\bc_scripts\gpsmarkers\client.sqf";

*/
//Local script, dedicated server not needed
if (isDedicated) exitWith {};
waitUntil {!isNull player};
//Check to see if mission parameters have markers enabled - Default ON
_useMarkers = ["s_gps_markers",1] call BIS_fnc_getParamValue;
if (_useMarkers == 0) exitWith {};


//------------ DO NOT EDIT ABOVE THIS LINE ------------
_westVehArray = nil;
_eastVehArray = nil;
//------------ DO NOT EDIT BELOW THIS LINE ------------

_sideVehArray = switch (side player) do {
    case west: { if (!isNil "_westVehArray") then {_westVehArray}; };
    case east: { if (!isNil "_eastVehArray") then {_eastVehArray}; };
	default { nil };
};
//FUNCTIONS
fn_bc_createVehMarks={
	private ["_vehArray","_markerName","_markerPos","_markerFaction","_marker","_markerString"];
	_vehArray = _this select 0;
	{ //forEach _vehArray
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
	} forEach _vehArray;
};
fn_bc_updateVehMarks={
	private ["_vehArray","_marker","_unitInside","_markerText"];
	_vehArray = _this select 0;
	{
		_marker = str(_x) + "_marker";
		if("ItemGPS" in (assignedItems player)) then {
			_unitInside = _x getVariable "bc_UnitInside";
			//Check to see if any units with markers attached are in a vehicle with a marker. If so attach their name to the vehicle marker.
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
	} forEach _vehArray;
};

_hqArray = ["HQ","A","B","C","D","E","F","G","H"];
bc_gps_iteration = 0;

sleep 5;
//CREATE NEW MARKERS
//Infantry
{ //forEach allGroups
	_markerName = str(bc_gps_iteration) + "_marker";
	_x setVariable ["bc_gps_markerName",_markerName];
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
	bc_gps_iteration = bc_gps_iteration + 1;
} forEach allGroups;

//Vehicles
if (!isNil "_westVehArray") then {[_westVehArray] call fn_bc_createVehMarks;};
if (!isNil "_eastVehArray") then {[_eastVehArray] call fn_bc_createVehMarks;};
//DONE CREATING MARKERS
sleep 1;

//UPDATE EXISTING MARKERS
while{true} do {
	//INFANTRY MARKERS
	{ //forEach allGroups
		_group = _x;
		_marker = _group getVariable "bc_gps_markerName";
		if("ItemGPS" in (assignedItems player)) then { //Check if player has GPS
			if ((faction player) == (faction (leader _x))) then { //Check if player is on same faction as the group
				_marker setMarkerAlphaLocal 1; //If player has GPS and same faction, show marker
				{ //forEach allUnits in _group
					//Check members in group for GPS and update the marker to the position of the most senior member in the group who has GPS
					_unit = _x;
					_senior = _group getVariable ["bc_seniorGPS",objNull];
					if (!isNull _senior) then { //If _senior is set then...
						if (!("ItemGPS" in (assignedItems _unit))) then { //Make sure most senior unit still has GPS
							_group setVariable ["bc_seniorGPS",objNull];
						};
					};
					if (("ItemGPS" in (assignedItems _unit)) && ((isNull _senior) || (_senior == _unit))) then { //no reason to run this stuff if _unit isn't the most senior member
						if (isNull _senior) then {
							_group setVariable ["bc_seniorGPS",_unit]; //no better match than _unit
						};
						if (vehicle _unit != _unit) then { //If unit isn't on foot and vehicle doesn't have a marker
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
							if ((!isNil "_sideVehArray") && (vehicle _unit in _sideVehArray)) then {
								_marker setMarkerAlphaLocal 0; //Hide marker when unit is in a vehicle that has a marker
							} else {
								_marker setMarkerAlphaLocal 1; //Vehicle doesn't have a marker, show unit's marker instead
							};
						} else {
							_marker setMarkerAlphaLocal 1; //Show marker when unit is not in a vehicle with a marker
						};
						_marker setMarkerPosLocal (getPos _unit);
					};
				} forEach units _group;
			};
		} else {
			_marker setMarkerAlphaLocal 0; // Player has no GPS
		};
	} forEach allGroups;
	
	//VEHICLE MARKERS
	if ((!isNil "_westVehArray") && (faction player == "BLU_F")) then {[_westVehArray] call fn_bc_updateVehMarks;};
	if ((!isNil "_eastVehArray") && (faction player == "OPF_F")) then {[_eastVehArray] call fn_bc_updateVehMarks;};
	sleep 2;
};