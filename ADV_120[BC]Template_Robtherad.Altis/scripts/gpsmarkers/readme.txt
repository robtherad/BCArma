To enable the GPS marker script you need to run client.sqf on all clients. In the comments at the top of that file are instructions on how and where to call the script as well as some instructions on how to include markers for vehicles in your mission.

If you want to let an admin select wether or not to use the GPS markers you need to add the following class to Class Params in the description.ext file in the root folder of the mission.


	class s_gps_markers
	{
		title = "GPS Map Markers:"
		values[] = {0,1};
		texts[] = {"Disabled (default)","Enabled"};
		default = 0;
	};
	