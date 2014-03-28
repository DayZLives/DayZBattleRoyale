
	waitUntil{initialized}; //means all the functions are now defined
	
	waituntil{isNil "sm_done"}; // prevent server_monitor be called twice (bug during login of the first player)
	
	call compile preprocessFileLineNumbers "\br_server\init\server_functions.sqf";
	
	_hour = floor (random 24);
	_minute = floor (random 60);
	
	_br_date = [2011, 6, 6, 3, _minute];
	br_date = _br_date;
	publicVariable "br_date";
	
	call fnc_BRLootBuildings;
	call fnc_BRClutter;
	call fnc_BRVehicles;
	
	createCenter civilian;
	
	setDate br_date;

	if (isDedicated) then {
		endLoadingScreen;
	};	
		
	allowConnection = true;

	[] execVM "\br_server\server_starter\serverBegin.sqf";
	sm_done = true;
	publicVariable "sm_done";