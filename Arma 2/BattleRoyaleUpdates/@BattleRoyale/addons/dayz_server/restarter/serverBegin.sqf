//Script by lazyink and w4ago @ zombiesspain.es

//Init Restarter
    
private ["_map","_waitForConnection","_waitForPlayers","_date1","_key","_result","_outcome"];

_waitForConnection = false;
while{_waitForConnection} do {
    _waitForConnection = call compile ("Arma2Net.Unmanaged" callExtension "eXchangeArmATools [initeXchangeRestarter]");
};
diag_log("BR Tools: Connected!");


//Wait for X players to start the game.
_waitForPlayers = [] execVM "z\addons\dayz_server\restarter\waitForPlayers.sqf";
waitUntil {scriptDone  _waitForPlayers};

_result = call compile ("Arma2Net.Unmanaged" callExtension "eXchangeArmATools [lockServer]");

diag_log("BR Tools: Server locked.");
diag_log("BR Tools: Game Started!");

//Start the clock

_map = worldName;

[] spawn {
    ELAPSED_TIME  = 0;
    START_TIME = diag_tickTime;
    while {ELAPSED_TIME < END_TIME} do 
    {
        ELAPSED_TIME = diag_tickTime - START_TIME;
        publicVariable "ELAPSED_TIME";
        sleep 1;
    };
};	

//Load Care Packages

server_spawnC130 = compile preprocessFileLineNumbers format ["\z\addons\dayz_server\compile\%1_spawn_C130.sqf",_map];

server_carepackagedrop = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\spawn_carepackages.sqf";

//Change weather

drn_DynamicWeather_CurrentWeatherChange = "OVERCAST";

//Spawn backpacks
call compile preProcessFileLineNumbers format ["\z\addons\dayz_server\backpacks\%1_placebackpacks.sqf",_map];

//Load Master Timer

[] execVM format ["\z\addons\dayz_server\zones\%1_fn_starttimer.sqf",_map];

//Load Death Messages

[] execVM "\z\addons\dayz_server\zones\fn_deathmessages.sqf";

//Load Bomb Script

[] execVM format ["\z\addons\dayz_server\compile\%1_fn_startbombers.sqf",_map];

//Bombing Settings

nul =    [
    5,        //Number of the guaranteed Loot-Piles at the Crashside
    3,        //Number of the random Loot-Piles at the Crashside 3+(1,2,3 or 4)
    (5*60),    //Fixed-Time (in seconds) between each start of a new Chopper
    (1*60),      //Random time (in seconds) added between each start of a new Chopper
    1,        //Spawnchance of the Heli (1 will spawn all possible Choppers, 0.5 only 50% of them)
    'center', //'center' Center-Marker for the Random-Crashpoints, for Chernarus this is a point near Stary
    3000,    // [106,[960.577,3480.34,0.002]]Radius in Meters from the Center-Marker in which the Choppers can crash and get waypoints
    true,    //Should the spawned crashsite burn (at night) & have smoke?
    false,    //Should the flames & smoke fade after a while?
    1,    //RANDOM WP
    1,        //GUARANTEED WP
    1        //Amount of Damage the Heli has to get while in-air to explode before the POC. (0.0001 = Insta-Explode when any damage//bullethit, 1 = Only Explode when completly damaged)
] spawn server_spawnC130;
	


