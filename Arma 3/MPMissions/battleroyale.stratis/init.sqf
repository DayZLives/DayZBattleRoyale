private ["_serverMonitor","_id1","_br_start_lock"];

enableSaving [false,false];
END_TIME = 4500;

//Load in compiled functions
call compile preprocessFileLineNumbers "\br_code\init\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "\br_code\init\compiles.sqf";					//Compile regular functions
progressLoadingScreen 1.0;
call compile preprocessFileLineNumbers "\br_code\scripts\shk_pos\shk_pos_init.sqf";					//Compile random marker position


if (isServer) then {
	_serverMonitor = [] execVM "\br_server\system\server_monitor.sqf";	
};

[] execVM "\br_code\scripts\real_weather.sqf";

if (!isDedicated) then {
	waitUntil {!isNull player};
	player setVariable ["BIS_noCoreConversations", true];
	player disableConversation true;
	player enableFatigue false;
	enableRadio false;
	enableSentences false;
	showSubtitles false;
	0 fadeRadio 0;
	
	
	call compile preProcessFileLineNumbers "\br_code\scripts\fn_playercheck.sqf";	
	
	// this must be execVM as it has waituntil and sleeps
	_id1 = [] execVM "\br_code\scripts\fn_punish.sqf";
	
	BR_PARA = {
		setDate br_date;
		br_deploy_players = false;
		waitUntil {br_deploy_players};
		player allowDamage false;
		player addBackpack "B_Parachute";
		player addWeapon "ItemGPS";	
		player action ["EJECT", vehicle player];
		_doSmoke = true;
		_smokeColor = ["SmokeShellRed","SmokeShellPurple","SmokeShellYellow","SmokeShellBlue","SmokeShell","SmokeShellGreen","SmokeShellOrange"] call BIS_fnc_selectRandom;
		_smoke = _smokeColor createVehicle (position player);
		_smoke attachto [player, [0,0,0.5]];
	    while {_doSmoke} do {
			if (((getPosATL player) select 2) < 30) then {
				_doSmoke = false;
				deleteVehicle _smoke;
				player allowDamage true;
			};
		};
	};

	onPreloadFinished {
		
		removeAllWeapons player;
		player removeWeapon "ItemRadio";

		_group = createGroup west;
		player joinAsSilent [_group, 1];	
			
		_finallocation = [getMarkerPos "start",random 8,random 360,false] call SHK_pos;
	
		player setPos _finallocation;

		0 spawn BR_PARA;
		
		//br_start_lock = [] execVM "\br_code\scripts\fn_startlock.sqf";

		_respawn = player addEventHandler ["Respawn", {[] execVM "\br_code\scripts\gameOver.sqf";}];
		_dead = player addEventHandler ["Killed", {[] execVM "\br_code\scripts\gameOver.sqf";}];
		
		onPreloadFinished {};
	};
};

