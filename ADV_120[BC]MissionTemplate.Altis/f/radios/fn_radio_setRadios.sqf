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
systemChat "Radios preset.";
call BC_fnc_radio_cleanup;