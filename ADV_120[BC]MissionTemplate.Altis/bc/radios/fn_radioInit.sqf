if (isServer) then {
    call BC_fnc_radio_genFreqs;
};
if (hasInterface) then {
    bc_radHandle1 = [BC_fnc_radio_waitGear, 0, []] call CBA_fnc_addPerFrameHandler;
};