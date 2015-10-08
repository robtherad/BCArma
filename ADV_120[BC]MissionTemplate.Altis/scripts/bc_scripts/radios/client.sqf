//Gets called by the server and passed arguements containing the base radio channels for both sides. Then figures out which side the player is on and sets their radio net up. Adds a note to the player's 'Mission Notes' tab with all the information.
//if(isDedicated) exitWith {};

waitUntil { !isNil "opforBaseChannel"; };
waitUntil { !isNil "bluforBaseChannel"; };

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
	case "A SL": { ch2 = playerBaseChannel + 1; ch3 = playerBaseChannel + 1.1; ch4 = playerBaseChannel + 1.2; curChan = 2; altChan = 1;};
	case "A1": { ch2 = playerBaseChannel + 1; ch3 = playerBaseChannel + 1.1; ch4 = playerBaseChannel + 1.2; curChan = 3; altChan = 2;};
	case "A2": { ch2 = playerBaseChannel + 1; ch3 = playerBaseChannel + 1.1; ch4 = playerBaseChannel + 1.2; curChan = 4; altChan = 2;};
	case "B SL": {ch2 = playerBaseChannel + 2; ch3 = playerBaseChannel + 2.1; ch4 = playerBaseChannel + 2.2; curChan = 2; altChan = 1;};
	case "B1": { ch2 = playerBaseChannel + 2; ch3 = playerBaseChannel + 2.1; ch4 = playerBaseChannel + 2.2; curChan = 3; altChan = 2;};
	case "B2": { ch2 = playerBaseChannel + 2; ch3 = playerBaseChannel + 2.1; ch4 = playerBaseChannel + 2.2; curChan = 4; altChan = 2;};
	case "C SL": { ch2 = playerBaseChannel + 3; ch3 = playerBaseChannel + 3.1; ch4 = playerBaseChannel + 3.2; curChan = 2; altChan = 1;};
	case "C1": { ch2 = playerBaseChannel + 3; ch3 = playerBaseChannel + 3.1; ch4 = playerBaseChannel + 3.2; curChan = 3; altChan = 2;};
	case "C2": { ch2 = playerBaseChannel + 3; ch3 = playerBaseChannel + 3.1; ch4 = playerBaseChannel + 3.2; curChan = 4; altChan = 2;};
	case "MMG SL": { ch2 = playerBaseChannel + 4; ch3 = playerBaseChannel + 4.1; ch4 = playerBaseChannel + 4.2; curChan = 2; altChan = 1;};
	case "MMG1": { ch2 = playerBaseChannel + 4; ch3 = playerBaseChannel + 4.1;curChan = 3; altChan = 2;};
	case "MMG2": { ch2 = playerBaseChannel + 4; ch3 = playerBaseChannel + 4.2;curChan = 3; altChan = 2;};
	case "MMG3": { ch2 = playerBaseChannel + 4; ch3 = playerBaseChannel + 4.3;curChan = 3; altChan = 2;};
	case "MMG4": { ch2 = playerBaseChannel + 4; ch3 = playerBaseChannel + 4.4;curChan = 3; altChan = 2;};
	
	
	case "HQ": {ch2 = playerBaseChannel + 1;  ch3 = playerBaseChannel + 2; ch4 = playerBaseChannel + 3; ch5 = playerBaseChannel + 4; ch6 = playerBaseChannel + .1; curChan = 1; altChan = 6;};
	case "E SL": { ch2 = playerBaseChannel + 1; ch3 = playerBaseChannel + 1.1; ch4 = playerBaseChannel + 1.2; curChan = 2; altChan = 1;};
	case "E1": { ch2 = playerBaseChannel + 1; ch3 = playerBaseChannel + 1.1; ch4 = playerBaseChannel + 1.2; curChan = 3; altChan = 2;};
	case "E2": { ch2 = playerBaseChannel + 1; ch3 = playerBaseChannel + 1.1; ch4 = playerBaseChannel + 1.2; curChan = 4; altChan = 2;};
	case "F SL": {ch2 = playerBaseChannel + 2; ch3 = playerBaseChannel + 2.1; ch4 = playerBaseChannel + 2.2; curChan = 2; altChan = 1;};
	case "F1": { ch2 = playerBaseChannel + 2; ch3 = playerBaseChannel + 2.1; ch4 = playerBaseChannel + 2.2; curChan = 3; altChan = 2;};
	case "F2": { ch2 = playerBaseChannel + 2; ch3 = playerBaseChannel + 2.1; ch4 = playerBaseChannel + 2.2; curChan = 4; altChan = 2;};
	case "G SL": { ch2 = playerBaseChannel + 3; ch3 = playerBaseChannel + 3.1; ch4 = playerBaseChannel + 3.2; curChan = 2; altChan = 1;};
	case "G1": { ch2 = playerBaseChannel + 3; ch3 = playerBaseChannel + 3.1; ch4 = playerBaseChannel + 3.2; curChan = 3; altChan = 2;};
	case "G2": { ch2 = playerBaseChannel + 3; ch3 = playerBaseChannel + 3.1; ch4 = playerBaseChannel + 3.2; curChan = 4; altChan = 2;};
	case "MMG SL": { ch2 = playerBaseChannel + 4; ch3 = playerBaseChannel + 4.1; ch4 = playerBaseChannel + 4.2; curChan = 2; altChan = 1;};
	case "MMG1": { ch2 = playerBaseChannel + 4; ch3 = playerBaseChannel + 4.1;curChan = 3; altChan = 2;};
	case "MMG2": { ch2 = playerBaseChannel + 4; ch3 = playerBaseChannel + 4.2;curChan = 3; altChan = 2;};
	case "MMG3": { ch2 = playerBaseChannel + 4; ch3 = playerBaseChannel + 4.3;curChan = 3; altChan = 2;};
	case "MMG4": { ch2 = playerBaseChannel + 4; ch3 = playerBaseChannel + 4.4;curChan = 3; altChan = 2;};
};

