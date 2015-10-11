class RscTitles
{
	class redforStructText
	{    
		idd = 9910;
		movingEnable = 0;
		enableSimulation = 1;
		enableDisplay = 1;
		duration = 9999;
		fadein = 0;
		fadeout = 0;
		name = "redforStructText";
		onLoad = "uiNamespace setVariable ['redforStructText', _this select 0];";
		onUnLoad = "uiNamespace setVariable ['redforStructText', nil]";
	class controls
		{
		    class structuredText
            {
                access = 0;
                type = 13;
                idc = 1001;
                style = 0x00;
                lineSpacing = 1;
				x = safeZoneX + safeZoneW - 0.44 * 3 / 4; 
				y = safeZoneY + safeZoneH - 0.063;
				h = 0.03;
				w = 0.44 * 3 / 4; //w == h
                size = 0.020;
                colorBackground[] = {0,0,0,0.85};
                colorText[] = {1,1,1,1};
                text = "";
                font = "TahomaB";
					class Attributes{
						font = "TahomaB";
						color = "#CC0000";
						align = "LEFT";
						valign = "bottom";
						shadow = true;
						shadowColor = "#000000";
						underline = false;
						size = "1.4";
					}; 
			};  
		};	
	};
	class bluforStructText
	{    
		idd = 9911;
		movingEnable = 0;
		enableSimulation = 1;
		enableDisplay = 1;
		duration = 9999;
		fadein = 0;
		fadeout = 0;
		name = "bluforStructText";
		onLoad = "uiNamespace setVariable ['bluforStructText', _this select 0];";
		onUnLoad = "uiNamespace setVariable ['bluforStructText', nil]";
	class controls
		{
		    class structuredText2
            {
                access = 0;
                type = 13;
                idc = 1002;
                style = 0x00;
                lineSpacing = 1;
				x = safeZoneX + safeZoneW - 0.44 * 3 / 4; 
				y = safeZoneY + safeZoneH - 0.033;
				h = 0.033;
				w = 0.44 * 3 / 4; //w == h
                size = 0.020;
                colorBackground[] = {0,0,0,0.85};
                colorText[] = {1,1,1,1};
                text = "";
                font = "TahomaB";
					class Attributes{
						font = "TahomaB";
						color = "#0064CC";
						align = "LEFT";
						valign = "bottom";
						shadow = true;
						shadowColor = "#000000";
						underline = false;
						size = "1.4";
					}; 
			};  
		};	
	};
};