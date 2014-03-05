//Code by w4ago @ zombiesspain.es

private ["_continue","_numPlayers","_timeCount","_numberOfPlayersToStart","_maxPlayers","_result"];
_continue = true;
_numberOfPlayersToStart = 20;
_maxPlayers = 42;


fnc_br_numberOfPlayers = {
    private ["_count"];
    _count = 0;
    {
        if(isplayer _x && alive _x) then {

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
    
        [nil,nil,rTitleText,format["WAITING FOR %1 PLAYERS TO START THE ROUND! VOIP/VOICE COMMS IN THE START AREA MAY CAUSE THE SERVER TO LAG OUT OR CRASH SO PLEASE DON'T ABUSE IT!",_numberOfPlayersToStart], "PLAIN",10] call RE;
        _timeCount = 0;
    };
    
    _timeCount = _timeCount +1;
    sleep 1;
};

[nil,nil,rTitleText,"MIN PLAYER COUNT REACHED. ROUND STARTING!", "PLAIN",10] call RE;
diag_log("BR Tools: Player minimum reached.");
_continue = true;
_timeCount = 0;
while{_continue} do {
    _numPlayers = [] call fnc_br_numberOfPlayers;
    if(_timeCount == 10) then {[nil,nil,rTitleText,"30 SECONDS!", "PLAIN",10] call RE;};
    if(_timeCount == 25) then {[nil,nil,rTitleText,"20 SECONDS!", "PLAIN",10] call RE;};
    if(_timeCount == 30 or _numPlayers == _maxPlayers) then {
        _continue = false;
    };
    _timeCount = _timeCount +1;
    sleep 1;
};


sleep 1;




