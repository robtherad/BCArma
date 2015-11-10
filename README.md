# Bravo Company Mission Template

The master branch will always be the most up to date and stable version of the template. If you intend to make a mission, use the master version. This readme file has a lot of information but if you want to be able to navigate it easier then the [github wiki](https://github.com/robtherad/BCArma/wiki) might help.

---

## [Click Here to download the latest version (v16)](https://github.com/robtherad/BCArma/archive/v16.zip)

---

# Using the Template
First you'll need to download the template using the link above. Once it's done, drag the folder called `ADV_120[BC]MissionTemplate.Altis` into your Arma 3 mission folder. Your Arma 3 mission folder which should be a path similar to `C:\Users\Rob\Documents\Arma 3 - Other Profiles\robtherad\missions`.

[Once you are done, follow this guide.](https://github.com/robtherad/BCArma/wiki/Creating-a-Mission-with-the-Template)

---

# Using Non-Default Scripts

There are scripts included with the template that do not run by default. This section will tell you how to use them in your mission if that is what you would like to do. If the instructions below do not help you then try reading the comments in the header of the file you are working with.

## randomstart

This script has two parts. The first part is `server.sqf` which has the server randomly select a marker from a list of markers that exist in the editor. Either run it from `init.sqf` or `initServer.sqf` with the following command:

	[] execVM "scripts\randomstart\server.sqf";

The second part is `client.sqf` which actually places a player at the spot randomly selected by the server. The player's position relative to a marker called `placemark` will be saved and the player will be placed in the same position relative to the randomly selected marker and then set to face the same direction as that marker. Call this script on all clients in `init.sqf` or `initPlayerLocal.sqf` with the following command:

	[] execVM "scripts\randomstart\client.sqf";

##### Making it work in your mission

1. In the editor you will need to put a marker named `placemark` near the team you wish to be moved to the randomly selected point.

2. You will need to place down markers for each possible position you would like a team to be able to start from. If you want a certain position to have increased odds of being the chosen position then you can place multiple markers there.

3. Add the names of all the markers that you placed in step 2 to the array `_markerArray` in the `scripts\randomstart\server.sqf` file. All marker names need to be surrounded with quotes. If you happen to have a marker defined in the array that does not exist in the editor then if it is selected the players will be teleported to the bottom left corner of the map.

4. Set which team you want to be randomly placed in the `scripts\randomstart\client.sqf` file. Possible values are `west`, `east`, and `independent`.

That's it! Test it out a few times to make sure it works.


## sectors

This script has three parts but only one part needs to be called. Call only `server.sqf` to run on the server using the following command in the `init.sqf` or `initServer.sqf` files:

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
