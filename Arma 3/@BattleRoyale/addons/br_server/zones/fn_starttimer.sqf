
// Script by lazyink. Please request permission for use!	
[] spawn {
    
    private ["_time","_finish_time_minutes","_finish_time_seconds"];
	
	
    while {ELAPSED_TIME < END_TIME} do  {
        
        _time = END_TIME - ELAPSED_TIME;
        _finish_time_minutes = floor(_time / 60);
        _finish_time_seconds = (floor(_time)) - (60 * _finish_time_minutes);
		
        if((_finish_time_minutes == 74) && (_finish_time_seconds < 55)) then {
                                         
            br_game_started = true;            
            publicVariable "br_game_started";                          
            
            [["WELCOME TO BATTLE ROYALE: STRATIS",0,0.7,5,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;

            sleep 5;
            [["USE THE SCROLL MENU TO OPEN YOUR CHUTE. MIDDLE CLICK TO ACTION!",0,0.7,5,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;

            sleep 5;

			[["TEN!",0,0.7,1,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
            sleep 1;
            
            [["NINE!",0,0.7,1,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
            sleep 1;
            
            [["EIGHT!",0,0.7,1,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
            sleep 1;
            
            [["SEVEN!",0,0.7,1,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
            sleep 1;
            
            [["SIX!",0,0.7,1,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
            sleep 1;
            
            [["FIVE!",0,0.7,1,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
            sleep 1;
            
            [["FOUR!",0,0.7,1,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
            sleep 1;
            
            [["THREE!",0,0.7,1,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
            sleep 1;
            
            [["TWO!",0,0.7,1,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
            sleep 1;
            
            [["ONE!",0,0.7,1,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
            sleep 1; 
            
            [["GOOD LUCK, AND HAVE FUN!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
            sleep 10; 
            
            [["DON'T FORGET TO OPEN YOUR PARACHUTE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
           			
            sleep 60;
            
            
            
        };
        
        
        if((_finish_time_minutes == 70) && (_finish_time_seconds < 10)) then
        {
            [["RANDOM CARPET BOMBING WILL BEGIN IN 5 MINUTES!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
			sleep 10;
			[] execVM "\br_server\server_starter\serverRestart.sqf";
        };  
        
        if((_finish_time_minutes == 68) && (_finish_time_seconds < 1)) then
        {
            [["RANDOM CARPET BOMBING WILL BEGIN IN 3 MINUTES!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        };  
        
        if((_finish_time_minutes == 67) && (_finish_time_seconds < 1)) then
        {
            [["RANDOM CARPET BOMBING WILL BEGIN IN 2 MINUTES!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        };  
        
        if((_finish_time_minutes == 66) && (_finish_time_seconds < 1)) then
        {
            [["RANDOM CARPET BOMBING WILL BEGIN IN 1 MINUTE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        };
        
        if((_finish_time_minutes == 65) && (_finish_time_seconds < 1)) then
        {
            [["THE RANDOM CARPET BOMBING HAS STARTED! TARGET ZONES ARE MARKED IN RED ON THE MAP!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        };  
        
        if((_finish_time_minutes == 46) && (_finish_time_seconds < 50)) then
        {
            [] execVM "\br_server\zones\fn_addmarker.sqf";
            sleep 60;
            
        };  
        
        
        if((_finish_time_minutes == 1) && (_finish_time_seconds < 1)) then
        {                  
            
            [["1 MINUTE! NO GUTS, NO GLORY!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;                
        };
        
        if((_finish_time_minutes == 0) && (_finish_time_seconds < 1)) then {
            [["30 SECONDS!",0,0.7,1,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
            sleep 20;
            [["TEN!",0,0.7,1,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
            sleep 1;
            [["NINE!",0,0.7,1,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
            sleep 1;
            [["EIGHT!",0,0.7,1,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
            sleep 1;
            [["SEVEN!",0,0.7,1,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
            sleep 1;
            [["SIX!",0,0.7,1,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
            sleep 1;
            [["FIVE!",0,0.7,1,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
            sleep 1;
            [["FOUR!",0,0.7,1,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
            sleep 1;
            [["THREE!",0,0.7,1,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
            sleep 1;
            [["TWO!",0,0.7,1,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
            sleep 1;
            [["ONE!",0,0.7,1,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
            sleep 1;
            [["CHECKING PLAYER COUNT!",0,0.7,1,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
            
            
            
            br_winner_check = true;
            publicVariable "br_winner_check";
            sleep 60;
            _result = call compile ("Arma2Net.Unmanaged" callExtension "eXchangeArmATools [shutdownServer]");
            
        };
		
        br_totalplayers = {((alive _x) && (str(side _x) != "CIV"))} count playableUnits;
        publicVariable "br_totalplayers";
        sleep 3;
 
    };
};