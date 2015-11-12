fn_bc_updateVehMarks={
    private ["_vehArray","_marker","_unitInside","_markerText"];
    _vehArray = _this select 0;
    {
        _veh = _x select 0;
        _marker = str(_veh) + "_marker";
        if("ItemGPS" in (assignedItems player)) then {
            _unitInside = _veh getVariable "bc_UnitInside";
            //Check to see if any units with markers attached are in a vehicle with a marker. If so attach their name to the vehicle marker.
            if (!isNil "_unitInside") then {
                _markerText = (_veh getVariable "bc_MarkerName") + " (" + (_veh getVariable "bc_UnitInside") + ")";
                _veh setVariable ["bc_UnitInside",nil];
                _veh setVariable ["bc_LastInside",nil];
                _marker setMarkerTextLocal _markerText;
            } else {
                _markerText = (_veh getVariable "bc_MarkerName");
                _marker setMarkerTextLocal _markerText;
            };
            _marker setMarkerAlphaLocal 1;
            _marker setMarkerPosLocal (getPos _veh);
        } else {
            _marker setMarkerAlphaLocal 0;
        };
    } forEach _vehArray;
};

{ //forEach allGroups
    if (!((groupID _x) in bc_ignoreMarkerArray)) then {
        _group = _x;
        _marker = _group getVariable "bc_gps_markerName";
        _marker2 = _marker + "Size";
        if("ItemGPS" in (assignedItems player)) then { //Check if player has GPS
            if ((side player) == (side (leader _x))) then { //Check if player is on same side as the group
                _marker setMarkerAlphaLocal 1; //If player has GPS and same side, show marker
                _marker2 setMarkerAlphaLocal 1;
                
                { //forEach allUnits in _group
                    //Check members in group for GPS and update the marker to the position of the most senior member in the group who has GPS
                    _unit = _x;
                    _senior = _group getVariable ["bc_seniorGPS",objNull];
                    if (!isNull _senior) then { //If _senior is set then...
                        if (!("ItemGPS" in (assignedItems _senior)) || (!alive _senior)) then { //Make sure most senior unit still has GPS and is alive
                            _group setVariable ["bc_seniorGPS",objNull];
                        };
                    };
                    _senior = _group getVariable ["bc_seniorGPS",objNull]; // put this here or _senior won't update for the below code block
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
                            if (!isNil "bc_sideVehArray") then {
                                if (vehicle _unit in bc_sideVehArray2) then {
                                    _marker setMarkerAlphaLocal 0; //Hide marker when unit is in a vehicle that has a marker
                                    _marker2 setMarkerAlphaLocal 0;
                                } else {
                                    _marker setMarkerAlphaLocal 1; //Vehicle doesn't have a marker, show unit's marker instead
                                    _marker2 setMarkerAlphaLocal 1;
                                };
                            };
                        } else {
                            _marker setMarkerAlphaLocal 1; //Show marker when unit is not in a vehicle with a marker
                            _marker2 setMarkerAlphaLocal 1;
                        };
                        _marker setMarkerPosLocal (getPos _unit);
                        _marker2 setMarkerPosLocal (getPos _unit);
                    };
                } forEach units _group;
            };
        } else {
            _marker setMarkerAlphaLocal 0; // Player has no GPS
            _marker2 setMarkerAlphaLocal 0;
        };
    };
} forEach allGroups;

//VEHICLE MARKERS
if (!isNil "bc_sideVehArray") then {[bc_sideVehArray] call fn_bc_updateVehMarks;};