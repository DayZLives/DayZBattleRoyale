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

//Load Master Timer

[] execVM format ["\z\addons\dayz_server\zones\%1_fn_starttimer.sqf",_map];

//Load Death Messages

[] execVM "\z\addons\dayz_server\zones\fn_deathmessages.sqf";

//Load Bomb Script

[] execVM format ["\z\addons\dayz_server\compile\%1_fn_startbombers.sqf",_map];


diag_log("BR Tools: Game Started.");

sleep 10;

_result = call compile ("Arma2Net.Unmanaged" callExtension "eXchangeArmATools [lockServer]");

diag_log("BR Tools: Server locked.");




	


