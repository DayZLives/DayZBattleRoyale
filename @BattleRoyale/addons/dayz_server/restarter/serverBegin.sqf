//Script by lazyink and w4ago @ zombiesspain.es

//Init Restarter
    
private ["_waitForConnection","_waitForPlayers","_date1","_key","_result","_outcome"];

_waitForConnection = false;
while{_waitForConnection} do {
    _waitForConnection = call compile ("Arma2Net.Unmanaged" callExtension "eXchangeRestarter [initeXchangeRestarter]");
};
diag_log("Restarter: Connected");

//Wait for X players to start the game.
_waitForPlayers = [] execVM "z\addons\dayz_server\restarter\waitForPlayers.sqf";
waitUntil {scriptDone  _waitForPlayers};
diag_log("Restarter: Game Started.");

//Set the Time

_key = "CHILD:307:";
_result = _key call server_hiveReadWrite;
_outcome = _result select 0;

if(_outcome == "PASS") then {
    //Force full moon nights
    _date1 = [2013,8,3,17,30];
    
    if(isDedicated) then {
        setDate _date1;
        dayzSetDate = _date1;
        dayz_storeTimeDate = _date1;
        publicVariable "dayzSetDate";
    };
    diag_log ("HIVE: Local Time set to " + str(_date1));
};

//Start the clock

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

server_spawnC130 = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\spawn_C130.sqf"; 
server_carepackagedrop = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\spawn_carepackages.sqf";

//Load Master Timer

[] execVM "\z\addons\dayz_server\zones\fn_starttimer.sqf";

//Load Death Messages

[] execVM "\z\addons\dayz_server\zones\fn_deathmessages.sqf";

//Load Bomb Script

[] execVM "\z\addons\dayz_server\compile\fn_startbombers.sqf";

//Bombing Settings

nul =    [
    6,        //Number of the guaranteed Loot-Piles at the Crashside
    4,        //Number of the random Loot-Piles at the Crashside 3+(1,2,3 or 4)
    (5*60),    //Fixed-Time (in seconds) between each start of a new Chopper
    (2*60),      //Random time (in seconds) added between each start of a new Chopper
    1,        //Spawnchance of the Heli (1 will spawn all possible Choppers, 0.5 only 50% of them)
    'center', //'center' Center-Marker for the Random-Crashpoints, for Chernarus this is a point near Stary
    4000,    // [106,[960.577,3480.34,0.002]]Radius in Meters from the Center-Marker in which the Choppers can crash and get waypoints
    true,    //Should the spawned crashsite burn (at night) & have smoke?
    false,    //Should the flames & smoke fade after a while?
    1,    //RANDOM WP
    2,        //GUARANTEED WP
    1        //Amount of Damage the Heli has to get while in-air to explode before the POC. (0.0001 = Insta-Explode when any damage//bullethit, 1 = Only Explode when completly damaged)
] spawn server_spawnC130;
	


