//Time Limits
if ((bc_missionRuntimeMins - 15) <= (time/60) && (bc_alertStatus isEqualTo 0)) then {
    _hintStr = "15 minutes remaining.";
    _hintStr remoteExecCall ["bc_common_hintThenClear", 0];
    bc_alertStatus = 1;
};
if (bc_missionRuntimeMins <= (time/60) && (bc_alertStatus isEqualTo 1)) then {
    if (bc_allowOvertime && bc_alertStatus isEqualTo 1) then {
        _hintStr = "Because of ongoing action, the mission time limit has been extended by five minutes. Finish the fight!";
        _hintStr remoteExecCall ["bc_common_hintThenClear", 0];
        bc_alertStatus = 2;
    } else {
        _hintStr = "The mission time limit has been reached.";
        _hintStr remoteExecCall ["bc_common_hintThenClear", 0];
        call bc_fnc_pts_prepAAR;
    };
};
