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


	onPreloadFinished {
		
		removeAllWeapons player;
		player removeWeapon "ItemRadio";
		player addWeapon "ItemGPS";

		_finallocation = [getMarkerPos "center",random 50,random 360,false] call SHK_pos;

		player setPos _finallocation;

		
		//br_start_lock = [] execVM "\br_code\scripts\fn_startlock.sqf";
		0 = [50,300,200,100,100] execVM "\br_code\scripts\tpw_park.sqf";
		0 = [5,2000,15,3,1] execVM "\br_code\scripts\tpw_cars.sqf";

		_respawn = player addEventHandler ["Respawn", {[] execVM "\br_code\scripts\gameOver.sqf";}];
		_dead = player addEventHandler ["Killed", {[] execVM "\br_code\scripts\gameOver.sqf";}];
		
		onPreloadFinished {};
	};
};

[] execVM "\br_code\scripts\real_weather.sqf";