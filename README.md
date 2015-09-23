# Bravo Company Mission Template

The master branch will always be the most up to date and stable version of the template. If you intend to make a mission, use the master version.

# Using the Template

Download as zip from GitHub using the button on the bottom right. Drop the main folder named `ADV_120[BC]Template_Robtherad.Altis` in your Arma 3 mission folder which should be a path similar to `C:\Users\Rob\Documents\Arma 3 - Other Profiles\robtherad\missions`. If you would like to make a mission on an island other than Altis then change the suffix on the folder from `.Altis` to the suffix used by whichever map you intend to use. 

Now you should be able to open the 2D editor in Arma 3 and open the mission. Drag the playable units as well as the triggers and markers for the AO to the area you wish the mission to be played in. Then save the mission and test it.

## Common Modifications

There are some modifications that you may have to make in order to get certain scripts to work correctly with the type of mission you are making. If you are trying to change something and the stuff below doesn't make sense, try looking at the comments in the header of the file you are working on. 

##### Adding Vehicle Markers

To add GPS markers to vehicles in your mission you will need to name the vehicles in the editor and decide which sides should be able to see those markers on the map. Open the script located at `\scripts\bc_scripts\gpsmarkers\client.sqf` within your mission folder. If you want to have the vehicle visible to only BLUFOR add the name of the vehicle to _westVehArray on line 35 of that file. When your done line 35 should look like this:

`_westVehArray = [myVehicle];`

If you want to add multiple vehicles to be visible to BLUFOR then it would look like this:

`_westVehArray = [myFirstVehicle,mySecondVehicle];`

If you want the vehicle(s) to be visible to OPFOR instead then add the names to _eastVehArray on line 36 in the same fashion. 


###### Prettier Vehicle Names

If you followed the above example and added a vehicle to your mission it's marker would display as myVehicle. Since that looks silly you are able to add a custom name for your vehicle by adding the following line to it's initialization field in the editor:

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

There are modules included with the template that do not run by default. This section will tell you how to use them in your mission if that is what you would like to do.

#### WIP

For now just read the headers of the files and that should be enough to tell you how to use them. Eventually this section of the readme will be filled out.
