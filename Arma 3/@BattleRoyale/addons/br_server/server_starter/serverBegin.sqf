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

_result = call compile ("Arma2Net.Unmanaged" callExtension "eXchangeArmATools [lockServer]");

diag_log("BR Tools: Server locked.");

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

[] execVM "\br_server\zones\fn_starttimer.sqf";

//Load Death Messages

[] execVM "\br_server\zones\fn_deathmessages.sqf";

//Load Bomb Script

[] execVM "\br_server\bombing\fn_startbombing.sqf";

//Bombing Settings

diag_log("BR Tools: Game Started!");
	


