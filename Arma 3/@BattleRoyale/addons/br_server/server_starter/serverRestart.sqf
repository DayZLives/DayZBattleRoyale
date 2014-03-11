diag_log("BR Tools: Waiting for the game to end to restart the server");
waitUntil { sleep 1; !(isNil "br_totalplayers") };
waitUntil { br_totalplayers <= 1 };
sleep 40;
[["GAME OVER: SERVER RESTARTING!",0,0.7,1,0],"BIS_fnc_dynamicText",nil,true] spawn BIS_fnc_MP;
sleep 2;

//_result = call compile ("Arma2Net.Unmanaged" callExtension "eXchangeArmATools [shutdownServer]");

diag_log("BR Tools: Server restarted");