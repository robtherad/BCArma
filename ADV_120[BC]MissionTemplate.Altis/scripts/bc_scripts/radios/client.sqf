/*
Gets called from bc_init.sqf on the client. If you are using every piece of the template there is nothing you need to change in this file.
*/
if(isDedicated) exitWith {};
waitUntil {!isNull player};

bc_radioScriptRunning = true;
waitUntil { !isNil "bc_opforBaseChannel"; };
waitUntil { !isNil "bc_bluforBaseChannel"; };
titleText ["Radio channels should be set up in 5 seconds. Please be patient.","PLAIN DOWN"];
//Figure out which side the player is on. 
_side = side player;
switch (_side) do {
    case east: { bc_playerBaseChannel = bc_opforBaseChannel; };
    case west: { bc_playerBaseChannel = bc_bluforBaseChannel; };
	default { titleText ["The game thinks you aren't on OPFOR or BLUFOR!","PLAIN"]; };
};
//Error message
if(isNil "bc_playerBaseChannel") exitWith {titleText ["Error! Default radio channels will not be set!","PLAIN DOWN",0.5];};

bc_ch1 = bc_playerBaseChannel; //All players will be able to switch to channel 1 to get on platoon net.

//Use player's groupID to find out what element he's in. Use that to set up his default radio channels.
switch (groupID (group player)) do {
	case "HQ": {bc_ch2 = bc_playerBaseChannel + 1;  bc_ch3 = bc_playerBaseChannel + 2; bc_ch4 = bc_playerBaseChannel + 3; bc_ch5 = bc_playerBaseChannel + 4; bc_ch6 = bc_playerBaseChannel + .1; bc_curChan = 1; bc_altChan = 6;};
	case "A": { bc_ch2 = bc_playerBaseChannel + 1; bc_ch3 = bc_playerBaseChannel + 1.1; bc_ch4 = bc_playerBaseChannel + 1.2; bc_curChan = 2; bc_altChan = 1;};
	case "A1": { bc_ch2 = bc_playerBaseChannel + 1; bc_ch3 = bc_playerBaseChannel + 1.1; bc_ch4 = bc_playerBaseChannel + 1.2; bc_curChan = 3; bc_altChan = 2;};
	case "A2": { bc_ch2 = bc_playerBaseChannel + 1; bc_ch3 = bc_playerBaseChannel + 1.1; bc_ch4 = bc_playerBaseChannel + 1.2; bc_curChan = 4; bc_altChan = 2;};
	case "B": {bc_ch2 = bc_playerBaseChannel + 2; bc_ch3 = bc_playerBaseChannel + 2.1; bc_ch4 = bc_playerBaseChannel + 2.2; bc_curChan = 2; bc_altChan = 1;};
	case "B1": { bc_ch2 = bc_playerBaseChannel + 2; bc_ch3 = bc_playerBaseChannel + 2.1; bc_ch4 = bc_playerBaseChannel + 2.2; bc_curChan = 3; bc_altChan = 2;};
	case "B2": { bc_ch2 = bc_playerBaseChannel + 2; bc_ch3 = bc_playerBaseChannel + 2.1; bc_ch4 = bc_playerBaseChannel + 2.2; bc_curChan = 4; bc_altChan = 2;};
	case "C": { bc_ch2 = bc_playerBaseChannel + 3; bc_ch3 = bc_playerBaseChannel + 3.1; bc_ch4 = bc_playerBaseChannel + 3.2; bc_curChan = 2; bc_altChan = 1;};
	case "C1": { bc_ch2 = bc_playerBaseChannel + 3; bc_ch3 = bc_playerBaseChannel + 3.1; bc_ch4 = bc_playerBaseChannel + 3.2; bc_curChan = 3; bc_altChan = 2;};
	case "C2": { bc_ch2 = bc_playerBaseChannel + 3; bc_ch3 = bc_playerBaseChannel + 3.1; bc_ch4 = bc_playerBaseChannel + 3.2; bc_curChan = 4; bc_altChan = 2;};
	case "D": { bc_ch2 = bc_playerBaseChannel + 4; bc_ch3 = bc_playerBaseChannel + 4.1; bc_ch4 = bc_playerBaseChannel + 4.2; bc_curChan = 2; bc_altChan = 1;};
	case "D1": { bc_ch2 = bc_playerBaseChannel + 4; bc_ch3 = bc_playerBaseChannel + 4.1;bc_curChan = 3; bc_altChan = 2;};
	case "D2": { bc_ch2 = bc_playerBaseChannel + 4; bc_ch3 = bc_playerBaseChannel + 4.2;bc_curChan = 3; bc_altChan = 2;};
	case "D3": { bc_ch2 = bc_playerBaseChannel + 4; bc_ch3 = bc_playerBaseChannel + 4.3;bc_curChan = 3; bc_altChan = 2;};
	case "D4": { bc_ch2 = bc_playerBaseChannel + 4; bc_ch3 = bc_playerBaseChannel + 4.4;bc_curChan = 3; bc_altChan = 2;};
	
	
	case "HQ": {bc_ch2 = bc_playerBaseChannel + 1;  bc_ch3 = bc_playerBaseChannel + 2; bc_ch4 = bc_playerBaseChannel + 3; bc_ch5 = bc_playerBaseChannel + 4; bc_ch6 = bc_playerBaseChannel + .1; bc_curChan = 1; bc_altChan = 6;};
	case "E": { bc_ch2 = bc_playerBaseChannel + 1; bc_ch3 = bc_playerBaseChannel + 1.1; bc_ch4 = bc_playerBaseChannel + 1.2; bc_curChan = 2; bc_altChan = 1;};
	case "E1": { bc_ch2 = bc_playerBaseChannel + 1; bc_ch3 = bc_playerBaseChannel + 1.1; bc_ch4 = bc_playerBaseChannel + 1.2; bc_curChan = 3; bc_altChan = 2;};
	case "E2": { bc_ch2 = bc_playerBaseChannel + 1; bc_ch3 = bc_playerBaseChannel + 1.1; bc_ch4 = bc_playerBaseChannel + 1.2; bc_curChan = 4; bc_altChan = 2;};
	case "F": {bc_ch2 = bc_playerBaseChannel + 2; bc_ch3 = bc_playerBaseChannel + 2.1; bc_ch4 = bc_playerBaseChannel + 2.2; bc_curChan = 2; bc_altChan = 1;};
	case "F1": { bc_ch2 = bc_playerBaseChannel + 2; bc_ch3 = bc_playerBaseChannel + 2.1; bc_ch4 = bc_playerBaseChannel + 2.2; bc_curChan = 3; bc_altChan = 2;};
	case "F2": { bc_ch2 = bc_playerBaseChannel + 2; bc_ch3 = bc_playerBaseChannel + 2.1; bc_ch4 = bc_playerBaseChannel + 2.2; bc_curChan = 4; bc_altChan = 2;};
	case "G": { bc_ch2 = bc_playerBaseChannel + 3; bc_ch3 = bc_playerBaseChannel + 3.1; bc_ch4 = bc_playerBaseChannel + 3.2; bc_curChan = 2; bc_altChan = 1;};
	case "G1": { bc_ch2 = bc_playerBaseChannel + 3; bc_ch3 = bc_playerBaseChannel + 3.1; bc_ch4 = bc_playerBaseChannel + 3.2; bc_curChan = 3; bc_altChan = 2;};
	case "G2": { bc_ch2 = bc_playerBaseChannel + 3; bc_ch3 = bc_playerBaseChannel + 3.1; bc_ch4 = bc_playerBaseChannel + 3.2; bc_curChan = 4; bc_altChan = 2;};
	case "H": { bc_ch2 = bc_playerBaseChannel + 4; bc_ch3 = bc_playerBaseChannel + 4.1; bc_ch4 = bc_playerBaseChannel + 4.2; bc_curChan = 2; bc_altChan = 1;};
	case "H1": { bc_ch2 = bc_playerBaseChannel + 4; bc_ch3 = bc_playerBaseChannel + 4.1;bc_curChan = 3; bc_altChan = 2;};
	case "H2": { bc_ch2 = bc_playerBaseChannel + 4; bc_ch3 = bc_playerBaseChannel + 4.2;bc_curChan = 3; bc_altChan = 2;};
	case "H3": { bc_ch2 = bc_playerBaseChannel + 4; bc_ch3 = bc_playerBaseChannel + 4.3;bc_curChan = 3; bc_altChan = 2;};
	case "H4": { bc_ch2 = bc_playerBaseChannel + 4; bc_ch3 = bc_playerBaseChannel + 4.4;bc_curChan = 3; bc_altChan = 2;};
};


