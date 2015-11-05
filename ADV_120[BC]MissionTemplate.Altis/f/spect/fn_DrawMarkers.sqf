if(f_cam_mapMode == 0) exitWith {};
disableSerialization;
_fullmapWindow = _this select 0;
_camera = ([] call f_cam_GetCurrentCam);
_fullmapWindow drawIcon ["\A3\ui_f\data\GUI\Rsc\RscDisplayMissionEditor\iconCamera_ca.paa", [0,0,0,1],getpos _camera ,20,20,getDir _camera,"",0];
{
    if(alive _x) then {
        _name = "";
        _color = switch (side _x) do {
            case blufor: {f_cam_blufor_color};
            case opfor: {f_cam_opfor_color};
            case independent: {f_cam_indep_color};
            case civilian: {f_cam_civ_color};
            default {f_cam_empty_color};
        };
        if(isPlayer _x) then {_name = name _x};
        if(leader _x == _x && {isPlayer _x} count units _x > 0) then {_name = format["%1 - %2",toString(toArray(groupID (group _x)) - [45]),_name]};
        if(vehicle _x != _x && crew (vehicle _x) select 0 == _x || vehicle _x == _x) then {
            _icon = (vehicle _x getVariable ["f_cam_icon",""]);
            if(_icon == "") then {_icon = gettext (configfile >> "CfgVehicles" >> typeOf (vehicle _x) >> "icon");vehicle _x setVariable ["f_cam_icon",_icon]};
            _fullmapWindow drawIcon [_icon,_color,getpos _x,19,19,getDir (vehicle _x),_name,1,0.04,"TahomaB"];
        };
    };

} foreach allunits;
sectorControl = missionNamespace getVariable "bc_sectorControlActive";
if (!isNil "sectorControl") then {
    if (sectorControl) then {
        { //forEach bc_triggerArray;
            _owner = _x getVariable "bc_sec_lastOwner";
            _color = switch (_owner) do {
                case 0: {f_cam_blufor_color};
                case 1: {f_cam_opfor_color};
                case 2: {f_cam_gray_color};
                case 3: {f_cam_gray_color};
                default {f_cam_gray_color};
            };
            _color set [3,1];
            iconName = triggerText _x;
            switch (_owner) do {
                case 0: {iconName = str(iconName) + " - BLUFOR";};
                case 1: {iconName = str(iconName) + " - OPFOR";};
                case 2: {iconName = str(iconName) + " - CONTESTED";};
                case 3: {iconName = str(iconName) + " - Neutral";};
                default {iconName = str(iconName) + " - ERROR";};
            };
            _fullmapWindow drawIcon ["\A3\ui_f\data\map\markers\military\flag_ca.paa",_color,getpos _x ,20,20,0,iconName,2,0.04,"TahomaB"];
        } forEach bc_triggerArray;
    };
};

f_cam_fired = f_cam_fired - [objNull];
if(f_cam_tracerOn) then {
    {
        if(!isNull  _x) then {
            _pos = getpos _x;
            _newPos = [(_pos select 0) + (3 * sin(getdir _x)), (_pos select 1) + (3 * cos(getdir _x)), _pos select 2];
            _fullmapWindow drawLine [_pos,_newPos,[1,0,0,1]];
        };
    } foreach f_cam_fired;
};
