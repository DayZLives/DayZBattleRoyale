//Code by w4ago @ zombiesspain.es

private ["_continue","_numPlayers","_timeCount","_numberOfPlayersToStart","_maxPlayers","_result"];
_continue = true;
_numberOfPlayersToStart = 15;
_maxPlayers = 43;


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
    if(_timeCount == 50) then {
    
        [nil,nil,rTitleText,format["Waiting for at least %1 players to start the round. Please be patient! And please, don't abuse VOIP in the barn! Thanks!",_numberOfPlayersToStart], "PLAIN",10] call RE;
        _timeCount = 0;
    };
    
    _timeCount = _timeCount +1;
    sleep 1;
};

[nil,nil,rTitleText,"Minimum player count reached. The game will begin in 60 seconds!", "PLAIN",10] call RE;
diag_log("Restarter: Player limit reached");
_continue = true;
_timeCount = 0;
while{_continue} do {
    _numPlayers = [] call fnc_br_numberOfPlayers;
    if(_timeCount == 30) then {[nil,nil,rTitleText,"The round will begin in 60 seconds.", "PLAIN",10] call RE;};
    if(_timeCount == 45) then {[nil,nil,rTitleText,"The round will begin in 30 seconds.", "PLAIN",10] call RE;};
    
    if(_timeCount == 50 or _numPlayers == _maxPlayers) then {
        _continue = false;
    };
    _timeCount = _timeCount +1;
    sleep 1;
};


sleep 1;

_result = call compile ("Arma2Net.Unmanaged" callExtension "eXchangeRestarter [lockServer]");

sleep 5;


