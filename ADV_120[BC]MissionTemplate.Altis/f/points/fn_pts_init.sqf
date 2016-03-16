// Start of points script. Waits until safestart is over and then gets a count of living players for each active team and calls next piece of script.
if (!isServer) exitWith {};

// Wait until after mission start

// TODO: Replace waitUntil with commented line. After CBA update
//
_startTime = time + (bc_missionSafeTime*60);
/*
[
    {time > (_this select 0)}, 
    {
        private ["_handle"];
        _aliveStartWest = {side _x isEqualTo west} count allUnits;
        _aliveStartEast = {side _x isEqualTo east} count allUnits;
        _aliveStartGuer = {side _x isEqualTo independent} count allUnits;
        bc_aliveStartArray = [_aliveStartWest, _aliveStartEast, _aliveStartGuer];
        
        // Add time and casualty check PFHs
        bc_ptsPFHandles = [];

        _handle = [bc_fnc_points_checkAlive, 10, []] call CBA_fnc_addPerFrameHandler;
        bc_ptsPFHandles pushBack _handle;
        _handle = [bc_fnc_points_checkTime, 10, []] call CBA_fnc_addPerFrameHandler;
        bc_ptsPFHandles pushBack _handle;
    }, 
    [_startTime]
] call CBA_fnc_waitUntilAndExecute;
*/

waitUntil {sleep 1; time > _startTime};

// Get starting player counts
_aliveStartWest = {side _x isEqualTo west} count allUnits;
_aliveStartEast = {side _x isEqualTo east} count allUnits;
_aliveStartGuer = {side _x isEqualTo independent} count allUnits;
bc_aliveStartArray = [["BLUFOR",west,_aliveStartWest], ["OPFOR",east,_aliveStartEast], ["INDFOR",independent,_aliveStartGuer]];

// Add time and casualty check PFHs
bc_ptsPFHandles = [];

_handle = [bc_fnc_points_checkPlayers, 10, []] call CBA_fnc_addPerFrameHandler;
bc_ptsPFHandles pushBack _handle;
_handle = [bc_fnc_points_checkTime, 10, []] call CBA_fnc_addPerFrameHandler;
bc_ptsPFHandles pushBack _handle;