//Figure out which side the player is on.
_side = side player;
switch (_side) do {
    case east: { bc_playerBaseChannel = bc_opforBaseChannel; };
    case west: { bc_playerBaseChannel = bc_bluforBaseChannel; };
    case independent: { bc_playerBaseChannel = bc_indforBaseChannel; };
    default { titleText ["The game thinks you aren't one of the three teams!","PLAIN"]; };
};
//Error message
if(isNil "bc_playerBaseChannel") exitWith {titleText ["Error! Default radio channels will not be set!","PLAIN DOWN",0.5];};

bc_ch1 = bc_playerBaseChannel; //All players will be able to switch to channel 1 to get on platoon net.

// bc_radioSettings: Tells radio script which channels to set for group. [altChannel,mainChannel,[channelArray]] (array)
//     mainChannel: Which channel the radio will start on. (1-8)
//     altChannel: Which channel the radio will have as an alternate by default (1-8)
//     [channelArray]: An array of channels to set on the radio. (float)
//        channelArray is expressed as numbers which are added to playerBaseChannel (ch1) to determine which channel the radio will be on. 
//        Try to keep offsets single digit or the channel may not be set if playerBaseChannel is a high number.
//        Frequencies can only have one decimal place.
//     ex: [1,6,[1,2,3,4]] - mainChannel is ch1, altChannel is ch6, ch2 is 1 unit MHz higher than ch1, etc.
_radioSettings = (group player) getVariable ["bc_radioSettings",[1,2,[0]]];
bc_curChan = _radioSettings select 0;
bc_altChan = _radioSettings select 1;
_channelArray = _radioSettings select 2;
if (count _channelArray >= 0) then {bc_ch2 = bc_playerBaseChannel + (_channelArray select 0)};
if (count _channelArray >= 1) then {bc_ch3 = bc_playerBaseChannel + (_channelArray select 1)};
if (count _channelArray >= 2) then {bc_ch4 = bc_playerBaseChannel + (_channelArray select 2)};
if (count _channelArray >= 3) then {bc_ch5 = bc_playerBaseChannel + (_channelArray select 3)};
if (count _channelArray >= 4) then {bc_ch6 = bc_playerBaseChannel + (_channelArray select 4)};
if (count _channelArray >= 5) then {bc_ch7 = bc_playerBaseChannel + (_channelArray select 5)};
if (count _channelArray >= 6) then {bc_ch8 = bc_playerBaseChannel + (_channelArray select 6)};
if (count _channelArray >= 7) then {bc_ch9 = bc_playerBaseChannel + (_channelArray select 7)};

//player isn't part of any template group
if (isNil "bc_curChan") then {
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
player createDiaryRecord ["diary", ["[BC] Radio Settings", bc_radioNoteString]];

//Next step
bc_radHandle2 = [BC_fnc_radio_waitRadios, 0, []] call CBA_fnc_addPerFrameHandler;
