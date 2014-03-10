
	waitUntil{initialized}; //means all the functions are now defined
	
	waituntil{isNil "sm_done"}; // prevent server_monitor be called twice (bug during login of the first player)
	
	call compile preprocessFileLineNumbers "\br_server\init\server_functions.sqf";
	
	call fnc_BRLootBuildings;
	
	createCenter civilian;

	if (isDedicated) then {
		endLoadingScreen;
	};	
		
	allowConnection = true;

	[] execVM "\br_server\server_starter\serverBegin.sqf";
	sm_done = true;
	publicVariable "sm_done";
	

