// Script by lazyink. Please request permission for use!


[] spawn {
    
    private ["_pos","_killsV","_config","_isOK"];
    while {alive player} do {    
        
        waitUntil{!isNil "br_winner_check"};
        if (side player == west) then { 
		
        _pos = getPos player;
        
        createVehicle ["SmokeShellred",[(_pos select 0) + 10, (_pos select 1) + 20,40],[], 0, "CAN_COLLIDE"];
        sleep 0.2;
        createVehicle ["SmokeShellGreen",[(_pos select 0) - 10, (_pos select 1) - 20,40],[], 0, "CAN_COLLIDE"];
        sleep 0.2;
        createVehicle ["SmokeShellGreen",[(_pos select 0) - 10, (_pos select 1) + 20,40],[], 0, "CAN_COLLIDE"];
        sleep 0.2;
        createVehicle ["SmokeShellGreen",[(_pos select 0) + 10, (_pos select 1) - 20,40],[], 0, "CAN_COLLIDE"];
		sleep 0.2;
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
        
        player setVariable ["PUBR_isover",true,true];
		sleep 1;
        };
    };
};
