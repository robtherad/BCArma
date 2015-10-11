/*
Gets called from bc_init.sqf on the client. If you are using every piece of the template there is nothing you need to change in this file.
*/
if(isDedicated) exitWith {};
bcRadioScriptRunning = true;
waitUntil { !isNil "opforBaseChannel"; };
waitUntil { !isNil "bluforBaseChannel"; };
titleText ["Radio channels should be set up in 5 seconds. Please be patient.","PLAIN DOWN"];
//Figure out which side the player is on. 
_side = side player;
switch (_side) do {
    case east: { playerBaseChannel = opforBaseChannel; };
    case west: { playerBaseChannel = bluforBaseChannel; };
};
//Error message
if(isNil "playerBaseChannel") exitWith {hint "Error! Default radio channels will not be set!"};

ch1 = playerBaseChannel; //All players will be able to switch to channel 1 to get on platoon net.

//Use player's groupID to find out what element he's in. Use that to set up his default radio channels.
switch (groupID (group player)) do {
	case "HQ": {ch2 = playerBaseChannel + 1;  ch3 = playerBaseChannel + 2; ch4 = playerBaseChannel + 3; ch5 = playerBaseChannel + 4; ch6 = playerBaseChannel + .1; curChan = 1; altChan = 6;};
	case "A": { ch2 = playerBaseChannel + 1; ch3 = playerBaseChannel + 1.1; ch4 = playerBaseChannel + 1.2; curChan = 2; altChan = 1;};
	case "A1": { ch2 = playerBaseChannel + 1; ch3 = playerBaseChannel + 1.1; ch4 = playerBaseChannel + 1.2; curChan = 3; altChan = 2;};
	case "A2": { ch2 = playerBaseChannel + 1; ch3 = playerBaseChannel + 1.1; ch4 = playerBaseChannel + 1.2; curChan = 4; altChan = 2;};
	case "B": {ch2 = playerBaseChannel + 2; ch3 = playerBaseChannel + 2.1; ch4 = playerBaseChannel + 2.2; curChan = 2; altChan = 1;};
	case "B1": { ch2 = playerBaseChannel + 2; ch3 = playerBaseChannel + 2.1; ch4 = playerBaseChannel + 2.2; curChan = 3; altChan = 2;};
	case "B2": { ch2 = playerBaseChannel + 2; ch3 = playerBaseChannel + 2.1; ch4 = playerBaseChannel + 2.2; curChan = 4; altChan = 2;};
	case "C": { ch2 = playerBaseChannel + 3; ch3 = playerBaseChannel + 3.1; ch4 = playerBaseChannel + 3.2; curChan = 2; altChan = 1;};
	case "C1": { ch2 = playerBaseChannel + 3; ch3 = playerBaseChannel + 3.1; ch4 = playerBaseChannel + 3.2; curChan = 3; altChan = 2;};
	case "C2": { ch2 = playerBaseChannel + 3; ch3 = playerBaseChannel + 3.1; ch4 = playerBaseChannel + 3.2; curChan = 4; altChan = 2;};
	case "D": { ch2 = playerBaseChannel + 4; ch3 = playerBaseChannel + 4.1; ch4 = playerBaseChannel + 4.2; curChan = 2; altChan = 1;};
	case "D1": { ch2 = playerBaseChannel + 4; ch3 = playerBaseChannel + 4.1;curChan = 3; altChan = 2;};
	case "D2": { ch2 = playerBaseChannel + 4; ch3 = playerBaseChannel + 4.2;curChan = 3; altChan = 2;};
	case "D3": { ch2 = playerBaseChannel + 4; ch3 = playerBaseChannel + 4.3;curChan = 3; altChan = 2;};
	case "D4": { ch2 = playerBaseChannel + 4; ch3 = playerBaseChannel + 4.4;curChan = 3; altChan = 2;};
	
	
	case "HQ": {ch2 = playerBaseChannel + 1;  ch3 = playerBaseChannel + 2; ch4 = playerBaseChannel + 3; ch5 = playerBaseChannel + 4; ch6 = playerBaseChannel + .1; curChan = 1; altChan = 6;};
	case "E": { ch2 = playerBaseChannel + 1; ch3 = playerBaseChannel + 1.1; ch4 = playerBaseChannel + 1.2; curChan = 2; altChan = 1;};
	case "E1": { ch2 = playerBaseChannel + 1; ch3 = playerBaseChannel + 1.1; ch4 = playerBaseChannel + 1.2; curChan = 3; altChan = 2;};
	case "E2": { ch2 = playerBaseChannel + 1; ch3 = playerBaseChannel + 1.1; ch4 = playerBaseChannel + 1.2; curChan = 4; altChan = 2;};
	case "F": {ch2 = playerBaseChannel + 2; ch3 = playerBaseChannel + 2.1; ch4 = playerBaseChannel + 2.2; curChan = 2; altChan = 1;};
	case "F1": { ch2 = playerBaseChannel + 2; ch3 = playerBaseChannel + 2.1; ch4 = playerBaseChannel + 2.2; curChan = 3; altChan = 2;};
	case "F2": { ch2 = playerBaseChannel + 2; ch3 = playerBaseChannel + 2.1; ch4 = playerBaseChannel + 2.2; curChan = 4; altChan = 2;};
	case "G": { ch2 = playerBaseChannel + 3; ch3 = playerBaseChannel + 3.1; ch4 = playerBaseChannel + 3.2; curChan = 2; altChan = 1;};
	case "G1": { ch2 = playerBaseChannel + 3; ch3 = playerBaseChannel + 3.1; ch4 = playerBaseChannel + 3.2; curChan = 3; altChan = 2;};
	case "G2": { ch2 = playerBaseChannel + 3; ch3 = playerBaseChannel + 3.1; ch4 = playerBaseChannel + 3.2; curChan = 4; altChan = 2;};
	case "H": { ch2 = playerBaseChannel + 4; ch3 = playerBaseChannel + 4.1; ch4 = playerBaseChannel + 4.2; curChan = 2; altChan = 1;};
	case "H1": { ch2 = playerBaseChannel + 4; ch3 = playerBaseChannel + 4.1;curChan = 3; altChan = 2;};
	case "H2": { ch2 = playerBaseChannel + 4; ch3 = playerBaseChannel + 4.2;curChan = 3; altChan = 2;};
	case "H3": { ch2 = playerBaseChannel + 4; ch3 = playerBaseChannel + 4.3;curChan = 3; altChan = 2;};
	case "H4": { ch2 = playerBaseChannel + 4; ch3 = playerBaseChannel + 4.4;curChan = 3; altChan = 2;};
};

