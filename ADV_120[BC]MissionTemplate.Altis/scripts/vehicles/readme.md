Everything is activated from the cache_init.sqf

### veh_settings.sqf
Contains some general variables that are used in multiple files in this folder.

### c_lockVehs.sqf
Runs on the client. Adds event handlers to every vehicle listed in the settings file which prevent players who aren't of certain classes from driving or gunnning those vehicles. If a vehicle has cargo space, anyone on BLUFOR can get into that space without restrictions.

* Only players with the class `B_crew_F` (NATO Crewman) can drive/gun ground vehicles.
* Only players with the class `B_pilot_F` (NATO Pilot) can fly/gun helicopters. 
Any vehicles present in the mission but not defined in the settings file will not be subject to these restrictions.

### s_vehCargo.sqf
Runs on the server. Removes the default gear from the vehicles from the settings file and adds new gear as defined in the script file.

### sc_vehFix.sqf
Runs on both the server and the client. Handles the fixing and refueling of vehicles defined in the settings file. Requires a marker named `repair` to be present on the map.