if (isNil "bc_curChan") then {
	//player isn't part of any template group
	bc_curChan = 1;
	bc_altChan = 8;
};

//Generate Mission Notes
bc_radioNoteString = "<font size='24'>Your Radio's Default Settings</font><br/><br/>Channel 1: " + str(bc_ch1) + " MHz<br/>";
if (!isNil "bc_ch2") then {bc_radioNoteString = bc_radioNoteString + "Channel 2: " + str(bc_ch2) + " MHz<br/>";};
if (!isNil "bc_ch3") then {bc_radioNoteString = bc_radioNoteString + "Channel 3: " + str(bc_ch3) + " MHz<br/>";};
if (!isNil "bc_ch4") then {bc_radioNoteString = bc_radioNoteString + "Channel 4: " + str(bc_ch4) + " MHz<br/>";};
if (!isNil "bc_ch5") then {bc_radioNoteString = bc_radioNoteString + "Channel 5: " + str(bc_ch5) + " MHz<br/>";};
if (!isNil "bc_ch6") then {bc_radioNoteString = bc_radioNoteString + "Channel 6: " + str(bc_ch6) + " MHz<br/>";};
if (!isNil "bc_ch7") then {bc_radioNoteString = bc_radioNoteString + "Channel 7: " + str(bc_ch7) + " MHz<br/>";};
if (!isNil "bc_ch8") then {bc_radioNoteString = bc_radioNoteString + "Channel 8: " + str(bc_ch8) + " MHz<br/>";};
if (!isNil "bc_ch9") then {bc_radioNoteString = bc_radioNoteString + "Channel 9: " + str(bc_ch9) + " MHz<br/>";};