//Generate Mission Notes
if (_side == west) then {
	str1 = "<font size='24'>Default Radio Channels</font><br/><br/>" + "Plt. HQ - " + str(playerBaseChannel) + "hz<br/><br/>" + "Alpha Squad - " + str(playerBaseChannel + 1) + "hz<br/>" + "Alpha One - " + str(playerBaseChannel + 1.1) + "hz<br/>" + "Alpha Two - " + str(playerBaseChannel + 1.2) + "hz<br/><br/>" + "Bravo Squad - " + str(playerBaseChannel + 2) + "hz<br/>" + "Bravo One - " + str(playerBaseChannel + 2.1) + "hz<br/>" + "Bravo One - " + str(playerBaseChannel + 2.2) + "hz<br/><br/>" + "Charlie Squad - " + str(playerBaseChannel + 3) + "hz<br/>" +"Charlie One - " + str(playerBaseChannel + 3.1) + "hz<br/>" + "Charlie One - " + str(playerBaseChannel + 3.2) + "hz<br/><br/>" + "MMG Squad - " + str(playerBaseChannel + 4) + "hz<br/>" +"MMG 1 - " + str(playerBaseChannel + 4.1) + "hz<br/>" + "MMG 2 - " + str(playerBaseChannel + 4.2) + "hz<br/>" + "MMG 3 - " + str(playerBaseChannel + 4.3) + "hz<br/>" + "MMG 4 - " + str(playerBaseChannel + 4.4) + "hz<br/>";
} else {
	str1 = "Default Radio Channels<br/><br/>" + "Plt. HQ - " + str(playerBaseChannel) + "hz<br/><br/>" + "Echo Squad - " + str(playerBaseChannel + 1) + "hz<br/>" + "Echo One - " + str(playerBaseChannel + 1.1) + "hz<br/>" + "Echo Two - " + str(playerBaseChannel + 1.2) + "hz<br/><br/>" + "Foxtrot Squad - " + str(playerBaseChannel + 2) + "hz<br/>" + "Foxtrot One - " + str(playerBaseChannel + 2.1) + "hz<br/>" + "Foxtrot One - " + str(playerBaseChannel + 2.2) + "hz<br/><br/>" + "Golf Squad - " + str(playerBaseChannel + 3) + "hz<br/>" +"Golf One - " + str(playerBaseChannel + 3.1) + "hz<br/>" + "Golf One - " + str(playerBaseChannel + 3.2) + "hz<br/><br/>" + "MMG Squad - " + str(playerBaseChannel + 4) + "hz<br/>" + "MMG 1 - " + str(playerBaseChannel + 4.1) + "hz<br/>" + "MMG 2 - " + str(playerBaseChannel + 4.2) + "hz<br/>" + "MMG 3 - " + str(playerBaseChannel + 4.3) + "hz<br/>" + "MMG 4 - " + str(playerBaseChannel + 4.4) + "hz<br/>";
};

_str2 = "<br/><br/>By default your radio channels will be set as follows:<br/>CH 1 - Platoon Net<br/>CH 2 - Your Squad Net<br/>CH 3 - Your Fireteam 1 Net<br/>CH 4 - Your Fireteam 2 Net<br/><br/><br/>For example, <br/><br/>If you are a member of Bravo Two you will have CH1 set to platoon net, CH2 (alternate) set to Bravo Squad net, CH3 set to Bravo One net and CH4 (main) set to Bravo Two net. Your primary channel will default to Bravo Two (CH4) and your alternate channel will be pre-set as Bravo Squad net (CH2).<br/><br/>If you are a platoon leader you will have the platoon net on CH1 (main) and your squad's nets set as CH2-5 and you will have a personal radio channel set to CH6 (alternate) so you can communicate within the HQ element without speaking over platoon net.<br/><br/>If you are a member of an MMG team you will have CH1 set to platoon net, CH2 (alternate) set to MMG net, and CH3 (main) set to your MMG team's net.";

_str = str1 + _str2;
player createDiarySubject ["bcRob2","[BC] Signals Info"];
player createDiaryRecord ["bcRob2", ["Signals", _str]];



//sleep because none of the TFAR functions will work until the mission is live
if(!isMultiplayer) exitWith {hint "Default radio script only works in multiplayer. Exiting."};
sleep 10;
hint "Radio channels should have been set. Good luck!";
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
	//Set volume
	curSettings set [1,0.7];
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