if (isNil "curChan") then {
	//player isn't part of any template group
	curChan = 1;
	altChan = 8;
};

//Generate Mission Notes
radioNoteString = "<font size='24'>Your Radio's Default Settings</font><br/><br/>Channel 1: " + str(ch1) + " MHz<br/>";
if (!isNil "ch2") then {radioNoteString = radioNoteString + "Channel 2: " + str(ch2) + " MHz<br/>";};
if (!isNil "ch3") then {radioNoteString = radioNoteString + "Channel 3: " + str(ch3) + " MHz<br/>";};
if (!isNil "ch4") then {radioNoteString = radioNoteString + "Channel 4: " + str(ch4) + " MHz<br/>";};
if (!isNil "ch5") then {radioNoteString = radioNoteString + "Channel 5: " + str(ch5) + " MHz<br/>";};
if (!isNil "ch6") then {radioNoteString = radioNoteString + "Channel 6: " + str(ch6) + " MHz<br/>";};
if (!isNil "ch7") then {radioNoteString = radioNoteString + "Channel 7: " + str(ch7) + " MHz<br/>";};
if (!isNil "ch8") then {radioNoteString = radioNoteString + "Channel 8: " + str(ch8) + " MHz<br/>";};
if (!isNil "ch9") then {radioNoteString = radioNoteString + "Channel 9: " + str(ch9) + " MHz<br/>";};

//Let player know what channels he starts on.
radioNoteString = radioNoteString + "<br/>Main Channel (left ear): <font color='#90ee90'>CH " + str(curChan) + "</font><br/>Alt. Channel (right ear): <font color='#90ee90'>CH " + str(altChan) + "</font>";
//List default frequencies for sides
radioNoteString = radioNoteString + "<br/><br/>";
if (_side == west) then {
	radioNoteString = radioNoteString + "<font size='24'>Default Radio Frequency List</font><br/><br/>" + "Plt. HQ - " + str(playerBaseChannel) + " MHz<br/><br/>" + "Alpha Squad - " + str(playerBaseChannel + 1) + " MHz<br/>" + "Alpha One - " + str(playerBaseChannel + 1.1) + " MHz<br/>" + "Alpha Two - " + str(playerBaseChannel + 1.2) + " MHz<br/><br/>" + "Bravo Squad - " + str(playerBaseChannel + 2) + " MHz<br/>" + "Bravo One - " + str(playerBaseChannel + 2.1) + " MHz<br/>" + "Bravo Two - " + str(playerBaseChannel + 2.2) + " MHz<br/><br/>" + "Charlie Squad - " + str(playerBaseChannel + 3) + " MHz<br/>" +"Charlie One - " + str(playerBaseChannel + 3.1) + " MHz<br/>" + "Charlie Two - " + str(playerBaseChannel + 3.2) + " MHz<br/><br/>" + "Delta Squad - " + str(playerBaseChannel + 4) + " MHz<br/>" +"Delta One - " + str(playerBaseChannel + 4.1) + " MHz<br/>" + "Delta Two - " + str(playerBaseChannel + 4.2) + " MHz<br/>" + "Delta Three - " + str(playerBaseChannel + 4.3) + " MHz<br/>" + "Delta Four - " + str(playerBaseChannel + 4.4) + " MHz<br/>";
} else {
	radioNoteString = radioNoteString + "<font size='24'>Default Radio Frequency List</font><br/><br/>" + "Plt. HQ - " + str(playerBaseChannel) + " MHz<br/><br/>" + "Echo Squad - " + str(playerBaseChannel + 1) + " MHz<br/>" + "Echo One - " + str(playerBaseChannel + 1.1) + " MHz<br/>" + "Echo Two - " + str(playerBaseChannel + 1.2) + " MHz<br/><br/>" + "Foxtrot Squad - " + str(playerBaseChannel + 2) + " MHz<br/>" + "Foxtrot One - " + str(playerBaseChannel + 2.1) + " MHz<br/>" + "Foxtrot Two - " + str(playerBaseChannel + 2.2) + " MHz<br/><br/>" + "Golf Squad - " + str(playerBaseChannel + 3) + " MHz<br/>" + "Golf One - " + str(playerBaseChannel + 3.1) + " MHz<br/>" + "Golf Two - " + str(playerBaseChannel + 3.2) + " MHz<br/><br/>" + "Hotel Squad - " + str(playerBaseChannel + 4) + " MHz<br/>" + "Hotel One - " + str(playerBaseChannel + 4.1) + " MHz<br/>" + "Hotel Two - " + str(playerBaseChannel + 4.2) + " MHz<br/>" + "Hotel Three - " + str(playerBaseChannel + 4.3) + " MHz<br/>" + "Hotel Four - " + str(playerBaseChannel + 4.4) + " MHz<br/>";
};
player createDiaryRecord ["diary", ["[BC] Radio Settings", radioNoteString]];
//End Mission Notes



