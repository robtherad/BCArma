//_this select 0 params [bc_ignoreMarkerArray];
//FUNCTIONS
fn_bc_createVehMarks={
	private ["_vehArray","_markerName","_markerPos","_markerFaction","_marker","_markerString"];
	_vehArray = _this select 0;
	{ //forEach _vehArray
        _veh = _x select 0;
        _type = (_x select 1)+1;
        systemChat format ["GPS - %1",(count _x)];
		_markerName = str(_veh) + "_marker";
		_markerPos = getPos _veh;
		_markerFaction = switch (side player) do {
			case west: { ["ColorBLUFOR","b_armor","b_air","b_plane","b_unknown"] };
			case east: { ["ColorOPFOR","o_armor","o_air","o_plane","o_unknown"] };
			case independent: { ["ColorINDFOR","n_armor","n_air","n_plane","n_unknown"] };
			default { ["ColorCivilian","c_car","c_air","c_plane","c_unknown"] };
		};
		_marker = createMarkerLocal [_markerName,_markerPos];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerColorLocal (_markerFaction select 0);
		_marker setMarkerTypeLocal (_markerFaction select _type);
		_markerString = _veh getVariable "bc_MarkerName";
		if (!isNil "_markerString") then {
			_marker setMarkerTextLocal _markerString;
		} else {
			_marker setMarkerTextLocal str(_veh);
			_veh setVariable ["bc_MarkerName",str(_veh)];
		};
		_marker setMarkerSizeLocal [.75,.75];
		_marker setMarkerAlphaLocal 0;
	} forEach _vehArray;
};

_sizeMarkOptions = ["group_0","group_2","group_3","group_4"];
bc_gps_iteration = 0;

//CREATE NEW MARKERS
//Infantry
{ //forEach allGroups
	if (!((groupID _x) in bc_ignoreMarkerArray)) then {
		_markerName = str(bc_gps_iteration) + "_marker";
        _groupSize = _x getVariable ["bc_gps_groupSize",0];
		_x setVariable ["bc_gps_markerName",_markerName];
		_markerPos = getPos (leader _x);
		_markerFaction = switch (side player) do {
			case west: { ["ColorBLUFOR","b_inf","b_hq"] };
			case east: { ["ColorOPFOR","o_inf","o_hq"] };
			case independent: { ["ColorGUER","n_inf","n_hq"] };
			default { ["ColorCivilian","mil_box","mil_triangle"] };
		};
		_marker = createMarkerLocal [_markerName,_markerPos];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerColorLocal (_markerFaction select 0);
		_marker setMarkerTypeLocal (_markerFaction select 1);
		//_marker setMarkerTextLocal (groupID _x);
		_marker setMarkerAlphaLocal 0;
        _marker setMarkerSizeLocal [.75,.75];
        _marker setMarkerTextLocal (groupID _x);
        //Group Size Marker
        _markerName2 = _markerName + "Size";
        _sizeMarker = createMarkerLocal [_markerName2,_markerPos];
        _sizeMarker setMarkerShapeLocal "ICON";
		_sizeMarker setMarkerTypeLocal (_sizeMarkOptions select _groupSize);
        _sizeMarker setMarkerSizeLocal [.75,.75];
        _sizeMarker setMarkerAlphaLocal 0;
        
		bc_gps_iteration = bc_gps_iteration + 1;
	};
} forEach allGroups;

//Vehicles
if (!isNil "bc_sideVehArray") then {[bc_sideVehArray] call fn_bc_createVehMarks;};
//DONE CREATING MARKERS

bc_gps_iteration = nil; //might as well destroy this variable since it's not used again

bc_gpsHandle = [BC_fnc_gps_updateMarks, 2, []] call CBA_fnc_addPerFrameHandler;