/*
    Settings file for the randomstart module.
    
    _ranTeam - The team whose players will be moved by the script. [WEST, EAST, INDEPENDENT]
    
        ex: _ranTeam = west;
    
    
==============================    
    _markerArray - An array of marker names (strings) which will be used as starting locations. Make sure all markers in this array actually exist or if a non-existent marker is selected players will spawn in the bottom left corner of the map.
    
        ex: _markerArray = ["randomstart","randomstart_1","randomstart_2"];
    
    
==============================    
    _objectArray - An array of objects to be moved with the random team. Objects are any 'unit' you can place in the editor. Vehicles, players, boxes, etc. If you don't want to move any extra objects then set it to nil as shown in the example below.
    
        ex 1: _objectArray = [blueHelicopter,blueBox,greenHostage];    //MOVES PLAYERS ON _ranTeam AND OBJECTS NAMED 'blueHelicopter', 'blueBox' AND 'greenHostage'
        ex 2: _objectArray = [bluHelicopter];                          //MOVES PLAYERS ON _ranTeam AND OBJECT NAMED 'blueHelicopter'
        ex 3: _objectArray = nil;                                      //MOVES NOTHING BUT THE PLAYERS ON _ranTeam
    
    
==============================
*/

_ranTeam = west; // WEST, EAST, INDEPENDENT
_markerArray = ["randomstart"];
_objectArray = nil; //If empty make equal to nil.