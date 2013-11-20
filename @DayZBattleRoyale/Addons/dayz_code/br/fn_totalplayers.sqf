// Script by lazyink. Please request permission for use!	
[] spawn {
    
    private ["_time","_finish_time_minutes","_killsV","_pos","_config","_isOK"];
    
    while {ELAPSED_TIME < END_TIME} do      {
        
        _time = END_TIME - ELAPSED_TIME;
        _finish_time_minutes = floor(_time / 60);

		
		if ((br_totalplayers == 1) && (_finish_time_minutes < 85)) then  {
			[nil,nil,rTitleText,"WINNER WINNER, CHICKEN DINNER!", "PLAIN",10] call RE;
			sleep 1;
				
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
            [nil,nil,rTitleText,"YOU ARE A BATTLE ROYALE WINNER! CONGRATULATIONS!", "PLAIN",10] call RE;
            sleep 5;
            [nil,nil,rTitleText,"PLEASE WAIT WHILE WE UPDATE THE LEADERBOARD! THANKS!", "PLAIN",10] call RE;
            
            
			
			sleep 10;
			
			player addEventHandler ['Fired', {player SetDamage 2;}];
			_config = 'glock17_EP1';_isOK = [player,_config, true] call BIS_fnc_invAdd;
			_config = '17Rnd_9x19_glock17';_isOK = [player,_config, true] call BIS_fnc_invAdd;
			player selectWeapon 'glock17_EP1';
			reload player;
			sleep 1.5;
			player switchMove 'ActsPercMstpSnonWpstDnon_suicide1B';
			sleep 3.9;
			player fire (currentWeapon player);
			player setDamage 1;
		};

        sleep 10;
   
    };
};