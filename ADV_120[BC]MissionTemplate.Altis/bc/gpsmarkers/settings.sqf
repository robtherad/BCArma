/*
    Settings file for the bc\gpsmarkers\ module.
    
    Vehicle Markers
        If you do have vehicles in your mission, make sure they are named and then add that name to the array for the team they are on. If vehicles exist in your mission but are not entered into this settings file they will not have markers in game.  

            //No vehicles in mission
            _westVehArray = nil;
            _eastVehArray = nil;
            _indVehArray = nil;

            //Vehicles in mission
            _westVehArray = [bluforTruck1,bluforTruck2]; 
            _eastVehArray = [opforTruck]; 
            _indVehArray = [independentTruck];

        If you want the vehicle to have a custom name instead of something weird looking like 'bluTruck' then add the following line to the vehicles initialization field in the editor to change the GPS marker name to whatever you want:

            this setVariable ["bc_MarkerName", "GPS Marker Text Goes Here"];
        
    Excluding groups from being marked
        By default, all groups will have markers generated for them even if their leader doesn't have GPS. If you wish to exclude a group from having a marker generated and updated, add it's groupID to the array bc_ignoreMarkerArray on line 51. In the default template all groups have their groupIDs set by the file "f\setGroupID\f_setGroupID.sqf" so you will want to use the values defined there. Make sure when you enter a groupID you surround it with quotes since it is a string. 
        
        For example, if I wanted to exclude groups with the groupIDs "P", "AV", "BV", "CV" and "DV" from having markers created I would set bc_ignoreMarkerArray to:

        bc_ignoreMarkerArray = ["P","AV","BV","CV","DV"];
        
        To make sure all groups have markers set bc_ignoreMarkerArray to be an empty array. If you have just downloaded the template off GITHUB then this should be the default setting. To do this use the following line:
	
        bc_ignoreMarkerArray = [];
*/
// 0 = armor, 1 == helicopter, 2 == plane
_westVehArray = nil;
_eastVehArray = nil;
_indVehArray = nil;
bc_ignoreMarkerArray = []; //if blank set to []