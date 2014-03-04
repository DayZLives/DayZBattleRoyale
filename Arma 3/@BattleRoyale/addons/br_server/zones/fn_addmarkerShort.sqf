// Script by lazyink. Please request permission for use!

private ["_playArea","_time","_finish_time_minutes","_finish_time_seconds","_coords","_finalposition"];

_coords = [getMarkerPos "center",random 3000,random 360,false] call SHK_pos;

while {ELAPSED_TIME < END_TIME} do	{
    
    _time = END_TIME - ELAPSED_TIME;
    _finish_time_minutes = floor(_time / 60);
    _finish_time_seconds = (floor(_time)) - (60 * _finish_time_minutes);
    
    
    if((_finish_time_minutes == 50) && (_finish_time_seconds < 59)) then
    
    {
        [["IN 10 MINUTES, PLAY WILL BE RESTRICTED TO THE AREA INSIDE THE BLUE CIRCLE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        _playArea = createMarker ["playArea", _coords];
        _playArea setMarkerColor "ColorBlue";
        _playArea setMarkerShape "ELLIPSE";
        _playArea setMarkerBrush "BORDER";
        _playArea setMarkerSize [1500,1500];
        sleep 5; 
        [["THIS AREA WILL SHRINK EVERY FIVE MINUTES",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        sleep 10;  
        [["THE AREA HAS NOW BEEN MARKED ON THE MAP!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        sleep 60;
    };
    
    if((_finish_time_minutes == 45) && (_finish_time_seconds < 30)) then
    
    {
        [["IN 5 MINUTES, PLAY WILL BE RESTRICTED TO THE AREA INSIDE THE BLUE CIRCLE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;

        sleep 60;
    };
    
    if((_finish_time_minutes == 41) && (_finish_time_seconds < 59)) then
    {					
        [["IN 2 MINUTES, PLAY WILL BE RESTRICTED TO THE AREA INSIDE THE BLUE CIRCLE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        sleep 60;
        [["IN 60 SECONDS, PLAY WILL BE RESTRICTED TO THE AREA INSIDE THE BLUE CIRCLE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        sleep 60;  
        
        [["PLAY IS NOW RESTRICTED TO THE AREA INSIDE THE BLUE CIRCLE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        
        zoneSize = 1520;
        publicVariable "zoneSize";
        br_zone_started = true;
        publicVariable "br_zone_started";
    };
    
    
    if((_finish_time_minutes == 36) && (_finish_time_seconds < 59)) then
    {                  
        [["IN 2 MINUTES, PLAY WILL BE RESTRICTED TO THE AREA INSIDE THE BLUE CIRCLE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        _finalposition = [getMarkerPos "playArea",random 600,random 360,false] call SHK_pos;
        deleteMarker "playArea";
        _playArea = createMarker ["playArea", _finalposition];
        _playArea setMarkerColor "ColorBlue";
        _playArea setMarkerShape "ELLIPSE";
        _playArea setMarkerBrush "BORDER";
        _playArea setMarkerSize [1000,1000];
        [["YOUR MAP HAS BEEN UPDATED!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        sleep 60;
        [["IN 60 SECONDS, PLAY WILL BE RESTRICTED TO THE AREA INSIDE THE BLUE CIRCLE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        sleep 60;  
        
        [["PLAY IS NOW RESTRICTED TO THE AREA INSIDE THE BLUE CIRCLE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        zoneSize = 1020;
        publicVariable "zoneSize";
        br_zone_started = true;
        publicVariable "br_zone_started";
        
        
    };
    
    
    if((_finish_time_minutes == 31) && (_finish_time_seconds < 59)) then
    {
        [["IN 2 MINUTES, PLAY WILL BE RESTRICTED TO THE AREA INSIDE THE BLUE CIRCLE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        _finalposition = [getMarkerPos "playArea",random 600,random 360,false] call SHK_pos;
        br_zone_started = false;
        publicVariable "br_zone_started";
        deleteMarker "playArea";
        _playArea = createMarker ["playArea", _finalposition];
        _playArea setMarkerColor "ColorBlue";
        _playArea setMarkerShape "ELLIPSE";
        _playArea setMarkerBrush "BORDER";
        _playArea setMarkerSize [500,500];
        [["YOUR MAP HAS BEEN UPDATED!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        sleep 60;		
        [["IN 60 SECONDS, PLAY WILL BE RESTRICTED TO THE AREA INSIDE THE BLUE CIRCLE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        sleep 60;  
        
        [["PLAY IS NOW RESTRICTED TO THE AREA INSIDE THE BLUE CIRCLE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        zoneSize = 520;
        publicVariable "zoneSize";
        br_zone_started = true;
        publicVariable "br_zone_started";
    };        
    
    if((_finish_time_minutes == 26) && (_finish_time_seconds < 59)) then
    {
        [["IN 2 MINUTES, PLAY WILL BE RESTRICTED TO THE AREA INSIDE THE BLUE CIRCLE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        _finalposition = [getMarkerPos "playArea",random 125,random 360,false] call SHK_pos;
        br_zone_started = false;
        publicVariable "br_zone_started";
        deleteMarker "playArea";
        _playArea = createMarker ["playArea", _finalposition];
        _playArea setMarkerColor "ColorBlue";
        _playArea setMarkerShape "ELLIPSE";
        _playArea setMarkerBrush "BORDER";
        _playArea setMarkerSize [250,250];
        [["YOUR MAP HAS BEEN UPDATED!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        sleep 60; 
        [["IN 60 SECONDS, PLAY WILL BE RESTRICTED TO THE AREA INSIDE THE BLUE CIRCLE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        sleep 60;  
        
        [["PLAY IS NOW RESTRICTED TO THE AREA INSIDE THE BLUE CIRCLE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP; 
        zoneSize = 265;
        publicVariable "zoneSize";
        br_zone_started = true;
        publicVariable "br_zone_started";
    };        
    
    if((_finish_time_minutes == 21) && (_finish_time_seconds < 59)) then
    {
        [["IN 2 MINUTES, PLAY WILL BE RESTRICTED TO THE AREA INSIDE THE BLUE CIRCLE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        _finalposition = [getMarkerPos "playArea",random 65,random 360,false] call SHK_pos;
        br_zone_started = false;
        publicVariable "br_zone_started";
        deleteMarker "playArea";
        _playArea = createMarker ["playArea", _finalposition];
        _playArea setMarkerColor "ColorBlue";
        _playArea setMarkerShape "ELLIPSE";
        _playArea setMarkerBrush "BORDER";
        _playArea setMarkerSize [125,125];
        [["YOUR MAP HAS BEEN UPDATED!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        sleep 60;
        [["IN 60 SECONDS, PLAY WILL BE RESTRICTED TO THE AREA INSIDE THE BLUE CIRCLE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        sleep 60;  
        
        [["PLAY IS NOW RESTRICTED TO THE AREA INSIDE THE BLUE CIRCLE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP; 
        zoneSize = 140;
        publicVariable "zoneSize";
        br_zone_started = true;
        publicVariable "br_zone_started";
        
        
    };        
    
    
    if((_finish_time_minutes == 16) && (_finish_time_seconds < 59)) then
    {
        [["IN 2 MINUTES, PLAY WILL BE RESTRICTED TO THE AREA INSIDE THE BLUE CIRCLE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        _finalposition = [getMarkerPos "playArea",random 40,random 360,false] call SHK_pos;
        br_zone_started = false;
        publicVariable "br_zone_started";
        deleteMarker "playArea";
        _playArea = createMarker ["playArea", _finalposition];
        _playArea setMarkerColor "ColorBlue";
        _playArea setMarkerShape "ELLIPSE";
        _playArea setMarkerBrush "BORDER";
        _playArea setMarkerSize [75,75];
        [["YOUR MAP HAS BEEN UPDATED!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        sleep 60;
        [["IN 60 SECONDS, PLAY WILL BE RESTRICTED TO THE AREA INSIDE THE BLUE CIRCLE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        sleep 60;  
        
        [["PLAY IS NOW RESTRICTED TO THE AREA INSIDE THE BLUE CIRCLE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        zoneSize = 95;
        publicVariable "zoneSize";		
        br_zone_started = true;
        publicVariable "br_zone_started";
        sleep 10;  
        
        [["THERE ARE 5 MINUTES LEFT IN THE ROUND!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        
    };        
    
    
    if((_finish_time_minutes == 13) && (_finish_time_seconds < 59)) then
    {
        [["IN 2 MINUTES, PLAY WILL BE RESTRICTED TO THE AREA INSIDE THE BLUE CIRCLE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        _finalposition = [getMarkerPos "playArea",random 25,random 360,false] call SHK_pos;
        br_zone_started = false;
        publicVariable "br_zone_started";
        deleteMarker "playArea";
        _playArea = createMarker ["playArea", _finalposition];
        _playArea setMarkerColor "ColorBlue";
        _playArea setMarkerShape "ELLIPSE";
        _playArea setMarkerBrush "BORDER";
        _playArea setMarkerSize [50,50];
        [["YOUR MAP HAS BEEN UPDATED!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        sleep 10;
        [["THERE ARE 3 MINUTES LEFT IN THE ROUND!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        sleep 50;
        [["IN 60 SECONDS, PLAY WILL BE RESTRICTED TO THE AREA INSIDE THE BLUE CIRCLE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        sleep 65;  
        
        [["PLAY IS NOW RESTRICTED TO THE AREA INSIDE THE BLUE CIRCLE!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP; 
        zoneSize = 60;
        publicVariable "zoneSize";
        br_zone_started = true;
        publicVariable "br_zone_started";
        
		};        
            if((_finish_time_minutes == 11) && (_finish_time_seconds < 10)) then
			{                  
            
            [["1 MINUTE! NO GUTS, NO GLORY!",0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP; 
			sleep 15;
			};
        
    if((_finish_time_minutes == 10) && (_finish_time_seconds < 10)) then {
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
    
    sleep 1;
};