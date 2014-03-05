diag_log("BR Tools: Waiting for the game to end to restart the server");
waitUntil { sleep 1; !(isNil "br_totalplayers") };
waitUntil { br_totalplayers <= 1 };
sleep 40;
[nil,nil,rTitleText,"GAME OVER: SERVER RESTARTING!", "PLAIN",10] call RE;
sleep 2;

_result = call compile ("Arma2Net.Unmanaged" callExtension "eXchangeArmATools [shutdownServer]");

diag_log("BR Tools: Server restarted");