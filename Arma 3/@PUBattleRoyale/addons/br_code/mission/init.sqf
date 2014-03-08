private ["_serverMonitor","_id1","_br_start_lock"];

enableSaving [false,false];

//Load in compiled functions
call compile preprocessFileLineNumbers "\br_code\init\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "\br_code\init\compiles.sqf";					//Compile regular functions
progressLoadingScreen 1.0;
call compile preprocessFileLineNumbers "\br_code\scripts\shk_pos\shk_pos_init.sqf";					//Compile random marker position

if (isServer) then {
	_serverMonitor = [] execVM "\br_server\system\server_monitor.sqf";
};

if (!isDedicated) then {
	waitUntil {!isNull player};
	player setVariable ["BIS_noCoreConversations", true];
	player disableConversation true;
	player enableFatigue false;
	enableRadio false;
	enableSentences false;
	showSubtitles false;
	0 fadeRadio 0;
	br_game_started = false;
	
	call compile preProcessFileLineNumbers "\br_code\scripts\fn_playercheck.sqf";	
	
	// this must be execVM as it has waituntil and sleeps
	_id1 = [] execVM "\br_code\scripts\fn_punish.sqf";

	// must use spawn for BR_PARA as it uses waitUntil
	BR_PARA = {
	
        diag_log("BR Paradrop: Initialized");
		// wait for server to push br_game_started = true; publicvariable "br_game_started";
		waitUntil{sleep 0.01; br_game_started};
		terminate br_start_lock;		
		player addBackpack "B_Parachute";
		diag_log("BR Paradrop: Added Backpack");
		player setPosASL [ getPosASL player select 0, getPosASL player select 1,(getPosASL player select 2) + 2000];
		diag_log("BR Paradrop: To the moon!");
		_doSmoke = true;
		_smokeRed = "SmokeShellRed" createVehicle (position player);
		_smokeRed attachto [player, [0,0,0.5]];
		while {_doSmoke} do {
			if (((getPosATL player) select 2) < 30) then {
				_doSmoke = false;
				deleteVehicle _smokeRed;
			};
			sleep 1;
		};
	};

	onPreloadFinished {
		
		removeAllWeapons player;
		player removeWeapon "ItemRadio";
		player addWeapon "ItemGPS";
		
		0 spawn BR_PARA;

		_finallocation = [getMarkerPos "center",random 50,random 360,false] call SHK_pos;

		player setPos _finallocation;

		
		br_start_lock = [] execVM "\br_code\scripts\fn_startlock.sqf";
		0 = [50,300,200,100,100] execVM "\br_code\scripts\tpw_park.sqf";
		0 = [5,2000,15,3,1] execVM "\br_code\scripts\tpw_cars.sqf";

		_respawn = player addEventHandler ["Respawn", {[] execVM "\br_code\scripts\gameOver.sqf";}];
		_dead = player addEventHandler ["Killed", {[] execVM "\br_code\scripts\gameOver.sqf";}];
		
		onPreloadFinished {};
	};
};

[] execVM "\br_code\scripts\real_weather.sqf";