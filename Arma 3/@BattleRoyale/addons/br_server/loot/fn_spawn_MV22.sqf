private ["_crashDamage","_preWaypoints","_preWaypointPos","_endTime","_startTime","_heliStart","_heliModel","_wp2","_aigroup","_wp","_helipilot","_crashwreck","_pos","_guaranteedLoot","_randomizedLoot","_frequency","_variance","_spawnChance","_spawnMarker","_spawnRadius","_spawnFire","_crashName","_unsorted","_closest","_helper","_i","_sorted","_fadeFire","_randomizedWP","_guaranteedWP","_chutetype","_boxtype","_crashwreck", "_delay", "_rnd", "_bomb",  "_objects", "_explo", "_seed", "_fire", "_bombPos"];

_guaranteedLoot = _this select 0;
_randomizedLoot = _this select 1;
_frequency	= _this select 2;
_variance	= _this select 3;
_spawnChance	= _this select 4;
_spawnMarker	= _this select 5;
_spawnRadius	= _this select 6;
_spawnFire	= _this select 7;
_fadeFire	= _this select 8;
_randomizedWP	= _this select 9;
_guaranteedWP	= _this select 10;

_chutetype = "B_Parachute_02_F";
_boxtype = "Box_IND_AmmoVeh_F";

if(count _this > 11) then {
	_crashDamage = _this select 11;
} else {
	_crashDamage = 1;
};


diag_log(format["PLANE: Starting spawn logic for Carepackage drops [CD:%1]", _crashDamage]);

