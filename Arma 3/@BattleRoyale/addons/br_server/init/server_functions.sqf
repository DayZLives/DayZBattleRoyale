private ["_date"];

waituntil {!isnil "bis_fnc_init"};

if (isServer) then {

	fnc_BRLootBuildings = compile preprocessFileLineNumbers "\br_server\loot\BR_LootBuildings.sqf";
	fnc_BRClutter = compile preprocessFileLineNumbers "\br_server\clutter\fn_clutter.sqf";
	fnc_BRVehicles = compile preprocessFileLineNumbers "\br_server\vehicles\fn_spawn_vehicles.sqf";

};

sf_done = true;
publicVariable "sf_done";
