#sectors
This module allows you to place capturable sectors of variable sizes anywhere you want on the map for BLUFOR and OPFOR to fight over. You can use as many sectors as you want but I recommend keeping it simple to avoid spreading out the action too much.

###Configure
#####Editor
Place down triggers with `Type` set to `None`, `Activation` set to `Anybody` and `Repeatedly Presennt`, `condition` set to `this`, `Timer - Min, Mid, and Max` all set to `0`, and the size and location at any value you'd like. The trigger's `Text` field will be used as the name of the sector and you will need the trigger's `name` field to input the trigger into the list of sectors in the `server.sqf` file.

Place down two `Icon` markers with any icon you want (players can't see `empty` type markers) with the names `opPointsMark` and `bluPointsMark`. Place these somewhere near the edge of your map as they will be continually updating with the points total of each team. Don't place them too close to each other or they will overlap when players zoom out. 
#####server.sqf
Open the `server.sqf` file in the sector module and find the line defining `bc_triggerArray`. This array is where you put the names of all the triggers you wish to use as sectors.

#####init.sqf
To enable this module you will need to add the following line to the bottom of your mission's `init.sqf`:

```
[] execVM "scripts\sectors\server.sqf";
```

###Disable
It's disabled by default. To enable it follow the instructions above.