//Get initial values from TFAR and see if they match with what the player had on him.
if (bc_hasLRitem) then {
    bc_hasLR = call TFAR_fnc_haveLRRadio;
    if (bc_hasLR) then {
        bc_LRsetup = true;
    } else {
        bc_LRsetup = false;
    };
} else {
    bc_LRsetup = true;
};

if (bc_hasSWitem) then {
    bc_hasSW = call TFAR_fnc_haveSWRadio;
    if (bc_hasSW) then {
        bc_SWsetup = true;
    } else {
        bc_SWsetup = false;
    };
} else {
    bc_SWsetup = true;
};

if (bc_SWsetup && bc_LRsetup) then {
    [bc_radHandle2] call CBA_fnc_removePerFrameHandler;
    call BC_fnc_radio_setRadios;
};