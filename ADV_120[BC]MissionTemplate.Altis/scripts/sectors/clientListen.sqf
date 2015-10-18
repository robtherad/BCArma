disableSerialization;
//Make sure the sector control script has been running long enough
waitUntil {if (!isNil "bc_opfText") then {true};};
waitUntil {if (!isNil "bc_bluText") then {true};};

while {true} do {
	//Create displays in bottom left
	("bluRsc" call BIS_fnc_rscLayer) cutRsc ["redforStructText", "PLAIN"];
	("redRsc" call BIS_fnc_rscLayer) cutRsc ["bluforStructText", "PLAIN"];
	//If displays weren't created then exit the script
	if (uiNameSpace getVariable "redforStructText" == displayNull) exitWith {hint "OPFOR display not defined in description.ext"};
	if (uiNameSpace getVariable "bluforStructText" == displayNull) exitWith {hint "BLUFOR display not defined in description.ext"};
	
	//Update text in the displays to match the points markers
	_display = uiNameSpace getVariable "redforStructText";
		_setText = _display displayCtrl 1001;
			_setText ctrlSetStructuredText (parseText format ["%1",bc_opfText]);
	_display2 = uiNameSpace getVariable "bluforStructText";
		_setText2 = _display2 displayCtrl 1002;
			_setText2 ctrlSetStructuredText (parseText format ["%1",bc_bluText]);
	sleep 3;
};