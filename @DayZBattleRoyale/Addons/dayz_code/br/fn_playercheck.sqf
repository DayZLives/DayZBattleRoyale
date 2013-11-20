// Script by lazyink. Please request permission for use!


[] spawn {
    
    
    private ["_pos","_killsV"];
    while {alive player} do {    
        
        waitUntil{br_player_check};
        if (br_totalplayers == 1) then {	
            
            
            _killsV = player getVariable ["banditKills",0];
            
            player setVariable ["banditKills",(_killsV + 1),true];
			
            _pos = getPos player;
            
            createVehicle ["SmokeShellred",[(_pos select 0) + 10, (_pos select 1) + 20,40],[], 0, "CAN_COLLIDE"];
            sleep 0.2;
            createVehicle ["SmokeShellGreen",[(_pos select 0) - 10, (_pos select 1) - 20,40],[], 0, "CAN_COLLIDE"];
            sleep 0.2;
            createVehicle ["SmokeShellGreen",[(_pos select 0) - 10, (_pos select 1) + 20,40],[], 0, "CAN_COLLIDE"];
            sleep 0.2;
            createVehicle ["SmokeShellGreen",[(_pos select 0) + 10, (_pos select 1) - 20,40],[], 0, "CAN_COLLIDE"];
            
            createVehicle ["SmokeShellred",[(_pos select 0) + 10, (_pos select 1) + 10,40],[], 0, "CAN_COLLIDE"];
            sleep 0.2;
            createVehicle ["SmokeShellred",[(_pos select 0) - 10, (_pos select 1) - 10,40],[], 0, "CAN_COLLIDE"];
            sleep 0.2;
            createVehicle ["SmokeShellred",[(_pos select 0) - 10, (_pos select 1) + 10,40],[], 0, "CAN_COLLIDE"];
            sleep 0.2;
            createVehicle ["SmokeShellred",[(_pos select 0) + 10, (_pos select 1) - 10,40],[], 0, "CAN_COLLIDE"];
            sleep 0.2;
            createVehicle ["SmokeShell",[(_pos select 0) + 5, (_pos select 1) + 5,40],[], 0, "CAN_COLLIDE"];
            sleep 0.2;
            createVehicle ["SmokeShell",[(_pos select 0) - 5, (_pos select 1) - 5,40],[], 0, "CAN_COLLIDE"];
            sleep 0.2;
            createVehicle ["SmokeShell",[(_pos select 0) - 5, (_pos select 1) + 5,40],[], 0, "CAN_COLLIDE"];
            sleep 0.2;
            createVehicle ["SmokeShell",[(_pos select 0) + 5, (_pos select 1) - 5,40],[], 0, "CAN_COLLIDE"];
            sleep 5;
            
            [nil,nil,rTitleText,"YOU'VE KILLED THEM ALL!", "PLAIN",10] call RE;
            sleep 5;
            [nil,nil,rTitleText,"YOU ARE A BATTLE ROYALE CHAMPION! CONGRATULATIONS!", "PLAIN",10] call RE;
            sleep 5;
            [nil,nil,rTitleText,"PLEASE WAIT WHILE WE UPDATE THE LEADERBOARD! THANKS!", "PLAIN",10] call RE;
            sleep 1;
            
            
			
			sleep 20;
			
			player setDamage 1;
            
            
            
        } else { 
            
            
            [nil,nil,rTitleText,"YOU WERE NOT BOLD ENOUGH!", "PLAIN",10] call RE;
            
            sleep 3;
            
            [nil,nil,rTitleText,"BETTER LUCK NEXT TIME!", "PLAIN",10] call RE;
            
            sleep 1;
			
            player setDamage 1;
            
        };	
    };
    
    sleep 60;
};
