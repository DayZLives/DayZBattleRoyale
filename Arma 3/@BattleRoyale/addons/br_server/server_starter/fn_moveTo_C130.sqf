if (isServer) then {

	private ["_C130Start","_wp2","_aigroup","_C130pilot","_spawnplane","_C130Finish"];
				   
	_C130Finish = [5000,5000,200];
	diag_log("BR Tools: Loaded Start/Finish Pos");
	_spawnplane = createVehicle ["C130J",[2000,2000,200], [], 0, "FLY"];
	diag_log("BR Tools: Created C130J");
	_spawnplane setPosASL [ getPosASL _spawnplane select 0, getPosASL _spawnplane select 1,(getPosASL _spawnplane select 2) + 1400];
	diag_log("BR Tools: Set C130J Height");
	_spawnplane engineOn true;
	_spawnplane flyInHeight 1600;
	_spawnplane forceSpeed 340;
	_spawnplane setspeedmode "NORMAL";
	_spawnplane setVehicleLock "locked";
	_aigroup = creategroup east;
	_C130pilot = _aigroup createUnit ["C_man_w_worker_F",getPos _spawnplane,[],0,"FORM"];
	_C130pilot moveindriver _spawnplane;
	_C130pilot assignAsDriver _spawnplane;
	diag_log("BR Tools: C130J Assigned Pilot");
	_wp2 = _aigroup addWaypoint [_C130Finish, 0];
	_wp2 setWaypointType "MOVE";
	_wp2 setWaypointBehaviour "AWARE";
	diag_log("BR Tools: C130J Moving to Finish");
	
	sleep 5;
	{
		if ((str(side _x) == "WEST")) then
		{
			// _x moveInCargo _spawnplane;
			_x action ["getInCargo", _spawnplane];
			
		};
		
	} forEach allUnits;
	sleep 0.5;
	
	diag_log("BR Tools: Loaded Players");
	
	br_deploy_players = false;
	
	waitUntil {br_deploy_players};
	
	sleep 10;
	_spawnplane setDammage 1;
	sleep 1;
	_spawnplane setDammage 1;
	sleep 1;
	_spawnplane setDammage 1;
	sleep 1;
	_spawnplane setDammage 1;

	diag_log("BR Tools: C130J Destroyed"); 

};

