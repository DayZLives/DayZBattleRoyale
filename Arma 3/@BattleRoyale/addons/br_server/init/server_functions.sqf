waituntil {!isnil "bis_fnc_init"};

fnc_BRLootBuildings = compile preprocessFileLineNumbers "\br_server\loot\BR_LootBuildings.sqf";

//[] execVM "\br_server\init\AH.sqf";

sf_done = true;
publicVariable "sf_done";
