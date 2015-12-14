# core

This module consists of a few smaller scripts that are too simple for their own module folders. 

***

###killdisplay
Adds an event handler to every player which triggers another script (`fn_core_mpKilled`)that keeps track of every kill. Once a player is killed the information collected by the second script is displayed in their chat box as well as their post game screen.
#####Configure
No configuration required.
#####Disable
In `'f\functions.hpp'` remove `postInit = 1;` from the code block of `class core_addKilledEH`


***

###nametags
Runs locally and gets the name of the person that the player is looking at. Only displays that name if the two of them are on the same team.
#####Configure
No configuration required.
#####Disable
In `'f\bcInit.sqf'` remove or comment out the line that reads:
```
bc_core_showTags = [BC_fnc_core_showTags, 0.05, []] call CBA_fnc_addPerFrameHandler;
```

***

###rating
Ensures a player's side does not change from team damage.
#####Configure
No configuration required.
#####Disable
In `'f\functions.hpp'` remove `postInit = 1;` from the code block of `class core_addRatingEH`