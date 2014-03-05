private ["_channelDisplay","_text","_channel"];
disableSerialization;
_channelDisplay = findDisplay 63;

while{br_blockVOIP} do {
    if( !isNull _channelDisplay) then {
        _text = _channelDisplay displayCtrl 101;
        _channel = ctrlText _text;
        if( _channel == localize "STR_SIDE_CHANNEL" ) then {
            [60,5] call fnc_usec_pitchWhine; //60 - Itensity (whine sound)  15 - Seconds  it lasts
            [] spawn
            {
                playSound "explosionlarge_1"; //Built in sounds @ http://pastebin.com/Lcx6W0Nn
                playSound "explosionlarge_1"; // Playing the sound multiple times at once increases the volume of the sound.
                disableUserInput true;
                sleep 1;
                disableUserInput false;
            };
            cutText ['NO VOICE INSIDE THE BARN! THANKS!','PLAIN DOWN',25];
            
            dayz_lastCheckBit = time;
            [player,15,true,(getPosATL player)] spawn player_alertZombies;
        };
    };
};