while {true} do {

	_preWaypoints = round(random _randomizedWP) + _guaranteedWP;
	
	private["_timeAdjust","_timeToSpawn","_spawnRoll","_crash","_hasAdjustment","_newHeight","_adjustedPos"];
	// Allows the variance to act as +/- from the spawn frequency timer
	_timeAdjust = round(random(_variance * 2) - _variance);
	_timeToSpawn = time + _frequency + _timeAdjust;

	//Random Heli-Type
	_heliModel = "MV22";

	//Random-Startpositions, Adjust this for other Maps then Chernarus
	_heliStart = [[100.7007,100.05298,300],[9000.715,9000.18848,300]] call BIS_fnc_selectRandom;


	_crashName	= getText (configFile >> "CfgVehicles" >> _heliModel >> "displayName");

	diag_log(format["PLANE: %1%2 chance to start a %3 Carepackagedrop at %4 with %5 drop points", round(_spawnChance * 100), '%', _crashName, _timeToSpawn, _preWaypoints]);

	// Apprehensive about using one giant long sleep here given server time variances over the life of the server daemon
	while {time < _timeToSpawn} do {
		sleep 5;
	};

	_spawnRoll = random 1;

	// Percentage roll
	if (_spawnRoll <= _spawnChance) then {

		//Spawn the AI-Heli flying in the air
		_startTime = time;
		_crashwreck = createVehicle [_heliModel,_heliStart, [], 0, "FLY"];

		_crashwreck engineOn true;
		_crashwreck flyInHeight 110;
		_crashwreck forceSpeed 140;
		_crashwreck setspeedmode "NORMAL";

		_aigroup = creategroup west;
		_helipilot = _aigroup createUnit ["C_man_w_worker_F",getPos _crashwreck,[],0,"FORM"];
		_helipilot moveindriver _crashwreck;
		_helipilot assignAsDriver _crashwreck;

		sleep 0.5;

		
		_unsorted = [];
		
		for "_x" from 1 to _preWaypoints do {
		
			_preWaypointPos = [getMarkerPos "center",random 4000,random 360,false] call SHK_pos;
			_unsorted = _unsorted + [_preWaypointPos];
			
			};
	
		_sorted = [];
		_pos = [800,2400];

	{
     _closest = _unsorted select 0;
     {if ((_x distance _pos) <= (_closest distance _pos)) then {_closest = _x}} forEach _unsorted;
	 
     _sorted = _sorted + [_closest];

	_helper = [];
	_i=0;
	while {!([_helper, _closest] call BIS_fnc_areEqual)} do { 
		_helper = _unsorted select _i;
		_i=_i+1;
		};

	_unsorted set [(_i-1),"delete_me"];
	_unsorted = _unsorted - ["delete_me"];
	} forEach _unsorted;
			
	diag_log(format["PLANE: %1 started flying from %2 to first waypoint NOW!(TIME:%3)", _crashName,  str(_heliStart), round(time)]);
		

		
		for "_x" from 0 to ((count _sorted)-1) do {

			diag_log(format["PLANE: Adding DROPWaypoint #%1 on %2", (_x+1),str(_sorted select _x)]);
			_wp = _aigroup addWaypoint [(_sorted select _x), 0];
			_wp setWaypointType "MOVE";
			_wp setWaypointBehaviour "CARELESS";

			waituntil {(_crashwreck distance (_sorted select _x)) <= 250 || not alive _crashwreck || (getPosATL _crashwreck select 2) < 5 || (damage _crashwreck) >= _crashDamage};	
			
			diag_log(format["PLANE IS AT DROPWAYPOINT #%1 on %2", (_x+1),str(getpos _crashwreck)]);
			sleep 2;
			//nul = [_chutetype, _boxtype, _helistart, _crashwreck, _randomizedLoot, _guaranteedLoot] spawn server_carepackagedrop;
			
			
			
			sleep 20;
			_crashwreck animate ["ramp_bottom",1];			
			
			_FNC_explode = {
				_bomb = _this select 1;
				_objects = [];
				waitUntil {((getPosATL _bomb select 2) < 2);};
				_bomb enableSimulation false;
				_objects = nearestObjects [_bomb, [], 15];
				_explo = createvehicle ["HelicopterExploBig", _bomb, [], 0, "NONE"];
				{
					_x setDamage 1;
				} forEach _objects;
				deleteVehicle _bomb;
			};
			
			for [{_z=1},{_z<=30},{_z=_z+1}] do {		

				_bomb = createvehicle ["Land_WaterBarrel_F", [(getPos _crashwreck select 0) + 500, (getPos _crashwreck select 1) + 500, (getPos _crashwreck select 2) + 500], [], 0, "NONE"];
				_bomb attachTo [_crashwreck, [-5,-4,-3]];
				_bomb setVectorDirAndUp [[-1,0,-1],[0,-1,0]];
				sleep 0.01;
				detach _bomb;
				sleep 0.1;
				[0.1, _bomb] spawn _FNC_explode;
			};
			
			sleep 2;
			_crashwreck animate ["ramp_bottom",0];
			if (not alive _crashwreck || (damage _crashwreck) >= _crashDamage || (getPosATL _crashwreck select 2) < 5 ) exitWith {diag_log(format["DROPPED 1 LAST PACKAGE WHILE GETTING SHOT DOWN #%1 on %2", _x,str(getpos _crashwreck)]); };
			
		};
		
		
		_wp2 = _aigroup addWaypoint [_heliStart, 0];
		_wp2 setWaypointType "MOVE";
		_wp2 setWaypointBehaviour "CARELESS";
		diag_log(format["PLANE IS AT END WAYPOINT on %1",str(_heliStart)]);
		waituntil {(_crashwreck distance _heliStart) <= 1000 || not alive _crashwreck || (getPosATL _crashwreck select 2) < 5 || (damage _crashwreck) >= _crashDamage};
		
		sleep 5;	
		
		//Clean Up the Crashsite
		deletevehicle _crashwreck;
		deletevehicle _helipilot;
		diag_log(format["PLANE DELETED"]);
	
		_endTime = time - _startTime;
		diag_log(format["PLANE: %2 Carepackagedrops completed! Runtime: %1 Seconds", round(_endTime), _preWaypoints]);
		
	};
};