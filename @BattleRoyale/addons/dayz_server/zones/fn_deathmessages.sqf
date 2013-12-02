// Script by lazyink & infiSTAR. Please request permission for use!       
[] spawn {
    private ["_time","_finish_time_minutes","_br_totalplayers","_txt"];
    _br_totalplayers_start = {alive _x} count playableUnits;
    
    while {ELAPSED_TIME < END_TIME} do
    {
        _time = END_TIME - ELAPSED_TIME;
        _finish_time_minutes = floor(_time / 60);
        if (_br_totalplayers_start != {alive _x} count playableUnits) then
        {
            _br_totalplayers = {alive _x} count playableUnits;
            _txt = format["\n%1 DEAD, %2 TO GO!",(_br_totalplayers_start - _br_totalplayers),_br_totalplayers];
            [nil, nil, rTitleText, _txt, "PLAIN"] call RE;
        };
       
        if ((_br_totalplayers == 1) && (isNil "WinnerShown")) then
        {
            _txt = format["\n%1 - WINNER, WINNER, CHICKEN DINNER!",name player];
            [nil, nil, rTitleText, _txt, "PLAIN"] call RE;
            WinnerShown = true;
            sleep 20;
            _result = call compile ("Arma2Net.Unmanaged" callExtension "eXchangeRestarter [restartServer]");
        };
        sleep 1;
    };
};