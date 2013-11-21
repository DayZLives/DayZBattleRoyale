// Script by lazyink. Please request permission for use!	
[] spawn {
    
    private ["_time","_finish_time_minutes"];
    
    
    while {ELAPSED_TIME < END_TIME} do  {
        
        _time = END_TIME - ELAPSED_TIME;
        _finish_time_minutes = floor(_time / 60);
        
        if(br_totalplayers == 41) then {
            
            [nil,nil,rTitleText,"1 DEAD, 41 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 40) then {
            
            [nil,nil,rTitleText,"2 DEAD, 40 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 39) then {
            
            [nil,nil,rTitleText,"3 DEAD, 39 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 38) then {
            
            [nil,nil,rTitleText,"4 DEAD, 38 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 37) then {
            
            [nil,nil,rTitleText,"5 DEAD, 37 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 36) then {
            
            [nil,nil,rTitleText,"6 DEAD, 36 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 35) then {
            
            [nil,nil,rTitleText,"7 DEAD, 35 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 34) then {
            
            [nil,nil,rTitleText,"8 DEAD, 34 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 33) then {
            
            [nil,nil,rTitleText,"9 DEAD, 33 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 32) then {
            
            [nil,nil,rTitleText,"10 DEAD, 32 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 31) then {
            
            [nil,nil,rTitleText,"11 DEAD, 31 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 30) then {
            
            [nil,nil,rTitleText,"12 DEAD, 30 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 29) then {
            
            [nil,nil,rTitleText,"13 DEAD, 29 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 28) then {
            
            [nil,nil,rTitleText,"14 DEAD, 28 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 27) then {
            
            [nil,nil,rTitleText,"15 DEAD, 27 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 26) then {
            
            [nil,nil,rTitleText,"16 DEAD, 26 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 25) then {
            
            [nil,nil,rTitleText,"17 DEAD, 25 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 24) then {
            
            [nil,nil,rTitleText,"18 DEAD, 24 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 23) then {
            
            [nil,nil,rTitleText,"19 DEAD, 23 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 22) then {
            
            [nil,nil,rTitleText,"20 DEAD, 22 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 21) then {
            
            [nil,nil,rTitleText,"21 DEAD, 21 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 20) then {
            
            [nil,nil,rTitleText,"22 DEAD, 20 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 19) then {
            
            [nil,nil,rTitleText,"23 DEAD, 19 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 18) then {
            
            [nil,nil,rTitleText,"24 DEAD, 18 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 17) then {
            
            [nil,nil,rTitleText,"25 DEAD, 17 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 16) then {
            
            [nil,nil,rTitleText,"26 DEAD, 16 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 15) then {
            
            [nil,nil,rTitleText,"27 DEAD, 15 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 14) then {
            
            [nil,nil,rTitleText,"28 DEAD, 14 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 13) then {
            
            [nil,nil,rTitleText,"29 DEAD, 13 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 12) then {
            
            [nil,nil,rTitleText,"30 DEAD, 12 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 11) then {
            
            [nil,nil,rTitleText,"31 DEAD, 11 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 10) then {
            
            [nil,nil,rTitleText,"32 DEAD, 10 TO GO!", "PLAIN",10] call RE;
            
        };
        
        if((br_totalplayers == 10) && (_finish_time_minutes == 45))then {
            
            ELAPSED_TIME = ELAPSED_TIME + 1200;
            publicVariable "ELAPSED_TIME";
            sleep 60;
            
        };
        
        if((br_totalplayers == 10) && (_finish_time_minutes == 35))then {
            
            ELAPSED_TIME = ELAPSED_TIME + 900;
            publicVariable "ELAPSED_TIME";
            sleep 60;
            
        };
        
        if((br_totalplayers == 10) && (_finish_time_minutes == 25))then {
            
            ELAPSED_TIME = ELAPSED_TIME + 600;
            publicVariable "ELAPSED_TIME";
            sleep 60;
            
        };
        
        
        if(br_totalplayers == 9) then {
            
            [nil,nil,rTitleText,"33 DEAD, 9 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 8) then {
            
            [nil,nil,rTitleText,"34 DEAD, 8 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 7) then {
            
            [nil,nil,rTitleText,"35 DEAD, 7 TO GO!", "PLAIN",10] call RE;
            
        };
        
        
        if(br_totalplayers == 6) then {
            
            [nil,nil,rTitleText,"36 DEAD, 6 TO GO!", "PLAIN",10] call RE;
            
        };
        
        if(br_totalplayers == 5) then {
            
            [nil,nil,rTitleText,"37 DEAD, 5 TO GO!", "PLAIN",10] call RE;
            
        };
        
        if(br_totalplayers == 4) then {
            
            [nil,nil,rTitleText,"38 DEAD, 4 TO GO!", "PLAIN",10] call RE;
            
        };
        
        if(br_totalplayers == 3) then {
            
            [nil,nil,rTitleText,"39 DEAD, 3 TO GO!", "PLAIN",10] call RE;
            
        };
        
        if(br_totalplayers == 2) then {
            
            [nil,nil,rTitleText,"40 DEAD, 2 TO GO!", "PLAIN",10] call RE;
            
        };
        
        if(br_totalplayers == 1) then {
            
            [nil,nil,rTitleText,"WINNER, WINNER, CHICKEN DINNER!", "PLAIN",10] call RE;
            
        };
        
        
        sleep 0.1;
        
    };
};