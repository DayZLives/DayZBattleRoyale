//Script by lazyink and w4ago @ zombiesspain.es

//Init Restarter
    
private ["_map","_waitForConnection","_waitForPlayers","_date1","_key","_result","_outcome","_paradropped"];

_waitForConnection = false;
while{_waitForConnection} do {
    _waitForConnection = call compile ("Arma2Net.Unmanaged" callExtension "eXchangeArmATools [initeXchangeRestarter]");
};
diag_log("BR Tools: Connected!");


//Wait for X players to start the game.
_waitForPlayers = [] execVM "\br_server\server_starter\waitForPlayers.sqf";
waitUntil {scriptDone  _waitForPlayers};

//_result = call compile ("Arma2Net.Unmanaged" callExtension "eXchangeArmATools [lockServer]");

diag_log("BR Tools: Server locked.");

if (isServer) then {
	fn_getBuildingstospawnLoot = compile preProcessFileLineNumbers "\br_server\loot\fn_LSgetBuildingstospawnLoot.sqf"; 
	LSdeleter = compile preProcessFileLineNumbers "\br_server\loot\LSdeleter.sqf";
	execVM "\br_server\loot\Lootspawner.sqf";
};

diag_log("BR Tools: Loot Spawner Started!");

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



server_spawnMV22 = compile preprocessFileLineNumbers "\br_server\loot\fn_spawn_MV22.sqf";

server_carepackagedrop = compile preprocessFileLineNumbers "\br_server\loot\fn_spawncarepackages.sqf";


[] execVM "\br_server\zones\fn_starttimer.sqf";


//Load Death Messages

[] execVM "\br_server\zones\fn_deathmessages.sqf";

//Load Bomb Script

[] execVM "\br_server\bombing\fn_startbombing.sqf";

//Bombing Settings

nul =    [
    5,        //Number of the guaranteed Loot-Piles at the Crashside
    3,        //Number of the random Loot-Piles at the Crashside 3+(1,2,3 or 4)
    (5*60),    //Fixed-Time (in seconds) between each start of a new Chopper
    (1*60),      //Random time (in seconds) added between each start of a new Chopper
    1,        //Spawnchance of the Heli (1 will spawn all possible Choppers, 0.5 only 50% of them)
    'center', //'center' Center-Marker for the Random-Crashpoints, for Chernarus this is a point near Stary
    4000,    // [106,[960.577,3480.34,0.002]]Radius in Meters from the Center-Marker in which the Choppers can crash and get waypoints
    true,    //Should the spawned crashsite burn (at night) & have smoke?
    false,    //Should the flames & smoke fade after a while?
    1,    //RANDOM WP
    1,        //GUARANTEED WP
    1        //Amount of Damage the Heli has to get while in-air to explode before the POC. (0.0001 = Insta-Explode when any damage//bullethit, 1 = Only Explode when completly damaged)
] spawn server_spawnMV22;

diag_log("BR Tools: Game Started!");
	


