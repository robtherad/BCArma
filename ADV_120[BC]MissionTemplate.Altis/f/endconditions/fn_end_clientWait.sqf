if ((!isNil "f_cam_VirtualCreated") && (isNil "bc_end_clientTime")) then {
    [bc_end_clientWait] call CBA_fnc_removePerFrameHandler;
    bc_end_clientTime = [BC_fnc_end_clientTime, 0.25, []] call CBA_fnc_addPerFrameHandler;
};
