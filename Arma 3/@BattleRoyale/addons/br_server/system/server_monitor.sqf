
	waitUntil{initialized}; //means all the functions are now defined
	
	waituntil{isNil "sm_done"}; // prevent server_monitor be called twice (bug during login of the first player)
	
	call compile preprocessFileLineNumbers "\br_server\init\server_functions.sqf";
	
	_timeChance = random 100;	
	
	if (_timeChance < 50) then {
	
		_br_date = [2035, 5, 25, 17, 30];
		br_date = _br_date;
		publicVariable "br_date";
		
	} else {
	
		_br_date = [1945, 5, 25, 19, 0];		
		br_date = _br_date;		
		publicVariable "br_date";
		br_night = true;            
		publicVariable "br_night";
		
	};
	
	call fnc_BRLootBuildings;
	call fnc_BRClutter;
	call fnc_BRVehicles;
	
	createCenter civilian;

	if (isDedicated) then {
		endLoadingScreen;
	};	
		
	allowConnection = true;

	[] execVM "\br_server\server_starter\serverBegin.sqf";
	sm_done = true;
	publicVariable "sm_done";
	