//sleep because none of the TFAR functions will work until radios are assigned by the server
if(!isMultiplayer) exitWith {
hint "Default radio script only works in multiplayer. Exiting.";
titleText ["Default radio script only works in multiplayer. Exiting.","PLAIN DOWN",0.5];
};
sleep 5;
titleText ["Radio channels should have been set. Good luck!","PLAIN DOWN",0.5];
hint "Radio channels should have been set. Good luck!";

//See which radio types the player has
_hasLR = call TFAR_fnc_haveLRRadio;
_hasSW = call TFAR_fnc_haveSWRadio;

//Change channel numbers from user readable to script readable
curChan = curChan - 1;
altChan = altChan - 1;

//Only setup long range channels if player has one
if (_hasLR) then {
	curSettings = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
	//Set default channel
	curSettings set [0,curChan];
	//Setup frequencies for channels 1-9
	chanSettings = curSettings select 2;
	if (!isNil "ch1") then {chanSettings set [0,str(ch1)];};
	if (!isNil "ch2") then {chanSettings set [1,str(ch2)];};
	if (!isNil "ch3") then {chanSettings set [2,str(ch3)];};
	if (!isNil "ch4") then {chanSettings set [3,str(ch4)];};
	if (!isNil "ch5") then {chanSettings set [4,str(ch5)];};
	if (!isNil "ch6") then {chanSettings set [5,str(ch6)];};
	if (!isNil "ch7") then {chanSettings set [6,str(ch7)];};
	if (!isNil "ch8") then {chanSettings set [7,str(ch8)];};
	if (!isNil "ch9") then {chanSettings set [8,str(ch9)];};
	curSettings set [2,chanSettings];
	//Set stero mode for default channel
	curSettings set [3,1];
	//Set alternate channel
	curSettings set [5,altChan];
	//Set stero mode for alternate channel
	curSettings set [6,2];
	
	[(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, curSettings] call TFAR_fnc_setLrSettings;
};

//Only setup short wave channels if player has one
if (_hasSW) then {
	curSettings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
	//Set default channel
	curSettings set [0,curChan];
	//Setup frequencies for channels 1-9
	chanSettings = curSettings select 2;
	if (!isNil "ch1") then {chanSettings set [0,str(ch1)];};
	if (!isNil "ch2") then {chanSettings set [1,str(ch2)];};
	if (!isNil "ch3") then {chanSettings set [2,str(ch3)];};
	if (!isNil "ch4") then {chanSettings set [3,str(ch4)];};
	if (!isNil "ch5") then {chanSettings set [4,str(ch5)];};
	if (!isNil "ch6") then {chanSettings set [5,str(ch6)];};
	if (!isNil "ch7") then {chanSettings set [6,str(ch7)];};
	if (!isNil "ch8") then {chanSettings set [7,str(ch8)];};
	curSettings set [2,chanSettings];
	//Set stero mode for default channel
	curSettings set [3,1];
	//Set alternate channel
	curSettings set [5,altChan];
	//Set stero mode for alternate channel
	curSettings set [6,2];
	
	[(call TFAR_fnc_activeSwRadio), curSettings] call TFAR_fnc_setSwSettings;
};