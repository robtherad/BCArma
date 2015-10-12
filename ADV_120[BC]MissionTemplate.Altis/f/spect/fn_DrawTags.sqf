// F3 - Spectator Script
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ==================================================================
// draw tags
if(!f_cam_toggleTags || f_cam_mapMode == 2 ) exitWith{};
{
	_drawUnits = [];
	_drawGroup = false;
	_isPlayerGroup = false;
	{
		_distToCam = (call f_cam_GetCurrentCam) distance _x;
		if(isPlayer _x) then {_isPlayerGroup = true};
		if(_distToCam < 250) then
		{
			_drawUnits pushBack _x;
			if (_distToCam > 200) then {
				_drawGroup = true;
			};
		}
		else
		{
			_drawGroup = true;
		};
	} foreach units _x;
	_color = switch (side _x) do {
	    case blufor: {f_cam_blufor_color};
	    case opfor: {f_cam_opfor_color};
	    case independent: {f_cam_indep_color};
	    case civilian: {f_cam_civ_color};
	    default {f_cam_empty_color};
	};
	if(_drawGroup) then {
		_visPos = getPosATLVisual leader _x;
		if(surfaceIsWater _visPos) then  {_visPos = getPosASLVisual leader _x;};
		if(_isPlayerGroup) then {
			_color set [3,0.7];
		}
		else {
			_color set [3,0.4];
		};
		_str = _x getVariable ["f_cam_nicename",""];
		if(_str == "") then {
			_str = (toString(toArray(_x getVariable ["BC_LongName",(groupID _x)]) - [45]));
			_x setVariable ["f_cam_nicename",_str];
		};
		drawIcon3D ["\A3\ui_f\data\map\markers\nato\b_inf.paa", _color,[_visPos select 0,_visPos select 1,(_visPos select 2) +30], 1, 1, 0,_str, 2, 0.025, "TahomaB"];
	};

	{
		if(vehicle _x == _x && alive _x || vehicle _x != _x && (crew vehicle _x) select 0 == _x && alive _x) then
		{
			_visPos = getPosATLVisual _x;
			if(surfaceIsWater _visPos) then  {_visPos = getPosASLVisual _x;};
			_color set [3,0.9];
			_str = "";
			_icon = "\A3\ui_f\data\map\markers\military\dot_CA.paa";
			if(isPlayer _x) then
			{
				_str = name _x;
			};
			drawIcon3D [_icon, _color,[_visPos select 0,_visPos select 1,(_visPos select 2) +3], 0.7, 0.7, 0,_str, 2, 0.025, "TahomaB"];
		};
	} foreach _drawUnits;


} forEach allGroups;
//UPDATE PLAYER POS SO HE CAN LISTEN TO PLAYERS
if (!f_cam_muteSpectators) then {
	if (f_cam_freecamOn) then {
		player setPos (getPos f_cam_freecamera);
	} else {
		player setPos (getPos f_cam_camera);
	};
	//hint format ["POS = %1",getPos player];
	player setVariable ["tf_voiceVolume", 0.0, true];
} else {
	player setVariable ["tf_voiceVolume", 1.0, true];
	if (player distance2D [0,0,0] > 10) then {
		player setPos [0,0,5];
		
	};
	//hint format ["POS = %1",getPos player];
};
sectorControl = missionNamespace getVariable "sectorControlActive";
if (!isNil "sectorControl") then {
	if (sectorControl) then {
		{ //forEach triggerArray;
			_owner = _x getVariable "lastOwner";
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
			drawIcon3D ["\A3\ui_f\data\map\markers\military\flag_ca.paa",_color,getpos _x ,1,1,0,iconName,2,0.03,"TahomaB"];
		} forEach triggerArray;
	};
};