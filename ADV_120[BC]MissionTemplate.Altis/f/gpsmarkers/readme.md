#gpsmarkers
This module creates and updates markers for every group on a side except for ones which are set to be ignored in the settings file. It can also manage markers for vehicles if they are properly configured in the settings file. 

###Configure
All configuration happens in `'f\gpsmarkers\settings.sqf'`.

######Vehicles
To manage markers for vehicles you need to define `_westVehArray`, `_eastVehArray`, or `_indVehArray` depending on which teams should be able to see the vehicle's marker.
***
######Group Markers
By default the module will create a marker for every group present on the map. Unless the group is defined by the setGroupID module it will have a messy name like `Alpha 1-1` or something. Define the group using that module.

If you want a group to have no marker created for it you can add it's groupID to `bc_ignoreMarkerArray`. It's groupID should be a string which is defined in the setGroupID module.
***
######Allied GPS
If you wish for teams to be able to see each other's GPS markers then you can define which teams are visible to which teams using the variables `_sidesVisibleToWest`, `_sidesVisibleToEast` and `_sidesVisibleToGuer`. Fill these variables with an array of sides (`west`,`east`,`independent`) which that team should be able to see GPS markers for. By default teams can only see their own GPS markers. This will not combine side chat channels for teams.

###Disable
In `'f\bcInit.sqf'` remove the line `call BC_fnc_gps_init;`.


