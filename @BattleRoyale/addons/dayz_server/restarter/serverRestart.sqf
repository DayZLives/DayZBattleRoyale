diag_log("Restarter: Waiting for the game to end to restart the server");

waitUntil{!(isNil "br_totalplayers")};

waitUntil{br_totalplayers <= 1};

    
    sleep 120;
    [nil,nil,rTitleText,"GAME OVER: SERVER RESTARTING!", "PLAIN",10] call RE;
    sleep 5;
    
    _result = call compile ("Arma2Net.Unmanaged" callExtension "eXchangeRestarter [restartServer]");
    diag_log("Restarter: Server restarted");
    sleep 10;
    _result = call compile ("Arma2Net.Unmanaged" callExtension "eXchangeRestarter [restartServer]");
    diag_log("Restarter: Just making sure!");

