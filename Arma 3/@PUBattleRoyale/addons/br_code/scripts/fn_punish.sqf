// Script by Wa4go & lazyink. Please request permission for use!

private ["_damage","_isPlayerOutside","_finishPos","_zone","_punishDamage"];

fnc_br_delete_punishment = {

	["YOU ARE BACK IN THE ZONE!",0,0.7,10,0] spawn bis_fnc_dynamictext;

};

waitUntil{br_zone_started};

while {true} do {

    _finishPos = getMarkerPos "playArea";
    _zone = zoneSize;
    _isPlayerOutside = player distance _finishPos > _zone;
	_punishDamage = 0.05;
	    
    //If the player is outside then warn him
    if(_isPlayerOutside) then {
        
        
        
		["YOU ARE OUTSIDE THE PLAY AREA. YOU HAVE 30 SECONDS TO RETURN!",0,0.7,10,0] spawn bis_fnc_dynamictext;
		sleep 5;
        ["IF YOU ARE IN A VEHICLE, IT WILL EXPLODE!",0,0.7,10,0] spawn bis_fnc_dynamictext;
		sleep 5;
        ["YOU WILL ALSO TAKE DAMAGE FOR EVERY 20 SECONDS YOU REMAIN OUTSIDE!",0,0.7,10,0] spawn bis_fnc_dynamictext;
        sleep 30;
        
        //If the player is still outside then punish him
        _isPlayerOutside = player distance _finishPos > _zone;
        if(_isPlayerOutside) then {
			["YOU ARE STILL OUTSIDE THE PLAY AREA! MOVE BACK INSIDE NOW!",0,0.7,10,0] spawn bis_fnc_dynamictext;                        
			_damage = getDammage player;
			player setDammage (_damage + _punishDamage);
			(vehicle player) setHitPointDamage ["hitEngine2", 1.0];
			(vehicle player) setHitPointDamage ["hitFuel", 1.0];
			sleep 20;
			
			
        } else {            
            [] call fnc_br_delete_punishment;
        };
        
        sleep 10;
    };
};