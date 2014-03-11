private ["_C130Start","_C130Model","_wp2","_aigroup","_C130pilot","_spawnplane","_C130Finish"];

while {true} do {    
   
    _C130Model = "MV22";
    
    _C130Start = [2000.7007,2000.05298,2000];
    _C130Finish = [5000.7007,5000.05298,2000];
    
    _spawnplane = createVehicle [_C130Model,_C130Start, [], 0, "FLY"];
	PUBR_spawnPlane = _spawnplane;
	publicVariable "PUBR_spawnPlane";  
    
    _spawnplane engineOn true;
    _spawnplane flyInHeight 2100;
    _spawnplane forceSpeed 180;
    _spawnplane setspeedmode "NORMAL";
    
    _aigroup = creategroup east;
    _C130pilot = _aigroup createUnit ["C_man_w_worker_F",getPos _spawnplane,[],0,"FORM"];
    _C130pilot moveindriver _spawnplane;
    _C130pilot assignAsDriver _spawnplane;
    
    _wp2 = _aigroup addWaypoint [_C130Finish, 0];
    _wp2 setWaypointType "MOVE";
    _wp2 setWaypointBehaviour "CARELESS";
    diag_log(format["PLANE STARTED"]);
    
    waituntil {(_spawnplane distance _C130Finish) <= 1000 || not alive _spawnplane || (getPosATL _spawnplane select 2) < 5 || (damage _spawnplane) >= _crashDamage};
    sleep 5;	
    
    //Clean Up the Crashsite
    deletevehicle _spawnplane;
    deletevehicle _C130pilot;
    diag_log(format["PLANE DELETED"]);    
    
};
