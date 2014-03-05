// Script by Wa4go & lazyink. Please request permission for use!


private ["_finishPos","_zone","_isPlayerOutside"];


br_punishmentZ_max = 30;
br_punishmentZ_count = 0;
br_punishmentZs = [];

DayZ_ViralZeds = ["z_hunter","z_teacher","z_suit1","z_suit2","z_worker1","z_worker2","z_worker3","z_villager1","z_villager2","z_villager3","z_priest","z_soldier_pilot","z_soldier_heavy","z_doctor","z_policeman"];

fnc_br_spawn_punishment = {
    
    private ["_campPos","_radius","_method","_type","_agent1","_id","_counter","_amount"];
    _amount = 30;
    _counter = 0;
    
    if(br_punishmentZ_count < br_punishmentZ_max) then {
        
        while {_counter < _amount} do {
            
            _campPos = (getPos player);
            _radius = 5;
            _method = "NONE";
            _type = DayZ_ViralZeds call BIS_fnc_selectRandom;
            _agent1 = createAgent [_type, _campPos, [], _radius, _method];
            _id = [_campPos,_agent1] execFSM "\z\addons\dayz_code\system\zombie_agent.fsm";
            _counter = _counter + 1;
            br_punishmentZ_count = br_punishmentZ_count + 1;
            br_punishmentZs set [count br_punishmentZs, _agent1];
            sleep 1;
        };
        
    };
};


fnc_br_delete_punishment = {
    
    {deletevehicle _x;} foreach br_punishmentZs;
    br_punishmentZ_count = 0;
    titleText ["YOU ARE BACK IN THE ZONE!", "PLAIN"];
};


waitUntil{br_zone_started};


while {true} do {
    _finishPos = getMarkerPos "playArea";
    _zone = zoneSize;
    _car = vehicle player;
    _isPlayerOutside = player distance _finishPos > _zone;
	_punishblood = 600;
	
    
    //If the player is outside then warn him
    if((_isPlayerOutside) && (side player == west)) then {
        
        titleText ["YOU ARE OUTSIDE THE PLAY AREA. YOU HAVE 30 SECONDS TO RETURN!", "PLAIN"];
		sleep 5;
        titleText ["IF YOU ARE IN A VEHICLE, THE ENGINE WILL BLOW!", "PLAIN"];
		sleep 5;
        titleText ["YOU WILL ALSO LOSE 600 BLOOD FOR EVERY 20 SECONDS YOU REMAIN OUTSIDE!", "PLAIN"];
        sleep 30;
        
        //If the player is still outside then punish him
        _isPlayerOutside = player distance _finishPos > _zone;
        if(_isPlayerOutside) then {
            titleText ["YOU ARE STILL OUTSIDE THE PLAY AREA! MOVE BACK INSIDE NOW!", "PLAIN"];
                        
			r_player_blood = r_player_blood - _punishblood;
			player setVariable["USEC_BloodQty",r_player_blood,true];
			_car setHit ["motor", 1];
			_car setHit ["engine", 1];
			[] spawn fnc_br_spawn_punishment;
			sleep 18;
			
			
        } else {            
            [] call fnc_br_delete_punishment;
        };
        
        sleep 10;
    };
    
};