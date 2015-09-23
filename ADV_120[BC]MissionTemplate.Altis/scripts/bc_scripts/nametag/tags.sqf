if (isDedicated) exitWith {};
  
//#define _debug true   //UNCOMMENT TO RUN DEBUG, WILL SHOW TIME TAKEN AND ANY LOSS OF FRAMES
#define _refresh 0.34
//#define _distance 30

while{true}do{
        #ifdef _debug
                _initTime = diag_tickTime;
                _frameNo = diag_frameNo;
        #endif
		
   _blank = " ";
   
   // PLAYER NAME CHECK AND DISPLAY
        _target = cursorTarget;
        if (_target isKindOf "Man" && player == vehicle player) then{
                if((faction _target == faction player) && (player distance _target) < 20)then{
					_name = name _target;
					//PRINT NAME ON SCREEN
					_nameString = format ["<t size='0.5' color='#f0e68c'>%1</t>",_name];
					[_nameString,0.5,0.9,_refresh,0,0,3] spawn bis_fnc_dynamicText;

                };
        };
        
        #ifdef _debug
        player sidechat format["time: %1, frames: %2",_initTime - diag_tickTime,_frameNo - diag_frameNo];
        #endif
        sleep _refresh;
};
