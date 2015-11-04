_runArray = [];
if (!isNil "loadout_assigned") then {_runArray set [0,1];} else {_runArray set [0,0];};
if (!isNil "bc_bluforBaseChannel") then {_runArray set [1,1];} else {_runArray set [1,0];};
if (!isNil "bc_opforBaseChannel") then {_runArray set [2,1];} else {_runArray set [2,0];};
if (isNil "bc_hasSWitem") then {_runArray set [3,1];} else {_runArray set [3,0];};

if (!isNil "loadout_assigned" && !isNil "bc_bluforBaseChannel" && !isNil "bc_opforBaseChannel" && isNil "bc_hasSWitem") then {
    bc_hasSWitem = false;
    bc_hasLRitem = false;
    _LRlist = ["tf_rt1523g","tf_rt1523g_big","tf_rt1523g_black","tf_rt1523g_fabric","tf_rt1523g_green","tf_rt1523g_rhs","tf_rt1523g_sage","tf_anarc210","tf_rt1523g_big_bwmod","tf_rt1523g_big_bwmod_tropen","tf_rt1523g_bwmod","tf_rt1523g_big_rhs","tf_mr3000","tf_mr3000_multicam","tf_mr3000_rhs","tf_mr6000l","tf_mr3000_bwmod","tf_mr3000_bwmod_tropen","tf_anprc155","tf_anprc155_coyote","tf_anarc164"];
    _SWlist = ["ItemRadio","tf_anprc152","tf_anprc148jem","tf_fadak","tf_pnr100a","tf_anprc154","tf_rf7800str"];

    //Check to see if player has any items matching the lists above.
    if ((backpack player) in _LRlist) then {
        bc_hasLRitem = true;
    };

    {
        if (_x in _SWlist) then {
            bc_hasSWitem = true;
        };
    } forEach (assignedItems player);
    [bc_radHandle1] call CBA_fnc_removePerFrameHandler;
    call BC_fnc_radio_getChannels;
};