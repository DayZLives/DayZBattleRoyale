//Code by w4ago @ zombiesspain.es

private ["_continue","_numPlayers","_timeCount","_numberOfPlayersToStart","_maxPlayers","_result"];
_continue = true;
_numberOfPlayersToStart = 1;
_maxPlayers = 42;


fnc_br_numberOfPlayers = {
    private ["_count"];
    _count = 0;
    {
        if(isplayer _x && alive _x && (str(side _x) == "GUER")) then {

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
    
    _timeCount = _timeCount +1;
    sleep 1;
};

diag_log("BR Tools: Player minimum reached.");
_continue = true;
_timeCount = 0;
while{_continue} do {
    _numPlayers = [] call fnc_br_numberOfPlayers;
    if(_timeCount == 5) then {[["MINIMUM PLAYER COUNT REACHED!",0,0.7,5,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;};
    if(_timeCount == 10 or _numPlayers == _maxPlayers) then {
        _continue = false;
    };
    _timeCount = _timeCount +1;
    sleep 1;
};


sleep 1;




