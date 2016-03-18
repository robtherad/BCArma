#gpsmarkers
This folder has scripts that automatically add markers from the BC Addon's gpsMarkers module for all groups in the game

###Configure
All configuration happens in `'f\gpsmarkers\settings.sqf'`.

#####Vehicles
To add  gpsMarkers for vehicles you need to define `_westVehArray`, `_eastVehArray`, or `_indVehArray` depending on which teams should be able to see the vehicle's marker. This script only supports one side seeing the location of vehicles. If you would like to have multiple sides able to see the marker for a vehicle you should call the command from the addon yourself.

Each vehicle just needs to be added to the list. For example if I wanted to create markers for four BLUFOR APCs named `APC1` to `APC4` I would use the following definition:

```_westVehArray = [APC1, APC2, APC3, APC4];```

This will have the module create and update a marker for that vehicle. By default it will have the same name as the object (in the above case, bluforHelicopter) but you can define a variable on that object to make it have a prettier name. Before the GPS script runs (until object initialization fields are less buggy, init.sqf is a good place) use the following line, replacing `VEHICLE` and `PRETTY NAME` with a reference to the vehicle and a nicer looking name respectively.

```
VEHICLE setVariable ["bc_gpsMarkers_vehMarkerText", "PRETTY NAME"];

    ex: APC1 setVariable ["bc_gpsMarkers_vehMarkerText", "Alpha APC"];
```

***
#####Group Markers
By default the module will create a marker for every group present on the map. Unless the group is defined by the setGroupID module it will have a messy name like `Alpha 1-1` or something. Define the group using that module and it will use the name defined there instead.

If you want a group to have no marker created for it you can add it's groupID to `bc_ignoreMarkerArray`. It's groupID should be a string which is defined in the setGroupID module. If I had three groups named A1, A2 and C2 that I wished to hide markers for I would define `bc_ignoreMarkerArray` as follows:

```bc_ignoreMarkerArray = ["A1", "A2", "C2"];```
***

###Disable
In `'f\bcInit.sqf'` remove the line `call BC_fnc_gps_init;`.