waituntil {!isnil "bis_fnc_init"};

fnc_BRLootBuildings = compile preprocessFileLineNumbers "\br_server\loot\BR_LootBuildings.sqf";
fnc_BRClutter = compile preprocessFileLineNumbers "\br_server\clutter\fn_clutter.sqf";
	

//[] execVM "\br_server\init\AH.sqf";

sf_done = true;
publicVariable "sf_done";
