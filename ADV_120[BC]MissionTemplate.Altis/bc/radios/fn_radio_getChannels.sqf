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

//Next step
bc_radHandle2 = [BC_fnc_radio_waitRadios, 0, []] call CBA_fnc_addPerFrameHandler;