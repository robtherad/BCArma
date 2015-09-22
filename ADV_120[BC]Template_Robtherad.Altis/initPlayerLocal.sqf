//initPlayerLocal.sqf - Executed locally when player joins mission (includes both mission start and JIP).
[] execVM "briefing.sqf";
[] execVM "scripts\loadout\setLoadout.sqf";
[] execVM "scripts\nametag\tags.sqf";
//[] execVM "scripts\randomstart\client.sqf";
[] execVM "scripts\gpsmarkers\client.sqf";