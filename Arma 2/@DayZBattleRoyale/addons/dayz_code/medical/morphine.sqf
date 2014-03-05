// bleed.sqf
_unit = (_this select 3) select 0;

player removeMagazine "ItemMorphine";

_unit setVariable ["hit_legs",0];
_unit setVariable ["hit_hands",0];

call fnc_usec_medic_removeActions;
r_action = false;

if (vehicle player == player) then {
	//not in a vehicle
	player playActionNow "Medic";
};
r_interrupt = false;
_animState = animationState player;
r_doLoop = true;
_started = false;
_finished = false;
while {r_doLoop} do {
	_animState = animationState player;
	_isMedic = ["medic",_animState] call fnc_inString;
	if (_isMedic) then {
		_started = true;
	};
	if (_started and !_isMedic) then {
		r_doLoop = false;
		_finished = true;
	};
    _skillMedical    = [player,"Medical"] call DZU_fnc_getVariable;
	if ((random 10 < 3) and (_skillMedical < 60)) then {
         _biotic_level = [player,"biotics"] call DZU_fnc_getVariable;
      if(_biotic_level==0)then{
        r_player_infected = true;
        player setVariable["USEC_infected",true,true];          
      };
	};
	
	if (r_interrupt) then {
		r_doLoop = false;
	};
	sleep 0.1;
};
r_doLoop = false;

if (_finished) then {
	if (_unit == player) then {
		//Self Healing
		_id = [player,player] execVM "\z\addons\dayz_code\medical\publicEH\medMorphine.sqf";
	} else {
		//PVDZ_plr_Humanity = [player,50];
		//[player,50] call player_humanityChange;
	};

	//["PVDZ_hlt_Morphine",[_unit,player]] call broadcastRpcCallAll;
	PVDZ_hlt_Morphine = [_unit,player];
	publicVariable "PVDZ_hlt_Morphine";
	
	
	[nil, nil, rSPAWN, _unit, { if !(local _this) exitWith {}; 
	_i = 0;
				_drugeffects = 0;
				scopeName "drugeffect";
				hint "You are under the effects of morphine";
		
				for "_i" from 0 to 4 step 1 do {
					nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
					nonapsi_ef ppEffectEnable true;
					nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.03, [0.0, 0.0, 0.0, 0.0], [3.0, 5.0, 9.0, 5.0],[0.4,0.0,0.0, 0.7]];
					nonapsi_ef ppEffectCommit 1;

					sleep 3;

					nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
					nonapsi_ef ppEffectEnable true;
					nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.03, [0.0, 0.0, 0.0, 0.0], [3.0, 5.0, 9.0, 5.0],[0.4,0.0,0.0, 0.7]];
					nonapsi_ef ppEffectCommit 1;

					sleep 1;

					nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
					nonapsi_ef ppEffectEnable true;
					nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.03, [0.0, 0.0, 0.0, 0.0], [3.0, 5.0, 9.0, 5.0],[0.4,0.0,0.0, 0.7]];
					nonapsi_ef ppEffectCommit 1;

					sleep 5;
					
				}; 
				_drugeffects = 1;
				nonapsi_ef ppEffectEnable false;

		}] call RE;
		//[player,1,3] call player_variableChange; //1,engineer:2,hunter:3,medic:4,soldier
        [player,"Generic_Medical"] call DZU_fnc_giveEXP;        
} else {
	player addMagazine "ItemMorphine";
	r_interrupt = false;
	[objNull, player, rSwitchMove,""] call RE;
	player playActionNow "stop";
};