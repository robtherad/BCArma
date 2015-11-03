To enable the sector control script you only need to call the server.sqf file. All instructions for stuff in the editor and the line for calling the server.sqf file are found at the top in the comments within that file.

If you want to let an admin select the mission runtime from the slot screen you need to add the following class to Class Params in the description.ext file in the root folder of the mission.

	class mission_runtime
	{
		title = "Mission Time Limit (Doesn't include safestart time):";
		values[] = {15,30,45,60};
		texts[] = {"15 minutes","30 minutes","45 minutes (default)","60 minutes"};
		default = 45;
	};
	