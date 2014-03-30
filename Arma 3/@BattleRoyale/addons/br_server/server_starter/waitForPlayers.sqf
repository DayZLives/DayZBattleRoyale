//Code by w4ago @ zombiesspain.es

private ["_continue","_numPlayers","_timeCount","_numberOfPlayersToStart","_maxPlayers","_result"];
_continue = true;
_numberOfPlayersToStart = 10;
_maxPlayers = 42;


fnc_br_numberOfPlayers = {
    private ["_count"];
    _count = 0;
    {
        if(isplayer _x && alive _x && (side _x) == west) then {

            _count =_count + 1;
        };
    } foreach playableUnits;
    _count;
};


//Wait for players
_timeCount = 0;
while{_continue} do {
    _numPlayers = [] call fnc_br_numberOfPlayers;
    if(_numPlayers >= _numberOfPlayersToStart ) then {
        _continue = false;
    };
    if(_timeCount == 30) then {
		
		_nop = _numberOfPlayersToStart - _numPlayers;
		_txt = format["WAITING FOR %1 MORE PLAYERS TO START THE ROUND. PLEASE BE PATIENT",_nop];
		[[ _txt,0,0.7,10,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
        _timeCount = 0;
    };
    if (diag_tickTime >= 1800) then {
		[["SERVER RESTARTING DUE TO INSUFFICENT PLAYERS AFTER 40 MINUTES. THIS IS TO TRY PREVENT HUNG SERVERS. THANKS",0,0.7,5,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
		sleep 10;
		_result = call compile ("Arma2Net.Unmanaged" callExtension "eXchangeArmATools [shutdownServer]");
	};
    _timeCount = _timeCount +1;
    sleep 1;
};

diag_log("BR Tools: Player minimum reached.");
_continue = true;
_timeCount = 0;
while{_continue} do {

	diag_log("BR Tools: Start loading scripts");
	
    _numPlayers = [] call fnc_br_numberOfPlayers;
	
    if(_timeCount == 5) then {[["MINIMUM PLAYER COUNT REACHED!",0,0.7,10,1],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;};
	
    if(_timeCount == 10) then {[["LOADING LOOT...",0,0.7,5,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;};
	
    if(_timeCount == 20) then {
	
		[["LOADING VEHICLES...",0,0.7,5,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
		
		//[] execVM "\br_server\server_starter\fn_spawn_C130.sqf";
		
		//0 spawn server_spawnC130;
		
		diag_log("BR Tools: Loaded C130J");
			
	};
	
    if(_timeCount == 30) then {
	
		[["LOADING CAREPACKAGES...",0,0.7,5,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
		
		server_spawnMV22 = compile preprocessFileLineNumbers "\br_server\loot\fn_spawn_MV22.sqf";

		server_carepackagedrop = compile preprocessFileLineNumbers "\br_server\loot\fn_spawncarepackages.sqf";

		
		nul =    [
			5,        //Number of the guaranteed Loot-Piles at the Crashside
			3,        //Number of the random Loot-Piles at the Crashside 3+(1,2,3 or 4)
			(5*60),    //Fixed-Time (in seconds) between each start of a new Chopper
			(2*60),      //Random time (in seconds) added between each start of a new Chopper
			1,        //Spawnchance of the Heli (1 will spawn all possible Choppers, 0.5 only 50% of them)
			'center', //'center' Center-Marker for the Random-Crashpoints, for Chernarus this is a point near Stary
			4000,    // [106,[960.577,3480.34,0.002]]Radius in Meters from the Center-Marker in which the Choppers can crash and get waypoints
			true,    //Should the spawned crashsite burn (at night) & have smoke?
			false,    //Should the flames & smoke fade after a while?
			1,    //RANDOM WP
			3,        //GUARANTEED WP
			1        //Amount of Damage
		] spawn server_spawnMV22; 
		
		
		diag_log("BR Tools: Loaded MV-22");
	};
	
    if(_timeCount == 40) then {
	
		[["LOADING TOWER GUARDS..",0,0.7,5,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
		
		//[] execVM "\br_server\AI\fn_spawnSnipers.sqf";

	};
	
    if(_timeCount == 50 or _numPlayers == _maxPlayers) then {
        _continue = false;
    };
	
    _timeCount = _timeCount +1;
    sleep 1;
};
