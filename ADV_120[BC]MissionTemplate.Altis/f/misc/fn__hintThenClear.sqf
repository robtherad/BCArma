// Display a hint then clear it after 5 seconds
// Args
params ["_hintStr","_delay"];


hint _hintStr;

if (isNil "_delay") then {
    _delay = 5;
};
_delayedTime = diag_tickTime + _delay;

// Add CBA PFH to wait for delay to be reached
[{
    params ["_args","_handle"];
    _args params ["_delayedTime"];
    
    if (diag_tickTime > _delayedTime) then {
        hintSilent "";
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
}, 1, [_delayedTime]] call CBA_fnc_addPerFrameHandler;