//Let player know what channels he starts on.
bc_radioNoteString = bc_radioNoteString + "<br/>Main Channel (left ear): <font color='#90ee90'>CH " + str(bc_curChan) + "</font><br/>Alt. Channel (right ear): <font color='#90ee90'>CH " + str(bc_altChan) + "</font>";
//List default frequencies for sides
bc_radioNoteString = bc_radioNoteString + "<br/><br/>";
if (_side == west) then {
	bc_radioNoteString = bc_radioNoteString + "<font size='24'>Default Radio Frequency List</font><br/><br/>" + "Plt. HQ - " + str(bc_playerBaseChannel) + " MHz<br/><br/>" + "Alpha Squad - " + str(bc_playerBaseChannel + 1) + " MHz<br/>" + "Alpha One - " + str(bc_playerBaseChannel + 1.1) + " MHz<br/>" + "Alpha Two - " + str(bc_playerBaseChannel + 1.2) + " MHz<br/><br/>" + "Bravo Squad - " + str(bc_playerBaseChannel + 2) + " MHz<br/>" + "Bravo One - " + str(bc_playerBaseChannel + 2.1) + " MHz<br/>" + "Bravo Two - " + str(bc_playerBaseChannel + 2.2) + " MHz<br/><br/>" + "Charlie Squad - " + str(bc_playerBaseChannel + 3) + " MHz<br/>" +"Charlie One - " + str(bc_playerBaseChannel + 3.1) + " MHz<br/>" + "Charlie Two - " + str(bc_playerBaseChannel + 3.2) + " MHz<br/><br/>" + "Delta Squad - " + str(bc_playerBaseChannel + 4) + " MHz<br/>" +"Delta One - " + str(bc_playerBaseChannel + 4.1) + " MHz<br/>" + "Delta Two - " + str(bc_playerBaseChannel + 4.2) + " MHz<br/>" + "Delta Three - " + str(bc_playerBaseChannel + 4.3) + " MHz<br/>" + "Delta Four - " + str(bc_playerBaseChannel + 4.4) + " MHz<br/>";
} else {
	bc_radioNoteString = bc_radioNoteString + "<font size='24'>Default Radio Frequency List</font><br/><br/>" + "Plt. HQ - " + str(bc_playerBaseChannel) + " MHz<br/><br/>" + "Echo Squad - " + str(bc_playerBaseChannel + 1) + " MHz<br/>" + "Echo One - " + str(bc_playerBaseChannel + 1.1) + " MHz<br/>" + "Echo Two - " + str(bc_playerBaseChannel + 1.2) + " MHz<br/><br/>" + "Foxtrot Squad - " + str(bc_playerBaseChannel + 2) + " MHz<br/>" + "Foxtrot One - " + str(bc_playerBaseChannel + 2.1) + " MHz<br/>" + "Foxtrot Two - " + str(bc_playerBaseChannel + 2.2) + " MHz<br/><br/>" + "Golf Squad - " + str(bc_playerBaseChannel + 3) + " MHz<br/>" + "Golf One - " + str(bc_playerBaseChannel + 3.1) + " MHz<br/>" + "Golf Two - " + str(bc_playerBaseChannel + 3.2) + " MHz<br/><br/>" + "Hotel Squad - " + str(bc_playerBaseChannel + 4) + " MHz<br/>" + "Hotel One - " + str(bc_playerBaseChannel + 4.1) + " MHz<br/>" + "Hotel Two - " + str(bc_playerBaseChannel + 4.2) + " MHz<br/>" + "Hotel Three - " + str(bc_playerBaseChannel + 4.3) + " MHz<br/>" + "Hotel Four - " + str(bc_playerBaseChannel + 4.4) + " MHz<br/>";
};
player createDiaryRecord ["diary", ["[BC] Radio Settings", bc_radioNoteString]];
//End Mission Notes


