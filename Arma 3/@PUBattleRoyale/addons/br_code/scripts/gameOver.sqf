private ["_spectators","_playerID"];

_spectators = ["76561198025631899","76561197995079340","76561198045918474","76561197966985049"];
_playerID = getPlayerUID player;

if (_playerID in _spectators) then {
    
    ["LOADING SPECTATOR MENU",0,0.7,10,0] spawn bis_fnc_dynamictext;
	
	hideObject player;
	setGroupIconsVisible [true, true];
	player exec "camera.sqs";
	//["Paste",["Stratis",getPos player,getDir player,0.7,[0,0],0,0,855.569,0.3,1]] call bis_fnc_camera;
    
	} else {
    
    ["THANKS FOR PLAYING BATTLE ROYALE: STRATIS",0,0.7,10,0] spawn bis_fnc_dynamictext;
    sleep 5;    
    player setVariable ["PUBR_isover",true,true];
    
};

