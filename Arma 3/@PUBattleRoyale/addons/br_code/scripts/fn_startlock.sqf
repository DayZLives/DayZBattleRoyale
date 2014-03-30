private ["_currentPos","_initialPos"];
//By W4rGo - ZSPA
 
_initialPos = position player;


while{!br_game_started} do {
	
	
    _currentPos = position player;
   
    if (_initialPos distance _currentPos > 50) then {
		
        player setpos _initialPos;
    };
    sleep 5;
 
 
};