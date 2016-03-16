// Called from fn_pts_checkTime or fn_pts_checkAlive
// Make sure this isn't running twice
if (!isServer) exitWith {};
if (!isNil "bc_preppingAAR") exitWith {};
bc_preppingAAR = true;

// Stop alive and time checks
{
    [_x] call CBA_fnc_removePerFrameHandler;
} forEach bc_ptsPFHandles;



// Using alive count at mission start, calculate stuff and then store in array for passing onto clients
bc_endStatsArray = [];
{
    // Setup variables
    _statsArray = [];
    _teamString = _x select 0;
    _side = _x select 1;
    _aliveStart = _x select 2;
    _statsArray pushBack _teamString;
    
    // Start casualtyArray
    _aliveEnd = {side _x isEqualTo _side} count allUnits;
    _casualties = _aliveStart - _aliveEnd;
    _withDrawn = 0; // TODO: Implement withdrawing - Use teamString with addition ex: BLUFORwithDrawMark count inArea
    // StartCount, AliveCount, DeadCount, Withdrawn
    _casualtyArray = [_aliveStart, _aliveEnd, _casualties, _withDrawn];
    _statsArray pushBack _casualtyArray;
    
    // Objectives status, etc
    // TODO: Implement objectives
    
    
    // Add calculated stats to global var array
    bc_endStatsArray pushBack _statsArray;
} forEach bc_aliveStartArray;

// Push stats to clients so they can display the ending screen
[bc_endStatsArray] remoteExecCall ["bc_fnc_points_displayAAR", 0];