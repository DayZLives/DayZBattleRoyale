private ["_C130Start","_wp2","_aigroup","_C130pilot","_spawnplane","_C130Finish"];
				   
_C130Finish = [5000,6000,200];
diag_log("BR Tools: Loaded Start/Finish Pos");
_spawnplane = createVehicle ["C130J",[2000,2000,200], [], 0, "FLY"];
diag_log("BR Tools: Created C130J");
_spawnplane setPosASL [ getPosASL _spawnplane select 0, getPosASL _spawnplane select 1,1400];
diag_log("BR Tools: Set C130J Height");
_spawnplane engineOn true;
_spawnplane flyInHeight 1400;
_spawnplane forceSpeed 220;
_spawnplane setspeedmode "NORMAL";
	
PUBR_spawnPlane = _spawnplane;
publicVariable "PUBR_spawnPlane";

diag_log("BR Tools: C130J PV Pushed");

_aigroup = creategroup east;
_C130pilot = _aigroup createUnit ["C_man_w_worker_F",getPos _spawnplane,[],0,"FORM"];
_C130pilot moveindriver _spawnplane;
_C130pilot assignAsDriver _spawnplane;
diag_log("BR Tools: C130J Assigned Pilot");
_wp2 = _aigroup addWaypoint [_C130Finish, 0];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointBehaviour "AWARE";
diag_log("BR Tools: C130J Moving to Finish");


waituntil {(_spawnplane distance _C130Finish) <= 200 || not alive _spawnplane || (getPosATL _spawnplane select 2) < 5};
sleep 5;	

//Clean Up the Crashsite
deletevehicle _spawnplane;
deletevehicle _C130pilot;
diag_log("BR Tools: C130J Deleted"); 