//Check if player has an item that will be turned into a TFAR radio. Save the info for later
bc_hasSWitem = false;
bc_hasLRitem = false;

//Lists of items that turn into TFAR radios recognized by TFAR
_LRlist = ["tf_rt1523g","tf_rt1523g_big","tf_rt1523g_black","tf_rt1523g_fabric","tf_rt1523g_green","tf_rt1523g_rhs","tf_rt1523g_sage","tf_anarc210","tf_rt1523g_big_bwmod","tf_rt1523g_big_bwmod_tropen","tf_rt1523g_bwmod","tf_rt1523g_big_rhs","tf_mr3000","tf_mr3000_multicam","tf_mr3000_rhs","tf_mr6000l","tf_mr3000_bwmod","tf_mr3000_bwmod_tropen","tf_anprc155","tf_anprc155_coyote","tf_anarc164"];
_SWlist = ["ItemRadio","tf_anprc152","tf_anprc148jem","tf_fadak","tf_pnr100a","tf_anprc154","tf_rf7800str"];

//Check to see if player has any items matching the lists above.
if ((backpack player) in _LRlist) then {
	bc_hasLRitem = true;
};
{
	if (_x in _SWlist) then {
		bc_hasSWitem = true;
	};
} forEach (assignedItems player);

//Get initial values from TFAR and see if they match with what the player had on him.
bc_hasLR = call TFAR_fnc_haveLRRadio;
bc_hasSW = call TFAR_fnc_haveSWRadio;

