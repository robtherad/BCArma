if ((!isNil "f_cam_VirtualCreated") && (isNil "bc_endClientWaitVar")) then {
    [bc_endHandle] call CBA_fnc_removePerFrameHandler;
    bc_endHandle = [BC_fnc_end_clientTime, 0.25, []] call CBA_fnc_addPerFrameHandler;
    bc_endClientWaitVar = true;
};