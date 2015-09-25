# Bravo Company Mission Template

The master branch will always be the most up to date and stable version of the template. If you intend to make a mission, use the master version. This readme file has a lot of information but if you want to be able to navigate it easier then the [github wiki](https://github.com/robtherad/BCArma/wiki) might help.

---

## [Click Here to download the latest version](https://github.com/robtherad/BCArma/archive/v1.1.3.zip)

---

# Using the Template

Download as zip from GitHub using the button on the bottom right or the link above. Drop the main folder named `ADV_120[BC]Template_Robtherad.Altis` in your Arma 3 mission folder which should be a path similar to `C:\Users\Rob\Documents\Arma 3 - Other Profiles\robtherad\missions`. If you would like to make a mission on an island other than Altis then change the suffix on the folder from `.Altis` to the suffix used by whichever map you intend to use. 

Now you should be able to open the 2D editor in Arma 3 and open the mission. Drag the playable units as well as the triggers and markers for the AO to the area you wish the mission to be played in. Then save the mission and test it.

## Common Modifications

There are some modifications that you may have to make in order to get certain scripts to work correctly with the type of mission you are making. If you are trying to change something and the stuff below doesn't make sense, try looking at the comments in the header of the file you are working on. 

#### Loading Screen Information

If you want to change the information displayed during the loading screen you can edit it in the `description.ext` file. The lines you want to edit are lines 8-10. Go ahead and replace the author name with your own name, the `onLoadName` with a name for your mission, and `OnLoadMission` with a brief description of what your mission is about. 

#### Customizing Loadouts & Using Premade Loadouts

The default loadout that comes with the template uses vanilla weapons as well as uniforms from `@KMNP`. If you would like to use something different then you will have to edit each loadout file to meet your needs. Don't forget that if you change a unit's weapon you will probably need to change the ammunition given to the unit as well. Make sure not to overload units with too many items or they will get fatigued too quickly. If your changes are as simple as changing the uniforms, vests and backpacks it is fairly easy to use `Notepad++` and open all of the loadouts at once to quickly replace the class names with the new ones.

If you need a starting point there are premade loadouts included with the template in the `Premade Loadouts` folder. Within that folder are other folders named after the mods which the loadouts are dependant upon. Within THAT folder should be more folders which will be named along the lines of `Camouflage 1 v Camouflage 2`. The name on the left is the camouflage type that the BLUFOR forces wear and the name on the right is the camouflage that the OPFOR forces wear. If you would like to use one of these loadouts in your mission you can just open the folder and use the `loadout` folder within to overwrite the `loadout` folder located at `scripts\bc_scripts\loadout\`. You can use them as is or customize them however you'd like. It's your mission.

##### Giving MG Teams a Leader

If you would like for MG Teams in your mission to have access to GPS as well as radios (when radios are restricted to Team Leaders++) an easy way to do it is to replace the Assistant Gunner in the MG teams with a Team Leader. All of the premade loadouts contain a file named `SIDE_MGTL.sqf` located at `scripts\bc_scripts\loadouts\units\` which has a loadout already made for an MG Team Leader. You will need to open `setLoadout.sqf` in the `scripts\bc_scripts\loadouts` folder and edit the line for `case "O_Soldier_lite_F":` (or `case "B_Soldier_lite_F":` depending on which side you are editing) and change the file name from `Red_AG.sqf` to `Red_MGTL.sqf` but leave the rest of the file path alone.

Once that's done, head into the editor and replace the `Heavy Gunner` classes with `Rifleman (Light)` classes and vice versa. If you just switch their ranks to change the `Rifleman (Light)` class to become the group leader they will be out of order in the slotting screen. Make sure you change the unit's description to Team Leader or Machine Gunner depending on what they are going to be. The description is what people will see in the slotting screen.

#### Adding Vehicle Markers

To add GPS markers to vehicles in your mission you will need to name the vehicles in the editor and decide which sides should be able to see those markers on the map. Open the script located at `\scripts\bc_scripts\gpsmarkers\client.sqf` within your mission folder. If you want to have the vehicle visible to only BLUFOR add the name of the vehicle to `_westVehArray` on line 35 of that file. When your done line 35 should look like this:

`_westVehArray = [myVehicle];`

If you want to add multiple vehicles to be visible to BLUFOR then it would look like this:

`_westVehArray = [myFirstVehicle,mySecondVehicle];`

If you want the vehicle(s) to be visible to OPFOR instead then add the names to `_eastVehArray` on line 36 in the same fashion. 


###### Prettier Vehicle Names

If you followed the above example and added a vehicle to your mission it's marker would display as `myVehicle`. Since that looks silly you are able to add a custom name for your vehicle by adding the following line to it's initialization field in the editor:

`this setVariable ["bc_MarkerName", "My Custom Vehicle Text"];`

This will make the marker for the vehicle display as `My Custom Vehicle Text` on the map. Go ahead and change that to whatever callsign you want. 

#### Vehicle TFAR Radios

Every vehicle has a radio for whichever side it is assigned to when it is crewed. This is a problem for vehicles like the armed Offroad truck with a .50 cal since that truck only comes in a BLUFOR version. If you want players to use a vehicle from a different side you should either remove the other side's radio from that vehicle or replace it with the radio of the correct side.

To remove the radio from a vehicle just add the following line to it's initialization field in the editior:

`this setVariable ["tf_hasRadio", false, false];`

If you want to replace the radio with the correct radio for a side then use the following command in the vehicle's initialization field in the editor: 

`this setVariable ["tf_side", side, true];`

Replace the word side in the above with either `west`, `east`, or `guer` depending on which side you would like to have use the vehicle.

#### Adding TFAR Backpack Radios

If you would like for certain people to have backpack radios instead of just the invisible radios that they would get by default you will have to edit the loadout files in `scripts\bc_scripts\loadout\units\`. You will have to do this for each unit you want to have a backpack radio.

By default there is a parameter in the slotting screen (defined in `description.ext`) which lets an admin choose which units get radios or not. If this variable is not present in the `description.ext` then it will default to `0`. The possible values for this variable are:

	s_loadout_radio = 0 //Everybody gets a radio
	s_loadout_radio = 1 //Only team leaders and up get a radio
	s_loadout_radio = 2 //Only squad leaders and up get a radio
	s_loadout_radio = 3 //Nobody gets a radio
	
To comply with this variable your unit will need to meet all conditions appropriate for it. If your unit is a squad leader it will need to get a radio whenever `s_loadout_radio` is equal to anything but `3`. To do this you would use the code below (modifying the backpacks added of course):

	if (s_loadout_radio != 3) then {
		player addBackpack "tf_rt1523g_big_bwmod_tropen";
	} else {
		player addBackpack "B_AssaultPack_rgr";
	};

That will add a backpack radio to the unit as long as `s_loadout_radio` is not equal to `3`. If it is equal to `3` then it will give the unit another backpack so it is still able to hold items. 

If your unit is a Team Leader he will only meet the requirements for a radio when `s_loadout_radio` is equal to `0`, or `1`. Any other time the unit will not get a radio. If your unit is a Team Leader you will want to use code similar to the following:

	if ((s_loadout_radio == 0) or (s_loadout_radio == 1)) then {
		player addBackpack "tf_rt1523g_big_bwmod_tropen";
	} else {
		player addBackpack "B_AssaultPack_rgr";
	};
	
Keep in mind that the TFAR backpack radios are a lot heavier than standard backpacks so you may wish to edit the unit's gear depending on which backpack they are getting.

---

# Using Non-Default Scripts

There are scripts included with the template that do not run by default. This section will tell you how to use them in your mission if that is what you would like to do. If the instructions below do not help you then try reading the comments in the header of the file you are working with.

## randomstart

This script has two parts. The first part is `server.sqf` which has the server randomly select a marker from a list of markers that exist in the editor. Either run it from `init.sqf` or `initServer.sqf` with the following command:

	[] execVM "scripts\randomstart\server.sqf";
	
The second part is `client.sqf` which actually places a player at the spot randomly selected by the server. The player's position relative to a marker called `placemark` will be saved and the player will be placed in the same position relative to the randomly selected marker and then set to face the same direction as that marker. Call this script on all clients in `init.sqf` or `initPlayerLocal.sqf` with the following command:

	[] execVM "scripts\randomstart\server.sqf";
	
##### Making it work in your mission

1. In the editor you will need to put a marker named `placemark` near the team you wish to be moved to the randomly selected point. 

2. You will need to place down markers for each possible position you would like a team to be able to start from. If you want a certain position to have increased odds of being the chosen position then you can place multiple markers there.

3. Add the names of all the markers that you placed in step 2 to the array `_markerArray` in the `scripts\randomstart\server.sqf` file. All marker names need to be surrounded with quotes. If you happen to have a marker defined in the array that does not exist in the editor then if it is selected the players will be teleported to the bottom left corner of the map.

4. Set which team you want to be randomly placed in the `scripts\randomstart\client.sqf` file. Possible values are `west`, `east`, and `guer`.

That's it! Test it out a few times to make sure it works.


## sectors

This script has two parts but only one part needs to be called. Call only `server.sqf` to run on the server using the following command in the `init.sqf` or `initServer.sqf` files:

	[] execVM "scripts\sectors\server.sqf";
	
This script will create sectors based on triggers that are placed in the editor. It will create markers and keep track of team's points which are gained by holding sectors. Currently, it only works with two factions in a mission and by default they are the OPFOR and BLUFOR units provided with the template.

##### Making it work in your mission

1. In the editor place down a trigger. Make the trigger the size and shape that you want the sector to be. Name the trigger something that you will remember for later and set the trigger's text field to what you would like the sector to be called during the mission. Make sure you set the trigger's activation fields to `ANYBODY`, `REPEATEDLY`, `PRESENT` and the trigger's condition to `this`. Also make sure the timer field has it's MIN, MID, and MAX set to 0.

2. Open `scripts\sectors\server.sqf` and add the name of the trigger to the array `_triggerArray` which should be around line 18. If you intend to have more than one trigger go ahead and add those to the array as well. Make sure you remove any triggers from the array that do not exist or it will mess up the points calculation later on.

3. The `endPoints` variable is calculated by taking the number of sectors in the mission and multiplying them by `quickestTime` multiplied by 60. The `quickestTime` variable is the time in minutes that it would take for one side to win the match assuming they controlled all sectors at once from the start of the mission until the mission ends. Anticipate the average scenario being that one team controls the majority of cap points (2/3, 3/5, 4/7, etc.) and calculate the quickest scenario time based off that. Since we mainly use a 45 minute battle phase during Friday Night Fights try to balance it so that if a team holds the majority of points they will win on points within or just after that time. To change the value of `quickestTime` edit the value in the following code from `25` to whatever you want. You can find the code somewhere around line 30 in `server.sqf`:

		quickestTime = ["sc_quickest_ending",25] call BIS_fnc_getParamValue;

4. To add variable choices in the slotting screen for the `quickestTime` variable you will need to add the following code to `class Params` in the missions `description.ext` file:

		class sc_quickest_ending
		{
			title = "Quickest Sector Control Victory Time:"
			values[] = {25,27,30};
			texts[] = {"25 minutes (default)","27 minutes","30 minutes"};
			default = 25;
		};




