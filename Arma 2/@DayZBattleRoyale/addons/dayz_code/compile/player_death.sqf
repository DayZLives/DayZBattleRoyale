private ["_array","_source","_kills","_killsV","_wait","_myKills","_method","_body","_id","_canHitFree","_isBandit","_myGroup"];

if (deathHandled) exitWith {};

deathHandled = true;
//Death

_body = player;
_playerID = getPlayerUID player;
disableUserInput true;


//Send Death Notice
//["PVDZ_plr_Death",[dayz_characterID,0,_body,_playerID,dayz_playerName]] call callRpcProcedure;
PVDZ_plr_Death = [dayz_characterID,0,_body,_playerID];
publicVariableServer "PVDZ_plr_Death";

_id = [player,20,true,getPosATL player] spawn player_alertZombies;

sleep 0.5;

player setDamage 1;
0.1 fadeSound 0;

player setVariable ["NORRN_unconscious", false, true];
player setVariable ["unconsciousTime", 0, true];
player setVariable ["USEC_isCardiac",false,true];
player setVariable ["medForceUpdate",true,true];
//remove combat timer on death
player setVariable ["startcombattimer", 0];
r_player_unconscious = false;
r_player_cardiac = false;

//_id = player spawn spawn_flies;

_array = _this;
if (count _array > 0) then {
	_source = _array select 0;
	_method = _array select 1;
	if (!isNull _source) then {
		if (_source != player) then {
			_canHitFree = player getVariable ["freeTarget",false];


			_wait = 0;

			if (!_canHitFree) then {
				// "humanKills" from local character is used to compute _source player "PVDZ_plr_Humanity" change
				_myKills = -1 max (1 - (player getVariable ["humanKills",0]) / 7);  // -1 (good action) to 1 (bad action)
				_wait = 300;
				_kills = _source getVariable ["humanKills",0];
				_source setVariable ["humanKills",(_kills + 1),true];
			} else {
				_wait = 0;
			};




		};
	};

	_body setVariable ["deathType",_method,true];
};

terminate dayz_musicH;
//terminate dayz_lootCheck;
terminate dayz_slowCheck;
terminate dayz_animalCheck;
terminate dayz_monitor1;
terminate dayz_medicalH;
terminate dayz_gui;
//terminate dayz_zedCheck;
terminate dayz_locationCheck;
//terminate dayz_combatCheck;
terminate dayz_spawnCheck;

//Reset (just in case)
//deleteVehicle dayz_playerTrigger;
//disableUserInput false;
r_player_dead = true;

"dynamicBlur" ppEffectEnable true;"dynamicBlur" ppEffectAdjust [4]; "dynamicBlur" ppEffectCommit 0.2;

"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.01],  [1, 1, 1, 0.0]];
"colorCorrections" ppEffectCommit 1;

//Player is Dead!
3 fadeSound 0;
0 cutText ["", "BLACK",10];
dayz_DeathActioned = true;
sleep 1;

TitleText[localize "str_player_12","PLAIN DOWN",5];

dayz_originalPlayer enableSimulation true;

addSwitchableUnit dayz_originalPlayer;
setPlayable dayz_originalPlayer;
selectPlayer dayz_originalPlayer;

_myGroup = group _body;
[_body] joinSilent dayz_firstGroup;
deleteGroup _myGroup;

3 cutRsc ["default", "PLAIN",3];
4 cutRsc ["default", "PLAIN",3];

_body setVariable["combattimeout", 0, true];

//["dayzFlies",player] call broadcastRpcCallAll;
sleep 2;

1 cutRsc ["dsbr","BLACK OUT",3];

playMusic "dayz_track_death_1";

"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5;
"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5;
sleep 5;
disableUserInput false;
player setVariable ["USEC_isOver",true,true];
sleep 1;

