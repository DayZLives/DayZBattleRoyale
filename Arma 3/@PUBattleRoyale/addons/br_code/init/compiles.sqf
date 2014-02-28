//BR Complies

progressLoadingScreen 0.8;


	if (isServer) then {
		call compile preprocessFileLineNumbers "\br_server\init\server_functions.sqf";
		fn_getBuildingstospawnLoot = compile preProcessFileLineNumbers "\br_server\loot\fn_LSgetBuildingstospawnLoot.sqf"; 
		LSdeleter = compile preProcessFileLineNumbers "\br_server\loot\LSdeleter.sqf";
		sleep 1;
		[] execVM "\br_server\loot\Lootspawner.sqf";
	};

initialized = true;

	
	
	