//If the player previously had items that were TFAR items but doesnt have a TFAR radio then wait until everything syncs up.
while {(bc_hasSWitem) && (!bc_hasSW)} do {
	bc_hasSW = call TFAR_fnc_haveSWRadio;
	titleText ["BC RADIO SCRIPT\nWAITING FOR SW TO SYNC","PLAIN DOWN"];
	sleep 0.1;
};
while {(bc_hasLRitem) && (!bc_hasLR)} do {
	bc_hasLR = call TFAR_fnc_haveLRRadio;
	titleText ["BC RADIO SCRIPT\nWAITING FOR LR TO SYNC","PLAIN DOWN"];
	sleep 0.1;
};

//Change channel numbers from user readable to script readable
bc_curChan = bc_curChan - 1;
bc_altChan = bc_altChan - 1;

//Only setup long range channels if player has one
if (bc_hasLR) then {
	bc_curSettings = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
	//Set default channel
	bc_curSettings set [0,bc_curChan];
	//Set default volume
	bc_curSettings set [1,6];
	//Setup frequencies for channels 1-9
	bc_chanSettings = bc_curSettings select 2;
	if (!isNil "bc_ch1") then {bc_chanSettings set [0,str(bc_ch1)];};
	if (!isNil "bc_ch2") then {bc_chanSettings set [1,str(bc_ch2)];};
	if (!isNil "bc_ch3") then {bc_chanSettings set [2,str(bc_ch3)];};
	if (!isNil "bc_ch4") then {bc_chanSettings set [3,str(bc_ch4)];};
	if (!isNil "bc_ch5") then {bc_chanSettings set [4,str(bc_ch5)];};
	if (!isNil "bc_ch6") then {bc_chanSettings set [5,str(bc_ch6)];};
	if (!isNil "bc_ch7") then {bc_chanSettings set [6,str(bc_ch7)];};
	if (!isNil "bc_ch8") then {bc_chanSettings set [7,str(bc_ch8)];};
	if (!isNil "bc_ch9") then {bc_chanSettings set [8,str(bc_ch9)];};
	bc_curSettings set [2,bc_chanSettings];
	//Set stero mode for default channel
	bc_curSettings set [3,1];
	//Set alternate channel
	bc_curSettings set [5,bc_altChan];
	//Set stero mode for alternate channel
	bc_curSettings set [6,2];
	[(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, bc_curSettings] call TFAR_fnc_setLrSettings;
};

//Only setup short wave channels if player has one
if (bc_hasSW) then {
	bc_curSettings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
	//Set default channel
	bc_curSettings set [0,bc_curChan];
	//Set default volume
	bc_curSettings set [1,6];
	//Setup frequencies for channels 1-9
	bc_chanSettings = bc_curSettings select 2;
	if (!isNil "bc_ch1") then {bc_chanSettings set [0,str(bc_ch1)];};
	if (!isNil "bc_ch2") then {bc_chanSettings set [1,str(bc_ch2)];};
	if (!isNil "bc_ch3") then {bc_chanSettings set [2,str(bc_ch3)];};
	if (!isNil "bc_ch4") then {bc_chanSettings set [3,str(bc_ch4)];};
	if (!isNil "bc_ch5") then {bc_chanSettings set [4,str(bc_ch5)];};
	if (!isNil "bc_ch6") then {bc_chanSettings set [5,str(bc_ch6)];};
	if (!isNil "bc_ch7") then {bc_chanSettings set [6,str(bc_ch7)];};
	if (!isNil "bc_ch8") then {bc_chanSettings set [7,str(bc_ch8)];};
	bc_curSettings set [2,bc_chanSettings];
	//Set stero mode for default channel
	bc_curSettings set [3,1];
	//Set alternate channel
	bc_curSettings set [5,bc_altChan];
	//Set stero mode for alternate channel
	bc_curSettings set [6,2];
	
	[(call TFAR_fnc_activeSwRadio), bc_curSettings] call TFAR_fnc_setSwSettings;
};


//Everything should be setup. Let the player know.
titleText ["You radio channels should have been set. Good luck!","PLAIN DOWN",0.5];