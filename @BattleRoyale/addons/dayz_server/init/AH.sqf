#include "AHconfig.sqf"
/* ********************************************************************************* */
/* *********************************www.infiSTAR.de********************************* */
/* *******************Developer : infiSTAR (infiSTAR23@gmail.com)******************* */
/* ********************Copr. ©2013 infiSTAR all rights reserved********************* */
/* *********************************09122013V00318********************************** */
/* ********************************************************************************* */
waituntil {!isnil 'bis_fnc_init'};
markerText = 'STRING';markerColor = 'STRING';markerBrush = 'STRING';
BattleFieldClearance = 'STRING';publicVariable 'BattleFieldClearance';
loadFile = 'STRING';publicVariable 'loadFile';
rcallVarcode = 'STRING';publicVariable 'rcallVarcode';
addTeamMember = 'STRING';publicVariable 'addTeamMember';
removeTeamMember = 'STRING';publicVariable 'removeTeamMember';
saveStatus = 'STRING';publicVariable 'saveStatus';
loadStatus = 'STRING';publicVariable 'loadStatus';
saveVar = 'STRING';publicVariable 'saveVar';
createTeam = 'STRING';publicVariable 'createTeam';
[] spawn {
	BIS_MPF_logic = 'STRING';publicVariable 'BIS_MPF_logic';
	BIS_MPF_dummygroup = 'STRING';publicVariable 'BIS_MPF_dummygroup';
};
if ((preProcessFileLineNumbers ("low_admins.sqf")) != "") then {
	_tmpLA = call compile preProcessFileLineNumbers "low_admins.sqf";
	_LowLevel_List = _LowLevel_List + _tmpLA;
};
if ((preProcessFileLineNumbers ("normal_admins.sqf")) != "") then {
	_tmpNA = call compile preProcessFileLineNumbers "normal_admins.sqf";
	_NormalLevel_List = _NormalLevel_List + _tmpNA;
};
if ((preProcessFileLineNumbers ("super_admins.sqf")) != "") then {
	_tmpSA = call compile preProcessFileLineNumbers "super_admins.sqf";
	_SuperLevel_List = _SuperLevel_List + _tmpSA;
};
if ((preProcessFileLineNumbers ("blacklist.sqf")) != "") then {
	_tmpBL = call compile preProcessFileLineNumbers "blacklist.sqf";
	_BLOCKED = _BLOCKED + _tmpBL;
	_BLOCKED
};
_admnlist = _LowLevel_List + _NormalLevel_List + _SuperLevel_List;
_fnc_RandomGen =
{
	_arr = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","1","2","3","4","5","6","7","8","9","0"];
	_gen = "PV_";
	for "_i" from 1 to 6 do {_gen = _gen + (_arr select (random ((count _arr)-1)));};
	_gen
};
_randvar0 = call _fnc_RandomGen;
_randvar1 = call _fnc_RandomGen;
_randvar2 = call _fnc_RandomGen;
_randvar3 = call _fnc_RandomGen;
_randvar4 = call _fnc_RandomGen;
_randvar5 = call _fnc_RandomGen;
_randvar6 = call _fnc_RandomGen;
_randvar8 = call _fnc_RandomGen;
_randvar9 = call _fnc_RandomGen;
_randvar10 = call _fnc_RandomGen;
_randvar12 = call _fnc_RandomGen;
_randvar13 = call _fnc_RandomGen;
_randvar19 = call _fnc_RandomGen;
_randvar26 = call _fnc_RandomGen;
_randvar27 = call _fnc_RandomGen;
_randvar27a = call _fnc_RandomGen;
_randvar28 = call _fnc_RandomGen;
diag_log ("infiSTAR.de ProPlan by infiSTAR.de - AntiHack Loading...");
_randvar10 = 'PVAHR_'+(str(round(random 999999)));_randvar12 = 'PVAHR_'+(str(round(random 999999)));
PV_hackerL0og = [['']];PublicVariable 'PV_hackerL0og';PV_SurveillanceLog = [['']];PublicVariable 'PV_SurveillanceLog';
_debugPos = getMarkerpos 'respawn_west';
if (_UVC) then {
	[_ALLOWED_Vehicles,_FORBIDDEN_Vehicles,_UVW,_UVC] spawn {
		_allowedVeh = _this select 0;
		_forbiddenVeh = _this select 1;
		_UVW = _this select 2;
		_vehicleCheck = _this select 3;
		_checked = [];
		if (_vehicleCheck) then
		{
			while {1 == 1} do
			{
				_tmpVeh = ([0,0,0] nearEntities [['Air','Ship','LandVehicle'], 10000000]);
				_veh = _tmpVeh - _checked;
				{
					if (!isNull _x) then
					{
						_checked = _checked + [_x];
						if ((!(typeOf _x in _allowedVeh) && (_UVW)) || (typeOf _x in _forbiddenVeh)) then {deleteVehicle _x;};
					};
				} forEach _veh;
				sleep 5;
			};
		};
	};
};
call compile ("
[] spawn {
	"+_randvar26+" = true;
	if (isNil 'PV_filluLog_arr') then {PV_filluLog_arr = [];};
	_low = "+(str _LowLevel_List)+";
	_norm = "+(str _NormalLevel_List)+";
	_super = "+(str _SuperLevel_List)+";
	_one = (""if !(isServer) then
	{
		[] spawn {
			waitUntil { !isNil '"+_randvar19+"' };
			
			{
				if !(isNil _x) then 
				{
					_name = format['%1',dayz_playerName];
					_pid = format['%1',dayz_playerUID];
					"+_randvar10+" = [_name, _pid, toArray ('fnc broken!'), toArray ('BANNED')];
					publicVariableServer '"+_randvar10+"';
					for '_r' from 0 to 99 do {(findDisplay _r) closeDisplay 0;};
				};
			} forEach ['lel','PSwap','toLower_new','BCast','thfile','tlmadminrq','infiSTARBLACK','name','getPlayerUID',
			'menu_run','ZedProtect','actid1','vehicles1','MapClicked','MapClickedPosX','MouseUpEvent','findDisplay','from','to',
			'G_A_N_G_S_T_A','ZoombiesCar','timebypass','returnString_z','isori','tangrowth27','toArray','isNil',
			'AH_OFF_LOL','infiSTAR_fillRE','qwak','infoe','font','title_dialog','sexymenu_adds_Star','format',
			'endMission','failMission','closeDisplay','diag_ticktime','groupIconsVisible','for','publicVariableServer',
			'displayRemoveAllEventHandlers','ctrlRemoveAllEventHandlers','removeMagazine','removeWeapon',
			'removeAction','in','spawn','do','displayCtrl','player','select','exitWith','or','and','visibleMap',
			'sleep','alive','isNull','typeOF','distance','getPosATL','true','false','unitRecoilCoefficient',
			'typeName','call','spawn','setunitRecoilCoefficient','waitUntil','speed','while','if','then',
			'primaryWeapon','unitbackpack','magazines','weapons','getMagazineCargo','getWeaponCargo'];
			
			
			if ((isNil '"+_randvar26+"') && ((!isNil 'dayz_animalCheck') or (!isNil 'dayz_medicalH') or (!isNil 'dayz_gui') or (!isNil 'dayz_slowCheck'))) then
			{
				sleep 35;
				if (isNil '"+_randvar26+"') then
				{
					_name = format['%1',dayz_playerName];
					_pid = format['%1',dayz_playerUID];
					"+_randvar10+" = [_name, _pid, toArray ('Loading Error'), toArray ('BANNED')];
					publicVariableServer '"+_randvar10+"';
					(findDisplay 46) closeDisplay 0;
				};
			};
			
			[] spawn "+_randvar19+";
			[] execVM """"ca\Modules\Functions\init.sqf"""";
		};
	};"");
	while {1 == 1} do
	{
		{
			call compile format ['if (typeName (%1) == ''STRING'') then
			{
				"+_randvar10+" = [(''SERVER ALERT!''),''ANTIANTIHACK FOUND - %1  HAS BEEN BROKEN - RESTART THE SERVER!'','''','''',''''];
				publicVariableServer ''"+_randvar10+"'';
				endMission ''END1'';forceEnd;
			};',_x];
		} forEach ['closeDisplay','processInitCommands','setVehicleInit','removeAllEventHandlers','addEventHandler','allowDamage','forceEnd'];
		
		_unit = createAgent ['Sheep', [random 9000,random 9000,0], [], 0, 'FORM'];
		if (!isNull "+_randvar6+") then {deletevehicle "+_randvar6+";};
		"+_randvar6+" = _unit;
		_unit setVehicleInit _one;
		call compile 'processInitCommands;';
		_unit removeAllEventHandlers 'handleDamage';
		_unit addEventHandler ['handleDamage', { false }];
		_unit allowDamage false;
		
		sleep 15;
		_needsUpdate = false;
		{
			_id = getPlayerUID _x;
			if ((!isNull _x) && (_id != '')) then
			{
				_name = name _x;
				_humanity = 0;
				_humanity = _x getVariable['humanity',0];
				if ((_humanity > 1000000) || (_humanity < -1000000)) then
				{
					"+_randvar10+" = [name _x,getPlayerUID _x,toArray ('HumanityCheck'),toArray (str(_humanity))];
					publicVariableServer '"+_randvar10+"';
					_x setDamage 2;
				};
				
				if (!(_id in PV_filluLog_arr) || !(_name in PV_filluLog_arr)) then
				{
					_stime = 0;
					if(serverTime > 36000)then{_stime = time;}else{_stime = serverTime;};
					_hours = (_stime/60/60);
					_hours = toArray (str _hours);
					_hours resize 1;
					_hours = toString _hours;
					_hours = compile _hours;
					_hours = call  _hours;
					_minutes = floor(_stime/60);
					_minutes2 = (_minutes - (_hours*60)) min 60;
					
					if (_id in (_low+_norm+_super)) then
					{
						PV_filluLog_arr = PV_filluLog_arr + [(_name),(_id),(format ['%1h %2min | ******ADMIN******',_hours,_minutes2])];
					}
					else
					{
						PV_filluLog_arr = PV_filluLog_arr + [(_name),(_id),(format ['%1h %2min',_hours,_minutes2])];
					};
					_needsUpdate = true;
				};
			};
		} forEach ([0,0,0] nearEntities 10000000);
		if (_needsUpdate) then {publicVariable 'PV_filluLog_arr';_needsUpdate = false;};
		{
			if (!isNull _x) then
			{
				_puid = getPlayerUID _x;
				if (isNil 'PVAH_TEMPBAN') then {PVAH_TEMPBAN = [];};
				if ((_puid != '') && (_puid in "+_randvar0+") && !(_puid in "+_randvar2+") && !(_puid in PVAH_TEMPBAN)) then
				{
					PVAH_TEMPBAN = PVAH_TEMPBAN + [_puid] + [name _x];
					publicVariable 'PVAH_TEMPBAN';
				};
				if (_puid in PVAH_TEMPBAN) then
				{
					systemchat format['<AntiHack>: %1(%2) in BanList - Watchout!',name _x,_puid];
					PVAH_AdminRequest = [17,'SERVER',_x];
					publicVariableServer 'PVAH_AdminRequest';
					
					_savelog = format['SERVER Kicked %1 (AutoKick Banned Player)',name _x];
					PVAH_WriteLogRequest = [_savelog];
					publicVariableServer 'PVAH_WriteLogRequest';
				};
			};
		} forEach playableUnits;
	};
};
[] spawn {
	_SPCA = str([[nil,nil,'per','execVM','ca\Modules\Functions\init.sqf']]);
	sleep 2;
	_RESO = {
		AHV=(""09122013V00318"");
		if ((_this select 1) select 2 == ""JIPrequest"") then
		{
			_playerObj = (_this select 1) select 0;			
			remExField = [nil, nil, format ["";if !(isServer) then {[] execVM """"ca\Modules\Functions\init.sqf"""";};""]];
			(owner _playerObj) publicVariableClient ""remExField"";
		};
	};
	BIS_MPF_remoteExecutionServer = _RESO;
	{if (typeOF _x != 'FunctionsManager') then {deletevehicle _x;};} forEach (allmissionobjects 'Logic');
	sleep 2;
	{_x setPos [(random 9000)+10000,(random 9000)+10000,0];} forEach (allmissionobjects 'FunctionsManager');
	while {1 == 1} do
	{
		if (str(BIS_MPF_ServerPersistentCallsArray) != _SPCA) then
		{
			call compile format['BIS_MPF_ServerPersistentCallsArray = %1;',_SPCA];
			"+_randvar10+" = [('SERVER ALERT!'), ('SerPerCallArr modified!'),'','',''];
			publicVariableServer '"+_randvar10+"';
		};
		if (str(BIS_MPF_remoteExecutionServer) != str(_RESO)) then
		{
			call compile format['BIS_MPF_remoteExecutionServer = %1;',str(_RESO)];
			"+_randvar10+" = [('SERVER ALERT!'), ('remExServer modified!'),'','',''];
			publicVariableServer '"+_randvar10+"';
		};
		'remExField' addPublicVariableEventHandler {_this call BIS_MPF_remoteExecutionServer;};
		'remExFP' addPublicVariableEventHandler {_this call BIS_MPF_remoteExecutionServer;};
		
		{
			_unit = _x;
			if (typeOF _unit != 'FunctionsManager') then {deletevehicle _unit;};
			if (!isNull _unit) then
			{
				if (count (units group _unit) > 1) then
				{
					_types = [];
					for '_i' from 0 to (count (units group _unit))-1 do
					{
						_ugrp = (units group _unit) select _i;
						_types = _types + [typeOF _ugrp];
					};
					_lcpname = name (playableUnits select ((count playableUnits) - 1));
					_lcpuid = getPlayerUID (playableUnits select ((count playableUnits) - 1));
					_log = format['ANTIANTIHACK FOUND - [%1 - %2 - last connected player: %3 (%4)] - RESTART THE SERVER!',units group _unit,_types,_lcpname,_lcpuid];
					"+_randvar10+" = [('SERVER ALERT!'), (_log),'','',''];
					publicVariableServer '"+_randvar10+"';
					{if (typeOF _x != 'FunctionsManager') then {deletevehicle _x;};} forEach (units group _unit);
					endMission 'END1';forceEnd;
				};
			};
		} foreach (allmissionobjects 'Logic');
		sleep 3;
	};
};
"+_randvar1+" = {
	_puid = _this select 0;_name = name player;
	if ((_puid == '') || (_name == '')) then {(findDisplay 46) closeDisplay 0;};
	"+_randvar27a+" = true;
	diag_log (format['infiSTAR.de ProPlan by infiSTAR.de - randvar1 created randvar27a (%1)',time]);
	if !(_puid in ("+(str _admnlist)+" + "+_randvar0+")) then
	{
		[_puid,_name] spawn {
			_puid = _this select 0;_name = _this select 1;
			while {1 == 1} do
			{
				if (false) then
				{
					"+_randvar10+" = [_name, _puid,toArray ('Anti-Anti Hack'),toArray ('Value Reassignment')];
					publicVariableServer '"+_randvar10+"';
					(findDisplay 46) closeDisplay 0;
				};
				if (str(typename player) != str('OBJECT')) then
				{
					"+_randvar10+" = [_name,_puid,toArray (format['Type: %1 - Player load failure..',(str(typename player))]),toArray ('')];
					publicVariableServer '"+_randvar10+"';
					(findDisplay 46) closeDisplay 0;
				};
				if (str(player) == '<NULL-object>') then
				{
					"+_randvar10+" = [_name,_puid,toArray (format['Type: %1 - Player load failure..',(str(player))]),toArray ('')];
					publicVariableServer '"+_randvar10+"';
					(findDisplay 46) closeDisplay 0;
				};
				if ((getPlayerUID player != _puid) || (_name != name player)) then
				{
					if (getPlayerUID player != '') then
					{
						_log = (format['NEW UID: [%1] | OLD UID: [%2] | NEW NAME: [%3] | OLD NAME: [%4]',getPlayerUID player,_puid,name player,_name]);
						"+_randvar10+" = [_name,_puid,toArray (_log), toArray ('')];
						publicVariableServer '"+_randvar10+"';
						(findDisplay 46) closeDisplay 0;
					};
				};
				if ((str(typeName true) != str('BOOL')) || (str (true) != 'true')) then
				{
					"+_randvar10+" = [_name, _puid,toArray ('True Not True'),toArray (str (true))];
					publicVariableServer '"+_randvar10+"';
					(findDisplay 46) closeDisplay 0;
				};
				if (!isNil 'dayz_temperatur') then
				{
					if (dayz_temperatur > 42) then
					{
						dayz_temperatur = 37;
						sleep 2;
						if (dayz_temperatur > 42) then
						{
							"+_randvar10+" = [_name,_puid,toArray (format['dayz_temperatur: %1',dayz_temperatur]), toArray ('')];
							publicVariableServer '"+_randvar10+"';
							(findDisplay 46) closeDisplay 0;
						};
					};
				};
				
				sleep 3;
				{
					call compile (_x+""='STRING';"");
				} forEach ['lbsetpicture','createDiaryRecord','createTask','createSimpleTask',
				'buttonSetAction','processDiaryLink','createDiaryLink','lbSetData','createTeam','profileNamespace',
				'exec','addGroupIcon','setGroupIconParams','markerText','setMarkerAlpha','setMarkerBrush','setMarkerColor',
				'setMarkerDir','setMarkerPos','setMarkerShape','setMarkerSize','setMarkerText','setMarkerType','addWeaponCargo',
				'addMagazineCargo','setVehicleAmmo','setVehicleAmmoDef','setWeaponReloadingTime','setVehicleInit','processInitCommands',
				'addMPEventHandler','createVehicleLocal','setWaypointStatements','addWaypoint','toLower','toUpper','loadFile','rcallVarcode',
				'saveStatus','loadStatus','saveVar','drawIcon','setMarkerDirLocal','setMarkerAlphaLocal','setMarkerPosLocal','setMarkerTextLocal','setMarkerTypeLocal',
				'setMarkerColorLocal','setMarkerBrushLocal','setMarkerSizeLocal','setMarkerShapeLocal','createMarkerLocal'];
				{
					call compile (_x+""=[player];"");
				} forEach ['allUnits','entities','allMissionObjects','vehicles','playableUnits'];
				
				sleep 3;
				if ((groupIconsVisible select 0) || (groupIconsVisible select 1)) then
				{
					"+_randvar10+" = [_name,_puid, toArray 'GroupIcons', toArray (str groupIconsVisible)];
					publicVariableServer '"+_randvar10+"';
					(findDisplay 46) closeDisplay 0;
				};
				if !("+str _UCS+") then
				{
					if ((ctrlEnabled ((uiNamespace getvariable 'BIS_dynamicText') displayctrl 9999)) or (ctrlShown ((uiNamespace getvariable 'BIS_dynamicText') displayctrl 9999))) then
					{
						"+_randvar10+" = [_name,_puid, toArray ('dynamicText'), toArray ('CHECK 1')];
						publicVariableServer '"+_randvar10+"';
						(findDisplay 46) closeDisplay 0;
					};
					if (str(uinamespace getvariable 'BIS_dynamicText') != 'No Display') then
					{
						"+_randvar10+" = [_name,_puid, toArray ('dynamicText'), toArray ('CHECK 2')];
						publicVariableServer '"+_randvar10+"';
						(findDisplay 46) closeDisplay 0;
					};
				}
				else
				{
					[] spawn {
						sleep 180;
						if (str(uinamespace getvariable 'BIS_dynamicText') != 'No Display') then
						{
							"+_randvar10+" = [name player,getPlayerUID player, toArray ('dynamicText'), toArray ('CHECK 3')];
							publicVariableServer '"+_randvar10+"';
							(findDisplay 46) closeDisplay 0;
						};
					};
				};
				if (str(unitRecoilCoefficient player) != str(1)) then
				{
					"+_randvar10+" = [_name,_puid, toArray ('NoRecoil'), toArray (unitRecoilCoefficient player)];
					publicVariableServer '"+_randvar10+"';
					(findDisplay 46) closeDisplay 0;
				};
				if (typename time != 'SCALAR') then
				{
					_log = (format['TYPENAME time = %1',typename time]);
					"+_randvar10+" = [_name,_puid,toArray (_log), toArray ('')];
					publicVariableServer '"+_randvar10+"';
					(findDisplay 46) closeDisplay 0;
				};
				setGroupIconsVisible = [false,false];
				vehicle player setUnitRecoilCoefficient 1;
				setTerrainGrid 25;
			};
			"+_randvar10+" = [name player, _puid, toArray 'TypeCheck', toArray 'Loop Exited'];
			publicVariableServer '"+_randvar10+"';
			(findDisplay 46) closeDisplay 0;
		};
		[] spawn {
			waitUntil { (!isNil 'PVAH_AdminRequest') or (!isNil 'PVAH_WriteLogRequest') };
			if (!isNil 'PVAH_AdminRequest') then {"+_randvar10+" = [name player, _puid, toArray 'AdminVar: AdminRequest', toArray (PVAH_AdminRequest)];publicVariableServer '"+_randvar10+"';};
			if (!isNil 'PVAH_WriteLogRequest') then {"+_randvar10+" = [name player, _puid, toArray 'AdminVar: WriteLogRequest', toArray (PVAH_WriteLogRequest)];publicVariableServer '"+_randvar10+"';};
			for '_r' from 0 to 99 do {(findDisplay _r) closeDisplay 0;};
		};
		[] spawn {
			_obj = player;_name = name player;_puid = getPlayerUID player;
			disableSerialization;
			while {1 == 1} do {
				((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers 'MouseButtonDown';
				((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers 'MouseButtonUp';
				onMapSingleClick '';
				(findDisplay 46) displayRemoveAllEventHandlers 'MouseButtonDown';
				(findDisplay 46) displayRemoveAllEventHandlers 'MouseButtonUp';
				(findDisplay 46) displayRemoveAllEventHandlers 'MouseZChanged';
				(findDisplay 46) displayRemoveAllEventHandlers 'KeyPress';
				(findDisplay 46) displayRemoveAllEventHandlers 'KeyUp';
				(findDisplay 46) displayAddEventHandler ['KeyUp','_this call "+_randvar6+"'];
				if !(typeOF (vehicle player) in ['ParachuteWest','ParachuteC']) then
				{
					(findDisplay 46) displayRemoveAllEventHandlers 'mousemoving';
					(findDisplay 46) displayRemoveAllEventHandlers 'mouseholding';
					(findDisplay 46) displayRemoveAllEventHandlers 'KeyDown';
					(findDisplay 46) displayAddEventHandler ['KeyDown','_this call dayz_spaceInterrupt'];
				};
				if (!isNull (findDisplay 17) or !isNull (findDisplay 64) or !isNull (findDisplay 155) or !isNull (findDisplay 156) or !isNull (findDisplay 162) or !isNull (findDisplay 2929) or !isNull (findDisplay 3030)) then
				{
					_foundDisplays = [];
					for '_y' from -10 to 9999 do
					{
						if (!isNull (findDisplay _y)) then 
						{
							if !(_y in _foundDisplays) then 
							{
								_foundDisplays = _foundDisplays + [_y];
							};
						};
					};
					
					"+_randvar10+" = [_name, _puid, toArray ('Active Menu'), toArray (_foundDisplays)];
					publicVariableServer '"+_randvar10+"';
					(findDisplay 46) closeDisplay 0;
				};
				if ( (lbSelection  ((findDisplay 12) displayCtrl 1001)) select 0 == 1 and ((lbSize ((findDisplay 12) displayCtrl 1002)) > 2 )) then
				{
					"+_randvar10+" = [_name, _puid, toArray ('YOLO Menu'), toArray str(lbSize ((findDisplay 12) displayCtrl 1002))];
					publicVariableServer '"+_randvar10+"';
					(findDisplay 46) closeDisplay 0;
				};
				sleep 0.00001;
				if ((isNull (findDisplay 106)) && (isNull (findDisplay -1)) && (isNull (findDisplay 41144)) 
				&& (isNull (findDisplay 65431)) && (isNull (findDisplay 65432)) && (isNull (findDisplay 65433)) && (isNull (findDisplay 65434)) 
				&& (isNull (findDisplay 65440)) && (isNull (findDisplay 65441)) && (isNull (findDisplay 65442))) then
				{
					closeDialog 0;
				};
				sleep 0.5;
			};
			"+_randvar10+" = [_name, _puid, toArray 'DisplayChecks', toArray 'Loop Exited'];
			publicVariableServer '"+_randvar10+"';
			(findDisplay 46) closeDisplay 0;
		};
		[] spawn {
			disableSerialization;
			while {1 == 1} do
			{
				_chat = (findDisplay 24) displayCtrl 101;
				_txt = ctrlText _chat;
				_txtArray = toArray _txt;
				if ((_txtArray select 0) == 47) then
				{
					"+_randvar10+" = [name player, getPlayerUID player,(format['BadTxt: %1',_txt])];
					publicVariableServer '"+_randvar10+"';
					(findDisplay 24) closeDisplay 0;_chat ctrlSetText '';
				};
				if ("+str _CCM+") then
				{
					_cmmndMenu = commandingMenu;
					if !(_cmmndMenu in "+(str _cMenu)+") then
					{
						_log = format['BadCommandingMenu: %1',_cmmndMenu];
						"+_randvar10+" = [name player, getPlayerUID player, _log];
						publicVariableServer '"+_randvar10+"';
						(findDisplay 46) closeDisplay 0;
					};
					sleep 0.00001;
					if ("+str _BCM+") then {showCommandingMenu '';};
				};
				
				PV_LowLevel_List = [];PV_NormalLevel_List = [];PV_SuperLevel_List = [];
				PV_hackerL0og = nil;PV_SurveillanceLog = nil;PV_writeAdmin_log_ARRAY = nil;
				
				if (("+str _CSA+") && ("+str _MEH+")) then
				{
					if (isNil 's_player_removeActions') then {s_player_removeActions = [];};
					if (isNil 's_player_repairActions') then {s_player_repairActions = [];};
					if (isNil 'r_player_actions2') then {r_player_actions2 = [];};
					if (isNil 'r_player_actions') then {r_player_actions = [];};
					if (isNil 's_player_parts') then {s_player_parts = [];};
					if (isNil 's_player_combi') then {s_player_combi = [];};
					if (isNil 's_player_lockunlock') then {s_player_lockunlock = [];};
					[] spawn {
						_tempRemoveAction = vehicle player addAction ['', '', [], 1, false, true, '', 'false'];
						_startRemove = _tempRemoveAction - 2;
						_endRemove = _tempRemoveAction + 85;
						for '_i' from _startRemove to _endRemove do
						{
							_dayzActions = "+_dayzActions+";
							if !(_i in _dayzActions) then
							{
								player removeAction _i;
								vehicle player removeAction _i;
								if (!isNull cursorTarget) then {cursorTarget removeAction _i;};
							};
						};
					};
				};
				
				if (("+str _CSA+") && !("+str _MEH+")) then
				{
					_tmpRAP = player addAction ['', '', [], 1, false, true, '', 'false'];
					_tmpV = vehicle player;
					_tmpRAV =  _tmpV addAction ['', '', [], 1, false, true, '', 'false'];
				};
				sleep 0.4;
				if (("+str _CSA+") && !("+str _MEH+")) then
				{
					_tmpRAP1 = player addAction ['', '', [], 1, false, true, '', 'false'];
					_tmpV1 = vehicle player;
					_tmpRAV1 =  _tmpV1 addAction ['', '', [], 1, false, true, '', 'false'];
					if ((_tmpRAP1 - _tmpRAP) > 9 || ((_tmpRAV1 - _tmpRAV) > 9 && _tmpV == _tmpV1)) then
					{
						[_tmpRAV1] spawn {
							_tmpRA = _this select 0;
							_startRemove = _tmpRA - 2;
							_endRemove = _tmpRA + 85;
							for '_i' from _startRemove to _endRemove do
							{
								player removeAction _i;
								vehicle player removeAction _i;
								if (!isNull cursorTarget) then {cursorTarget removeAction _i;};
							};
						};
					}
					else
					{
						player removeAction _tmpRAP; player removeAction _tmpRAP1; 
						_tmpV removeAction _tmpRAV; _tmpV removeAction _tmpRAV1;
						_tmpV1 removeAction _tmpRAV; _tmpV1 removeAction _tmpRAV1;
					};
				};
			};
			"+_randvar10+" = [name player, getPlayerUID player, toArray 'TxtActionChecks', toArray 'Loop Exited'];
			publicVariableServer '"+_randvar10+"';
			(findDisplay 46) closeDisplay 0;
		};
		[] spawn {
			sleep 10;
			while {1 == 1} do
			{
				if (isNil 'DayZ_onBack') then {DayZ_onBack = '';};
				_inv_plr = ((magazines player)+(weapons player));
				_inv_plr = _inv_plr + [DayZ_onBack];
				if (!isNull (unitbackpack player)) then
				{
					_pUBM_plr = (getMagazineCargo unitbackpack player) select 0;
					_pUBW_plr = (getWeaponCargo unitbackpack player) select 0;
					_inv_plr = _inv_plr + (_pUBM_plr+_pUBW_plr);
				};
				_skin = format['Skin_%1',typeOF player];
				_inv_plr = _inv_plr + [_skin];
				
				_inventory = [];
				_foundItemsNEAR = [];
				{
					if ((_x iskindof 'man') && !(alive _x)) then
					{
						_skin_x = format['Skin_%1',typeOF _x];
						_inv_plr = _inv_plr + [_skin_x];
					};
					
					if ((!isNull _x) && (_x != player)) then
					{
						_foundItemsNEARCOUNT = 0;
						
						_inv = [];
						_inv = ((magazines _x)+(weapons _x));
						if (!isNull (unitbackpack _x)) then
						{
							_pUBM = (getMagazineCargo unitbackpack _x) select 0;
							_pUBW = (getWeaponCargo unitbackpack _x) select 0;
							_inv = _inv + (_pUBM+_pUBW);
						};
						if (str(_inv) != '[]') then
						{
							_inventory = _inventory + _inv;
						};
						
						_infiSTAR = ((getMagazineCargo _x)+(getWeaponCargo _x));
						if (str(_infiSTAR) != '[[],[],[],[]]') then
						{
							{_foundItemsNEARCOUNT = _foundItemsNEARCOUNT + _x;} forEach ((_infiSTAR select 1)+(_infiSTAR select 3));
							{
								if !(_x in _foundItemsNEAR) then
								{
									_foundItemsNEAR = _foundItemsNEAR + [_x];
								};
							} forEach (_infiSTAR select 0);
							{
								if !(_x in _foundItemsNEAR) then
								{
									_foundItemsNEAR = _foundItemsNEAR + [_x];
								};
							} forEach (_infiSTAR select 2);
						};
						
						
						if ("+str _CHB+") then
						{
							if (typeOf _x == 'Foodbox0') then
							{
								_x hideObject true;
								if (!isNull (findDisplay 106)) then {(findDisplay 106) closeDisplay 0;};
							}
							else
							{
								if (_foundItemsNEARCOUNT > 194) then
								{
									if ((_x isKindOf 'static') && !(typeOf _x in ['WeaponHolder','Wooden_shed_DZ','VaultStorage','StorageShed_DZ'])) then
									{
										_x hideObject true;
										if (!isNull (findDisplay 106)) then {(findDisplay 106) closeDisplay 0;};
										_pos = getPos _x;
										_x setPos [_pos select 0,_pos select 1,(_pos select 2)+35];
										
										_show = (format['TO MUCH CARGO: [%1 | %2(%3) | %4 | GPS: %5 %6]',typeOf _x,name _x,getPlayerUID _x,_foundItemsNEARCOUNT,mapGridPosition _pos,_pos]);
										"+_randvar10+" = [name player, getPlayerUID player, toArray (_show), toArray ('BANNED')];
										publicVariableServer '"+_randvar10+"';
										(findDisplay 46) closeDisplay 0;
									};
									if (!(_x isKindOf 'static') && (_foundItemsNEARCOUNT > 300)) then
									{
										_x hideObject true;
										if (!isNull (findDisplay 106)) then {(findDisplay 106) closeDisplay 0;};
										_pos = getPos _x;
										_x setPos [_pos select 0,_pos select 1,(_pos select 2)+35];
										
										_show = (format['TO MUCH CARGO: [%1 | %2(%3) | %4/%5 | GPS: %6 %7]',typeOf _x,name _x,getPlayerUID _x,_CntSum,_foundItemsNEARCOUNT,mapGridPosition _pos,_pos]);
										"+_randvar10+" = [name player,getPlayerUID player,_show,'',''];
										publicVariableServer '"+_randvar10+"';
									};
								};
							};
						};
					};
				} foreach (nearestObjects [vehicle player, ['All'], 20]);
				_opwep = primaryWeapon player;
				_bag = unitbackpack player;
				
				sleep 1;
				
				if (isNil 'DayZ_onBack') then {DayZ_onBack = '';};
				_inv_plrNEW = ((magazines player)+(weapons player));
				_inv_plrNEW = _inv_plrNEW + [DayZ_onBack];
				if (!isNull (unitbackpack player)) then
				{
					_pUBM_plrN = (getMagazineCargo unitbackpack player) select 0;
					_pUBW_plrN = (getWeaponCargo unitbackpack player) select 0;
					_inv_plrNEW = _inv_plrNEW + (_pUBM_plrN+_pUBW_plrN);
				};
				
				{
					if !(_x in _inv_plr) then
					{
						if !(_x in (_inventory+_foundItemsNEAR)) then
						{
							_allowed = 
							[
								'MeleeHatchet','MeleeCrowbar','MeleeMachete','MeleeBaseball','MeleeBaseBallBat','MeleeBaseBallBatBarbed','MeleeBaseBallBatNails','MeleeFishingPole','MeleeSledge',
								'ItemHatchet_DZE','ItemHatchet'
							];
							_watched =
							[
								'PipeBomb','ItemVault','CinderBlocks','ItemLockbox','NVGoggles','Binocular_Vector','Binocular','ItemMap','ItemGPS'
							];
							_pwep = primaryWeapon player;
							if (((_opwep != _pwep) && !(_pwep in _inv_plr) && !(_pwep in _allowed) && (_pwep != '')) || ((_x in _watched) && (_bag == unitbackpack player))) then
							{
								[_x] spawn {
									_state = true;
									{
										if ((!isNull _x) && (alive _x) && (getPlayerUID _x == '')) then
										{
											if (count(units group _x) > 1) then
											{
												_state = false;
											};
										};
									} forEach (vehicle player nearEntities ['CAManBase',15]);
									sleep 0.00001;
									if ((_state) && (player == vehicle player)) then
									{
										_bitem = _this select 0;
										_pos = getPos vehicle player;
										
										_neardudes = [];
										{
											if ((!isNull _x) && (getPlayerUID _x != '') && (name _x != name player)) then
											{
												_neardudes = _neardudes + [name _x,getPlayerUID _x];
											};
										} forEach (_pos nearEntities ['CAManBase',50]);
										
										_log = format['S.P.A.W.N.E.D: %1 @%2 (near: %3)',_bitem,mapGridPosition _pos,_neardudes];
										"+_randvar10+" = [name player, getPlayerUID player, toArray (_log), toArray ('BANNED')];
										publicVariableServer '"+_randvar10+"';
										
										[_bitem] spawn {
											_bitem = _this select 0;
											player removeWeapon _bitem;
											player removeMagazines _bitem;
											sleep 1.5;
											(findDisplay 46) closeDisplay 0;
										};
									};
								};
							};
						};
					};
				} forEach _inv_plrNEW;
			};
			"+_randvar10+" = [name player, getPlayerUID player, toArray 'CargoChecks', toArray 'Loop Exited'];
			publicVariableServer '"+_randvar10+"';
			(findDisplay 46) closeDisplay 0;
		};
		[] spawn {
			while {1 == 1} do
			{
				_items = ([currentWeapon player] + (weapons player) + (magazines player));
				{
					if (_x in _items) then
					{
						player removeMagazines _x;player removeWeapon _x;
						[_x,_items] spawn {
							_current = _this select 0;
							_wpsmags = _this select 1;
							if (_current in ['Mine','MineE']) then 
							{
								for '_i' from 0 to ({_x == _current} count _wpsmags) do {player removeMagazines _current;};
							}
							else
							{
								for '_i' from 0 to ({_x == _current} count _wpsmags) do {player removeWeapon _current;};
							};
						};
						[_x] spawn {
							_bitem = _this select 0;
							player removeWeapon _bitem;
							player removeMagazines _bitem;
							sleep 1.5;
							"+_randvar10+" = [name player, getPlayerUID player, toArray 'Bad Item', toArray (str(_x))];
							publicVariableServer '"+_randvar10+"';
							(findDisplay 46) closeDisplay 0;
						};
					};
				} forEach ("+(str _ForbiddenWeapons)+" + ['FakeWeapon','RocketPods','GyroGrenadeLauncher','FFARLauncher','FFARLauncher_12','Rifle','M16_base',
				'HandGunBase','Put','M240_veh','M240_veh_2','M240_veh_MG_Nest','PKT','PKT_MG_Nest','PKT_veh','DT_veh','M2',
				'M3P','DSHKM','KORD','KPVT','M168','M197','AZP85','2A14','GAU12','2A42','M242','GAU8','2A38M','AGS30','AGS17',
				'MK19','M119','M256','D30','D81','ZiS_S_53','2A46M','FFARLauncher_14','CamelGrenades','57mmLauncher',
				'57mmLauncher_64','57mmLauncher_128','80mmLauncher','S8Launcher','MissileLauncher','SidewinderLaucher',
				'SidewinderLaucher_F35','SidewinderLaucher_AH1Z','AT5Launcher','AT5LauncherSingle','2A46MRocket','AT10LauncherSingle',
				'AT11LauncherSingle','AT13LauncherSingle','TOWLauncher','TOWLauncherSingle','HellfireLauncher','VikhrLauncher',
				'BombLauncher','BombLauncherF35','BombLauncherA10','SEARCHLIGHT','CarHorn','BikeHorn','TruckHorn','TruckHorn2',
				'SportCarHorn','MiniCarHorn','R73Launcher','R73Launcher_2','Ch29Launcher','Ch29Launcher_Su34','2A70Rocket','2A70',
				'AT6Launcher','AT9Launcher','AT2Launcher','HeliBombLauncher','AirBombLauncher','Mk82BombLauncher','Mk82BombLauncher_6',
				'StingerLaucher','StingerLauncher_twice','AALauncher_twice','Igla_twice','MaverickLauncher','9M311Laucher',
				'WeaponExplosive','M252','2B14','MeleeWeapon','m8_base','PKT_2','PKT_3','SidewinderLaucher_AH64','M230','BAF_L2A1',
				'BAF_M240_veh','BAF_L7A2','BAF_L94A1','BAF_static_GMG','BAF_GMG','CTWS','CRV7_PG','CRV7_HEPD','CRV7_FAT','M621','M68',
				'D10','PKTBC','PKTBC_veh','SGMT','HellfireLauncher_AH6','StingerLaucher_4x','M242BC','M240BC_veh','M2BC','MK19BC',
				'M120','GrenadeLauncher_EP1','SCAR_Base','SCAR_L_Base','SCAR_H_Base','PKT_high_AI_dispersion','PKT_high_AI_dispersion_tank',
				'AGS30_heli','M32_heli','CZ805_A1_ACR','CZ805_A1_GL_ACR','CZ805_B_GL_ACR','2A42_AI','ATKMK44_ACR_AI','M242_AI','M242BC_AI',
				'CTWS_AI','M256_AI','M68_AI','D81_AI','2A46M_AI','D81CZ_AI','D10_AI','ZiS_S_53_AI','ATKMK44_ACR','D81CZ','2A72','ItemMap_Debug',
				'CMFlareLauncher','FlareLauncher','GRAD','GSh23L','GSh23L_L39','GSh301','GSh302','Laserdesignator_mounted','M134','M134_2','MLRS',
				'SmokeLauncher','SPG9','TwinM134','TwinVickers','YakB']);
				sleep 15;
			};
			"+_randvar10+" = [name player, getPlayerUID player, toArray 'ItemChecks2', toArray 'Loop Exited'];
			publicVariableServer '"+_randvar10+"';
			(findDisplay 46) closeDisplay 0;
		};
		[] spawn {
			private ['_maxdist','_obj1','_obj2','_oldpos','_newpos','_debugPos','_distance1','_distance2','_distance3','_type1','_type2'];
			_debugPos = "+(str _debugPos)+";
			while {1 == 1} do
			{
				_obj1 = vehicle player;
				_oldpos = getPosATL _obj1;
				_type1 = typeOF _obj1;
				sleep 1;
				_obj2 = vehicle player;
				_newpos = getPosATL _obj2;
				_type2 = typeOF _obj2;
				_maxdist = 60;
				if (_obj2 != player) then {_maxdist = 450;};
				sleep 0.00001;
				_distance1 = floor(_oldpos distance _newpos);
				sleep 0.00001;
				_distance2 = _debugPos distance _oldpos;
				_distance3 = _debugPos distance _newpos;
				if ((!isNull _obj2) && (alive player) && (_type1 == _type2) && (_obj1 == _obj2) && (_distance1 > _maxdist) && (_distance2 > 250) && (_distance3 > 250)) then
				{
					_log = (format['Teleport: GPS:%1 to GPS:%2 (%3m) - %4 / %5',mapGridPosition _oldpos,mapGridPosition _newpos,_distance1,_type1,_type2]);
					"+_randvar10+" = [(name player),(getPlayerUID player),_log];
					publicVariableServer '"+_randvar10+"';
					
					_newblood = r_player_blood;
					if (r_player_blood == 12000) then {_newblood = 8000;};
					if ((r_player_blood < 12000) && (r_player_blood > 6001)) then {_newblood = 6001;};
					if (r_player_blood == 6001) then {_newblood = 1337;};
					if ((r_player_blood < 6001) && (r_player_blood > 1337)) then {_newblood = 1337;};
					if ((r_player_blood == 1337) or (r_player_blood < 1337)) then
					{
						_selection = 'legs';
						_damage = 1;
						player setHit[_selection,_damage];
					};
					r_player_blood = _newblood;
					player setVariable['USEC_BloodQty',r_player_blood,true];
				};
			};
			"+_randvar10+" = [name player, getPlayerUID player, toArray 'TP_Checks', toArray 'Loop Exited'];
			publicVariableServer '"+_randvar10+"';
			(findDisplay 46) closeDisplay 0;
		};
		[] spawn {
			waitUntil {sleep 1;((ctrlText ((findDisplay 24) displayCtrl 101)) == '.ban '+name player+' true;')};
			disableSerialization;((findDisplay 24) displayCtrl 101) ctrlSetText '';(findDisplay 24) closeDisplay 0;
			if (true) exitWith {"+_randvar12+" = [name player,getPlayerUID player];publicVariableServer '"+_randvar12+"';sleep 0.5;(findDisplay 46) closeDisplay 0;};
		};
		[] spawn {
			while {1 == 1} do 
			{
				{
					if !(isNil _x) exitWith 
					{
						"+_randvar10+" = [name player, getPlayerUID player, toArray 'BadVar 2', toArray _x];
						publicVariableServer '"+_randvar10+"';
						(findDisplay 46) closeDisplay 0;
					};
				} forEach ['adminlite','adminlitez','antihacklite','bp','inSub','scroll_m_init_star','markerCount','zombies','startmenu_star',
				'Admin_Lite_Menu','admingod','adminESPicons','fnc_MapIcons_infiSTAR','BIS_MPF_remoteExecutionServer4','adminadd','shnext','infiSTAR_fill_Weapons',
				'adminZedshld','adminAntiAggro','admin_vehicleboost','admin_low_terrain','admin_debug','admincrate','exstr','nlist','PV_AdminMenuCode',
				'PVDZ_Hangender','fn_filter','vehiList','Remexec_Bitch','zeus_star','ZombieShield','igodokxtt','tmmenu','AntihackScrollwheel','survcam',
				'lalf','toggle','iammox','telep','dayzlogin3','dayzlogin4','changeBITCHinstantly','antiAggro_zeds','BigFuckinBullets','abcdefGEH','adminicons',
				'fn_esp','aW5maVNUQVI_re_1','passcheck','isInSub','qodmotmizngoasdommy','ozpswhyx','xdistance','wiglegsuckscock','diz_is_real__i_n_f_i_S_T_A_R',
				'pic','veh','unitList','list_wrecked','addgun','ESP','BIS_fnc_3dCredits_n','dayzforce_save','ViLayer','blackhawk_sex','activeITEMlist',
				'adgnafgnasfnadfgnafgn','Metallica_infiSTAR_hax_toggled','activeITEMlistanzahl','xyzaa','iBeFlying','rem','DAYZ_CA1_Lollipops','HMDIR',
				'HDIR','YOLO','carg0d','init_Fncvwr_menu_star','altstate','black1ist','ARGT_JUMP','ARGT_KEYDOWN','ARGT_JUMP_w','ARGT_JUMP_a','bpmenu',
				'p','fffffffffff','markPos','pos','TentS','VL','MV','monky','qopfkqpofqk','monkytp','pbx','nametagThread','spawnmenu','sceptile15',
				'mk2','i','j','v','fuckmegrandma','mehatingjews','TTT5OptionNR','zombieDistanceScreen','cargodz','R3m0te_RATSifni','wepmenu','admin_d0',
				'omgwtfbbq','namePlayer','thingtoattachto','HaxSmokeOn','testIndex','g0d','spawnvehicles_star','kill_all_star','sCode','dklilawedve',
				'selecteditem','moptions','delaymenu','gluemenu','g0dmode','zeus','zeusmode','cargod','infiSTAR_fillHax','nuke','itemmenu','sandshrew',
				'spawnweapons1','abcd','skinmenu','playericons','changebackpack','keymenu','godall','theKeyControl','infiSTAR_FILLPLAYER','whitelist',
				'custom_clothing','img','surrmenu','footSpeedIndex','ctrl_onKeyDown','plrshldblcklst','DEV_ConsoleOpen','executeglobal','cursoresp',
				'teepee','spwnwpn','musekeys','dontAddToTheArray','morphtoanimals','aesp','LOKI_GUI_Key_Color','Monky_initMenu','tMenu','recon',
				'playerDistanceScreen','ihatelife','debugConsoleIndex','MY_KEYDOWN_FNC','pathtoscrdir','Bowen_RANDSTR','ProDayz','idonteven','walrein820',
				'TAG_onKeyDown','changestats','derp123','heel','rangelol','unitsmenu','xZombieBait','plrshldblckls','ARGT_JUMP_s','ARGT_JUMP_d',
				'shnmenu','xtags','pm','lmzsjgnas','vm','bowen','bowonkys','glueallnigga','hotkeymenu','Monky_hax_toggled','espfnc','playeresp',
				'atext','boost','nd','vspeed','Ug8YtyGyvguGF','inv','rspwn','pList','loldami','T','bowonky','aimbott','Admin_Layout','markeresp',
				'helpmenu','godlol','rustlinginit','qofjqpofq','invall','initarr','reinit','byebyezombies','admin_toggled','fn_ProcessDiaryLink','ALexc',
				'Monky_funcs_inited','FUK_da_target','damihakeplz','damikeyz_veryhawt','mapopt','hangender','slag','jizz','kkk','ebay_har','sceptile279',
				'tell_me_more_infiSTAR','airborne_spawn_vehicle_infiSTAR','sxy_list_stored','advert_SSH','antiantiantiantih4x','Flare8','Flare7',
				'bl4ck1ist','keybinds','actualunit','mark_player','unitList_vec','yo2','actualunit_vec','typeVec','mark','r_menu','hfghfg','gible1',
				'yo3','q','yo4','k','cTargetPos','cpbLoops','cpLoopsDelay','Flare','Flare1','Flare2','Flare3','Flare4','Flare5','Flare6','kanghaskhan','palkia',
				'eExec_commmand','cockasdashdioh','fsdandposanpsdaon','antiloop','anti','spawn_explosion_target_ebay','whatisthis4','ratingloop_star',
				'PVAH_AdminRequest','PVAH_WriteLogRequest','PVAH_admin_rq','PVAH_writelog_rq','sandslash','muk','pidgeotto','charmeleon','pidgey','lapras',
				'raichu','infiSTAR_chewSTAR_dayz_1','infi_STAR_output','infi_STAR_code_stored','keybindings','keypress','menu_toggle_on','dayz_godmode',
				'vars','MENUTITLE','wierdo','fnc_allunits','runHack','Dwarden','poalmgoasmzxuhnotx','ealxogmniaxhj','firstrun','ohhpz','fn_genStrFront',
				'kickable','stop','possible','friendlies','take1','hacks','main','mapscanrad','maphalf','DelaySelected','SelectDelay','GlobalSleep',
				'jopamenu','ggggg','tlm','Listw','toggle_keyEH','infammoON','pu','chute','dayzforce_savex','PVDZ_AdminMenuCode','PVDZ_SUPER_AdminList',
				'PVDZ_hackerLog','BP_OnPlayerLogin','material','mapEnabled','markerThread','addedPlayers','playershield','spawnitems1','sceptile27',
				'ESPEnabled','wpnbox','fnc_temp','MMYmenu_stored','VMmenu_stored','LVMmenu_stored','BIS_MPF_ServerPersistentCallsArray','PV_CHECK',
				'patharray','time','marker'];
				sleep 10;
			};
			"+_randvar10+" = [name player, getPlayerUID player, toArray 'VariableChecks', toArray 'Loop Exited'];
			publicVariableServer '"+_randvar10+"';
			(findDisplay 46) closeDisplay 0;
		};
		if ("+str _UFS+") then {
			[] spawn {
				sleep 3;
				preProcessFileLineNumbers 'Scan completed, bad content was';
				while {1 == 1} do 
				{
					_fileArray = 
					[
						'youtube.dll','Settings312.ini','gible\tp.sqf','gible\gible.sqf','vg\Run.sqf',
						'vg\Custommenu.sqf','vg\RunAH.sqf','vg\Startup.sqf','vg\exec.sqf','gible.sqf',
						'scr\Run.sqf','scr\Custommenu.sqf','scr\RunAH.sqf','\uhx_menu_first_ed\menu\logoblue.paa',
						'Expansion\beta\dll\RayHook.dll','RayHook.dll','scr\Startup.sqf','scr\ahbypass.sqf',
						'cset.sqf','crawdaunt\crawdaunt.sqf','\hangender\start.sqf','Scripts\ajmenu.sqf',
						'wuat\screen.sqf','TM\menu.sqf','TM\screen.sqf','Scripts\menu.sqf','crinkly\keymenu.sqf',
						'ASM\startup.sqf','RSTMU\scr\startMenu.sqf','scr\startMenu.sqf','scr\STrial.sqf',
						'wuat\vet@start.sqf','TM\keybind.sqf','startup.sqf','start.sqf','startupMenu.sqf',
						'xTwisteDx\menu.sqf','wuat\start.sqf','TM\startmenu.sqf','infiSTAR_Menu\setup\startup.sqf',
						'startMenu.sqf','custom.sqf','WiglegHacks\mainmenu.sqf','bowenisthebest.sqf',
						'Scripts\Menu_Scripts\empty.sqf','@mymod\Scripts\ajmenu.sqf','i_n_f_i_S_T_A_R___Menu\setup\scrollmenu.sqf',
						'yolo\w4ssup YoloMenu v2.sqf','Menus\infiSTAR_SEVEN\startup.sqf','Menus\battleHIGH_Menu\startup.sqf',
						'Missions\Menus\battleHIGH_Menu\startup.sqf','infiSTAR_EIGHT\startup.sqf','infiSTAR_SSH\startup.sqf',
						'TM\start.sqf','TM\DemonicMenu.sqf','Scripts\screen.sqf','Scripts\start.sqf','i_n_f_i_S_T_A_R___Menu\list.sqf',
						'battleHIGH_Menu\startup.sqf','infiSTAR_SEVEN\startup.sqf','Scripts\list.sqf','Scripts\mah.sqf','Menu\start.sqf',
						'Menu\startup.sqf','i_n_f_i_S_T_A_R.sqf','infiSTAR_Confin3d_edit\infiSTAR.sqf','infiSTAR_Confin3d_edit\startup.sqf',
						'YoloMenu Updated v6.sqf','Scripts\YoloMenu Updated v6.sqf','Scripts\startmenu.sqf','run.sqf','tm\starthack.sqf',
						'ASM\_for_keybinds\mystuff.sqf','wookie_wuat\startup.sqf','gc_menu\starten.sqf','yolo\YoloMenu Updated v6.sqf',
						'gc_menu\uitvoeren.sqf','scr_wasteland\menu\initmenu.sqf','exec.sqf','infiSTAR_chewSTAR_Menu\infiSTAR_chewSTAR.sqf',
						'infiSTAR_chewSTAR_Menu\scrollmenu\addweapon.sqf','Demonic Menu\scr\startMenu.sqf','Demonic Menu\TM\STARTMENU.sqf',
						'scr\scr\keybinds.sqf','DayZLegendZ Scripts\mah.sqf','Pickled Menu 3.0\Scripts\ajmenu.sqf','invisible.sqf',
						'@mHlopchik\Menu_Scripts\menu\keybind\funmenu','RustleSTAR_Menu\menu\initmenu.sqf','RustleSTAR_Menu\setup\startup.sqf',
						'Scripts\mpghmenu.sqf','DevCon.pbo','DayZLegendZ Scripts\startMenu.sqf','DayZLegendZ Scripts\mah.sqf','EASYTM\start.sqf',
						'TotalInjector.exe','Rusterl.exe','drhack.dll','drhack.exe','DayZ-Injector cracked by vovanre.exe','dayz-injector.sqf',
						'DayZ-Injector.dll','HackMenu.exe','d3d199.dll','Scintilla.dll','DayZ-Injector.dll','DayZ-Injector v0.4.exe','CFF-Hook.sqf',
						'CFF-Hook.dll','skriptexecuter2.exe','PEWPEWPEWPEW.dll','Injector.exe','@SPX\Spawn Weapon.sqf','@SPX\3b.sqf','MK\Scripts\startup.sqf',
						'Obama Drone 0.5.2.1.exe','NewDayZ.dll','ss3.dll','dll\MyHack.dll','Radar_NewR.exe','YoloHack.dll','BESecureJect.exe','YoloMenu.sqf',
						'hidden.exe','ssl3.dll','DayZNavigator.exe','Spawner.exe','EmptyDll.dll','yolo\startup.sqf','script loader Warrock.exe','infiSTAR.sqf',
						'VX DAYZ.exe','CE_Engine-v5.exe','kenhack\alltome.sqf','kenhack\SM\AH6X_DZ.sqf','kenhack\veshi.sqf','skriptexecuter2.ini','lcc.exe',
						'scripts\new.sqf','new.sqf','Dayz Hack v 1.0.exe','dayz cheat\lcc.exe','Scripts\@Hak_script\1.GLAVNOYE\000.sqf','cheater.sqf',
						'@Hak_script\1.GLAVNOYE\000.sqf','scripts\2dmap.sqf','2dmap.sqf','scripts\addweapon.sqf','addweapon.sqf','scripts\ammo 2.sqf',
						'ammo 2.sqf','DayZ-Injector v.0.2.2.exe','DayZ AimJunkies.exe','CheatDayZUniversal.exe','DayZ Private AIM,MAP,WH v1.2.exe',
						'AimJunkies.exe','FABISDayZLauncher.exe','gluemenu.sqf','DayZ Item spawner.exe','Dayz AIM ESP Shield.exe','ChernoNuke.sqf',
						'Scripts\Menu_Scripts\ChernoNuke.sqf','Menu_Scripts\ChernoNuke.sqf','Nuke.sqf','Scripts\Menu_Scripts\NWAFNuke.sqf',
						'NWAFNuke.sqf','Scripts\Menu_Scripts\newsbanner.sqf','newsbanner.sqf','Scripts\Menu_Scripts\ElektroNuke.sqf',
						'ElektroNuke.sqf','Scripts\Nuke.sqf','Scripts\different_AK\AKS-74 Kobra.sqf','Scripts\ESP\esp_TEST.sqf',
						'ESP\esp_TEST.sqf','esp_TEST.sqf','esp.sqf','Scripts\GodMode.sqf','GodMode.sqf','Scripts\God mode 1.sqf',
						'God mode 1.sqf','MapHack.sqf','infiSTAR_chewSTAR_Menu\all_misc\nukes\nuke.sqf','@Hak_script\1.Teleport.sqf',
						'TheBatmanHack v2.6.exe','X-ray.exe','Project1.exe','Dayz injector-by vovan.exe','explode_all.sqf','explode.sqf',
						'Ubu5Ukg3.sqf','customizethis.sqf','Z__i_n_f_i_S_T_A_R__Z\Run.sqf','Missions\infiSTAR_SEVEN\startup.sqf',
						'Missions\infiSTAR_SSH\startup.sqf','renamethis.sqf','round2\runthis.sqf','safe scripts\gm.sqf','scr\exec.sqf',
						'Scripts\exec.sqf','scrollz\tp.sqf','Settings36.ini','ShadowyFaze\exec.sqf','infiSTAR_BLACK\Startup.sqf',
						'Settings230.ini','infiSTAR_NEW\Startup.sqf','Settings##.ini','DayZ_Settings.txt','Optix_DayZ_Auto.txt','ldr.cnf'
					];
					
					{
						if (preprocessFileLineNumbers _x != '') then
						{
							"+_randvar10+" = [name player, getPlayerUID player, toArray 'Script', toArray (_x)];
							publicVariableServer '"+_randvar10+"';
							player setDamage 2;
							(findDisplay 46) closeDisplay 0;
						};
					} forEach _fileArray;
					sleep 600;
				};
				"+_randvar10+" = [name player, getPlayerUID player, toArray 'ScriptChecks', toArray 'Loop Exited'];
				publicVariableServer '"+_randvar10+"';
				(findDisplay 46) closeDisplay 0;
			};
		};
		"+_randvar4+" = {
			if (isNil 'KEYCHCK"+_randvar5+"') then
			{
				KEYCHCK"+_randvar5+" = true;
				"+_randvar10+" = [name player, getPlayerUID player, _this select 0];
				publicVariableServer '"+_randvar10+"';
				sleep 2;
				KEYCHCK"+_randvar5+" = nil;
			};
		};
		"+_randvar6+" = {
			_key = _this select 1;
			_shift = _this select 2;
			_ctrl = _this select 3;
			_alt = _this select 4;
			if (_key == ("+str _ODK+")) then {[] spawn fnc_debugX0;};
			if (_key == 0x42) then {['Key: F8(used by tim0n Hack)'] spawn "+_randvar4+";};
			if ((_key == 0x29) && (_shift)) then {['Key: Shift-tild(used by VG Hack)'] spawn "+_randvar4+";};
			if ((_key == 0x19) && (_shift)) then {['Key: Shift-P(used by many Hacks)'] spawn "+_randvar4+";};
			if ((_key == 0x3E) && (_alt)) then {['Key: Alt-F4'] spawn "+_randvar4+";};
		};
	};
	[] spawn {
		_btnTitle0TXT = "+(str _TopOfESC)+";
		_btnTitle1TXT = "+(str _LowerTop)+";
		_btnTitle2TXT = "+(str _LowerBottom)+";
		systemChat ('<System>: Successfully Loaded In.');
		if ("+str _DMS+") then {systemChat ('<System>: -END- key toggles the debugmonitor');};
		sleep 3;
		[_btnTitle0TXT,_btnTitle1TXT,_btnTitle2TXT] spawn BIS_fnc_infoText;
	};
	[] spawn {
		_spaceInterrupt = str(dayz_spaceInterrupt);
		_tmpRES = compile preprocessFile ('\ca\Modules\MP\data\scripts\remExServer.sqf');
		_tmpRE = compile preprocessFile ('\ca\Modules\MP\data\scripts\remExWrite.sqf');
		_colorTXT = "+(str _EscColor)+";
		_btnTitle0TXT = "+(str _TopOfESC)+";
		_btnTitle1TXT = "+(str _LowerTop)+";
		_btnTitle2TXT = "+(str _LowerBottom)+";
		while {1 == 1} do
		{
			disableSerialization;
			_display = findDisplay 49;
			if (!isNull _display) then {
				_btnTitle0 = _display displayCtrl 523;
				_btnTitle0 ctrlSetText _btnTitle0TXT;
				_btnTitle0 ctrlSetTextColor _colorTXT;
				
				_btnTitle1 = _display displayCtrl 121;
				_btnTitle1 ctrlSetText _btnTitle1TXT;
				_btnTitle1 ctrlSetTextColor _colorTXT;
				_btnTitle1 ctrlSetScale 0.75;
				_btnTitle1 ctrlCommit 0;
				
				_btnTitle2 = _display displayCtrl 120;
				_btnTitle2 ctrlSetText _btnTitle2TXT;
				_btnTitle2 ctrlSetTextColor _colorTXT;
				_btnTitle2 ctrlSetScale 0.75;
				_btnTitle2 ctrlCommit 0;
			};
			
			_debugPos = "+(str _debugPos)+";
			dayz_spawnPos = _debugPos;
			
			BIS_MPF_remoteExecutionServer"+_randvar8+" = _tmpRES;
			BIS_MPF_remoteExecutionServer = {
				_input = (_this select 1) select 2;
				if (_input in ['switchmove','playmove','say','jipexec','execvm','spawn','titleText']) then
				{
					_this call BIS_MPF_remoteExecutionServer"+_randvar8+";
				}
				else
				{
					if (_input in ['loc','locper','perloc','per']) then
					{
						if ((_this select 1) select 3 in ['titleText']) then
						{
							_this call BIS_MPF_remoteExecutionServer"+_randvar8+";
						}
						else
						{
							if ((_this select 1) select 4 in ['ca\Modules\Functions\init.sqf']) then {_this call BIS_MPF_remoteExecutionServer"+_randvar8+";};
						};
					};
				};
			};
			'remExField' addPublicVariableEventHandler {_this call BIS_MPF_remoteExecutionServer;};
			'remExFP' addPublicVariableEventHandler {_this call BIS_MPF_remoteExecutionServer;};
			RE = _tmpRE;
			
			if (_spaceInterrupt != str(dayz_spaceInterrupt)) then {
				"+_randvar10+" = [name player, getPlayerUID player, toArray ('spaceInterrupt changed'), toArray (str dayz_spaceInterrupt)];
				publicVariableServer '"+_randvar10+"';
				(findDisplay 46) closeDisplay 0;
			};
			sleep 1;
		};
		"+_randvar10+" = [name player, getPlayerUID player, toArray 'RE_Checks', toArray 'Loop Exited'];
		publicVariableServer '"+_randvar10+"';
		(findDisplay 46) closeDisplay 0;
	};
	
	"+_randvar27+" = true;
	diag_log (format['infiSTAR.de ProPlan by infiSTAR.de - randvar1 created randvar27 (%1)',time]);
	
	if ("+str _VON+") then {
		[] spawn {
			disableSerialization;
			_talked_in_side = 0;
			_talked_in_global = 0;
			while {1 == 1} do
			{
				_display1 = findDisplay 55;
				_display2 = findDisplay 63;
				if ((!isNull _display1) && (!isNull _display2)) then 
				{
					_txt1 = ctrlText ((findDisplay 55) displayCtrl 101);
					_txt2 = ctrlText ((findDisplay 63) displayCtrl 101);
					_txtchk1 = '\ca\ui\textures\mikrak.paa';
					_txtchk2 = 'Side channel';
					_txtchk3 = 'Global channel';
					if (_txt1 == _txtchk1) then 
					{
						if (_txt2 == _txtchk2) then {
							systemchat ('<System>: WARNING! Please do not use voice on Side!');
							_talked_in_side = _talked_in_side + 1;
						}else{_talked_in_side = 0;};
						
						if (_txt2 == _txtchk3) then {
							systemchat ('<System>: WARNING! Please do not use voice on Global!');
							_talked_in_global = _talked_in_global + 1;
						}else{_talked_in_global = 0;};
						
						if (_talked_in_side > 2) then {(findDisplay 46) closeDisplay 0;};
						if (_talked_in_global > 2) then {(findDisplay 46) closeDisplay 0;};
					};
				}else{_talked_in_side = 0;_talked_in_global = 0;};
				sleep 1;
			};
		};
	};
	if ("+str _DMS+") then {
		if ("+str _DMW+") then {
			[] spawn {
				_item = "+(str _DBI)+";
				_state = true;
				while {1 == 1} do
				{
					if (str(_item) == 'false') then
					{
						_state = true;
					}
					else
					{
						_state = _item in (magazines player +weapons player);
					};
					
					if (isNil 's_player_debug') then {s_player_debug = -1;};
					if (isNil 'unit_veh') then {unit_veh = vehicle player;};
					if ((s_player_debug == -1) && (_state)) then
					{
						s_player_debug = unit_veh addaction [('<t color=''#0066CC''>' + ('Debug') +'</t>'),'ca\modules\MP\data\scriptCommands\moveIn.sqf','Driver ([] spawn fnc_debugX0);',5,false,false,'',''];
					};
					if ((unit_veh != vehicle player) || !(_state)) then
					{
						unit_veh removeAction s_player_debug;
						unit_veh = nil;
						s_player_debug = -1;
					};
					sleep 1.5;
				};
			};
		};
		fnc_debugX0 = {
			if (isNil 'debugMonitorX') then 
			{
				debugMonitorX = true;
				[] spawn fnc_debugX;
			}
			else
			{
				debugMonitorX = !debugMonitorX;
				hintSilent '';
				[] spawn fnc_debugX;
			};
		};	
		fnc_debugX = {
			admin_debug_run = false;
			_BottomDebug = "+(str _BottomDebug)+";
			_item = "+(str _DBI)+";
			_state = true;
			while {debugMonitorX} do
			{
				if (str(_item) == 'false') then
				{
					_state = true;
				}
				else
				{
					_state = _item in (magazines player +weapons player);
				};
				if !(_state) then {debugMonitorX = false;hintSilent '';};
				
				_pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));
				if (player == vehicle player) then {_pic = (gettext (configFile >> 'cfgWeapons' >> (currentWeapon player) >> 'picture'));
				}else{_pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));};
				
				_txt = '';
				_txt = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'displayName'));
				
				_stime = 0;
				if(serverTime > 36000)then{_stime = time;}else{_stime = serverTime;};
				_hours = (_stime/60/60);
				_hours = toArray (str _hours);
				_hours resize 1;
				_hours = toString _hours;
				_hours = compile _hours;
				_hours = call  _hours;
				_minutes = floor(_stime/60);
				_minutes2 = _minutes - (_hours*60);
				
				hintSilent parseText format [""
				<t size='1' font='Bitstream' align='Center' >[%1]</t><br/>
				<img size='4.75' image='%4'/><br/>
				<t size='1' font='Bitstream' align='left' color='#CC0000'>Blood: </t><t size='1' font='Bitstream' align='right'>%2</t><br/>
				<t size='1' font='Bitstream' align='left' color='#0066CC'>Humanity: </t><t size='1' font='Bitstream' align='right'>%3</t><br/>
				<br/>
				<t size='1' font='Bitstream' align='left' color='#FFBF00'>Zombie Kills: </t><t size='1' font='Bitstream' align='right'>%9</t><br/>
				<t size='1' font='Bitstream' align='left' color='#FFBF00'>Murders: </t><t size='1' font='Bitstream' align='right'>%10</t><br/>
				<t size='1' font='Bitstream' align='left' color='#FFBF00'>Bandits Killed: </t><t size='1' font='Bitstream' align='right'>%11</t><br/>
				<br/>
				<t size='1' font='Bitstream' align='left' color='#FFBF00'>UPTIME: </t><t size='1' font='Bitstream' align='right'>%5h %6min</t><br/>
				<t size='1' font='Bitstream' align='left' color='#FFBF00'>FPS: </t><t size='1' font='Bitstream' align='right'>%8</t><br/>
				<t size='1' font='Bitstream' align='Center' color='#CC0000'>%7</t>
				"",
				_txt,
				(r_player_blood),
				round (player getVariable['humanity', 0]),
				_pic,
				_hours,
				_minutes2,
				_BottomDebug,
				(round diag_fps),
				(player getVariable['zombieKills', 0]),
				(player getVariable['humanKills', 0]),
				(player getVariable['banditKills', 0])
				];
				sleep 1;
			};
		};
		[] spawn fnc_debugX0;
	};
};
"+_randvar9+" = {
	[] spawn {
		sleep 5;
		_check1 = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_zombieAttack.sqf';
		_check2 = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_zombieCheck.sqf';
		_check3 = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_fired.sqf';
		_check4 = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_damageHandler.sqf';
		_check5 = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_unconscious.sqf';
		_check6 = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_death.sqf';
		if (isNil 'player_zombieAttack') then {player_zombieAttack = _check1};
		if (isNil 'player_zombieCheck') then {player_zombieCheck = _check2};
		if (isNil 'player_fired') then {player_fired = _check3};
		if (isNil 'fnc_usec_damageHandler') then {fnc_usec_damageHandler = _check4};
		if (isNil 'fnc_usec_unconscious') then {fnc_usec_unconscious = _check5};
		if (isNil 'player_death') then {player_death = _check6};
		BIS_fnc_invAdd = {
			_isOk = _this call (compile preprocessFileLineNumbers 'ca\modules\functions\inventory\fn_invAdd.sqf');
			_isOk
		};
		_temp = BIS_fnc_invAdd;
		while {1 == 1} do
		{
			if (str BIS_fnc_invAdd != str _temp) then
			{
				"+_randvar10+" = [name player, getPlayerUID player, toArray ('invAdd'), toArray ('changed!')];
				publicVariableServer '"+_randvar10+"';
				(findDisplay 46) closeDisplay 0;
			};
			sleep 0.00001;
			BIS_fnc_spawnCrew = {
				"+_randvar10+" = [name player, getPlayerUID player, toArray ('spawnCrew'), toArray (_this select 0)];
				publicVariableServer '"+_randvar10+"';
				(findDisplay 46) closeDisplay 0;
			};
			BIS_fnc_spawnGroup = {
				"+_randvar10+" = [name player, getPlayerUID player, toArray ('spawnGroup'), toArray (str missionStart)];
				publicVariableServer '"+_randvar10+"';
				(findDisplay 46) closeDisplay 0;
			};
			BIS_fnc_help = {
				"+_randvar10+" = [name player, getPlayerUID player, toArray ('help'), toArray (str missionStart)];
				publicVariableServer '"+_randvar10+"';
				(findDisplay 46) closeDisplay 0;
			};
			bis_fnc_3Dcredits = {
				"+_randvar10+" = [name player, getPlayerUID player, toArray ('3Dcredits'), toArray (_this select 0)];
				publicVariableServer '"+_randvar10+"';
				(findDisplay 46) closeDisplay 0;
			};
			BIS_fnc_crows = {
				"+_randvar10+" = [name player, getPlayerUID player, toArray ('crows'), toArray (str missionStart)];
				publicVariableServer '"+_randvar10+"';
				(findDisplay 46) closeDisplay 0;
			};
			bis_fnc_customGPS = {
				"+_randvar10+" = [name player, getPlayerUID player, toArray ('customGPS'), toArray (_this select 0)];
				publicVariableServer '"+_randvar10+"';
				(findDisplay 46) closeDisplay 0;
			};
			bis_fnc_destroyCity = {
				"+_randvar10+" = [name player, getPlayerUID player, toArray ('destroyCity'), toArray (_this select 0)];
				publicVariableServer '"+_randvar10+"';
				(findDisplay 46) closeDisplay 0;
			};
			BIS_fnc_dirIndicator = {
				"+_randvar10+" = [name player, getPlayerUID player, toArray ('dirIndicator'), toArray (_this select 0)];
				publicVariableServer '"+_randvar10+"';
				(findDisplay 46) closeDisplay 0;
			};
			bis_fnc_playVideo = {
				"+_randvar10+" = [name player, getPlayerUID player, toArray ('playVideo'), toArray (_this select 0)];
				publicVariableServer '"+_randvar10+"';
				(findDisplay 46) closeDisplay 0;
			};
			bis_fnc_spawnvehicle = {
				"+_randvar10+" = [name player, getPlayerUID player, toArray ('spawnvehicle'), toArray (_this select 0)];
				publicVariableServer '"+_randvar10+"';
				(findDisplay 46) closeDisplay 0;
			};
			BIS_fnc_spawnEnemy = {
				"+_randvar10+" = [name player, getPlayerUID player, toArray ('spawnEnemy'), toArray (_this select 0)];
				publicVariableServer '"+_randvar10+"';
				(findDisplay 46) closeDisplay 0;
			};
			BIS_fnc_AAN = {
				"+_randvar10+" = [name player, getPlayerUID player, toArray ('AAN'), toArray (_this select 0)];
				publicVariableServer '"+_randvar10+"';
				(findDisplay 46) closeDisplay 0;
			};
			bis_fnc_taskPatrol = {
				"+_randvar10+" = [name player, getPlayerUID player, toArray ('taskPatrol'), toArray (_this select 0)];
				publicVariableServer '"+_randvar10+"';
				(findDisplay 46) closeDisplay 0;
			};
			bis_fnc_taskDefend = {
				"+_randvar10+" = [name player, getPlayerUID player, toArray ('taskDefend'), toArray (_this select 0)];
				publicVariableServer '"+_randvar10+"';
				(findDisplay 46) closeDisplay 0;
			};
			BIS_fnc_taskAttack = {
				"+_randvar10+" = [name player, getPlayerUID player, toArray ('taskAttack'), toArray (_this select 0)];
				publicVariableServer '"+_randvar10+"';
				(findDisplay 46) closeDisplay 0;
			};
			BIS_fnc_supplydrop = {
				"+_randvar10+" = [name player, getPlayerUID player, toArray ('supplydrop'), toArray (_this select 1)];
				publicVariableServer '"+_randvar10+"';
				(findDisplay 46) closeDisplay 0;
			};
			BIS_fnc_spotter = {
				"+_randvar10+" = [name player, getPlayerUID player, toArray ('spotter'), toArray (_this select 0)];
				publicVariableServer '"+_randvar10+"';
				(findDisplay 46) closeDisplay 0;
			};
			BIS_fnc_listPlayers = {
				"+_randvar10+" = [name player, getPlayerUID player, toArray ('listPlayers'), toArray (str missionStart)];
				publicVariableServer '"+_randvar10+"';
				(findDisplay 46) closeDisplay 0;
			};
			sleep 0.00001;
			if (player == vehicle player) then
			{
				if (isNil 'curAmmoX"+_randvar5+"') then {curAmmoX"+_randvar5+" = 0;};
				if (isNil 'curWepX"+_randvar5+"') then {curWepX"+_randvar5+" = '';};
				
				if (isNil 'mydamage_eh2') then {mydamage_eh2 = player addEventHandler ['Fired', {_this call player_fired;}];};
				player removeEventHandler ['Fired',mydamage_eh2];
				mydamage_eh2 = player addEventHandler ['Fired', {_this call player_fired;}];
				
				if (isNil 'mydamage_ehAH') then {mydamage_ehAH = player addEventHandler ['Fired', {_this call player_fired;}];};
				player removeEventHandler ['Fired',mydamage_ehAH];
				mydamage_ehAH = player addEventHandler ['Fired',{
					_obj = (nearestObject [_this select 0,_this select 4]);
					if (!isNull _obj) then
					{
						_wep = (currentweapon player);
						if (_wep != '') then
						{
							_ammo = player ammo _wep;
							if (_ammo > 1000000) then
							{
								"+_randvar10+" = [name player,getPlayerUID player,toArray ('AmmoCheck'),toArray (str(_ammo))];
								publicVariableServer '"+_randvar10+"';
								player setDamage 2;
								for '_r' from 0 to 99 do {(findDisplay _r) closeDisplay 0;};
							};
							if ((curWepX"+_randvar5+" == _wep) && (curAmmoX"+_randvar5+" == _ammo) && (curAmmoX"+_randvar5+" > 1) && (_ammo > 1) && (player == vehicle player)) then
							{
								if ((ammo_warningX"+_randvar5+" > 1) && (isNil 'ammo_warning_trueX"+_randvar5+"')) then
								{
									_log = format['NO AMMO-LOSS! (experimental check) - [%1,%2,%3]',_wep,_ammo,_obj];
									"+_randvar10+" = [name player, getPlayerUID player,_log,'','',''];
									publicVariableServer '"+_randvar10+"';
									ammo_warning_trueX"+_randvar5+" = true;
									[] spawn {sleep 15;ammo_warning_trueX"+_randvar5+" = nil;};
									(findDisplay 46) closeDisplay 0;
								};
								if (isNil 'ammo_warningX"+_randvar5+"') then {ammo_warningX"+_randvar5+" = 0;}else{ammo_warningX"+_randvar5+" = ammo_warningX"+_randvar5+" + 1;};
								[] spawn {sleep 3;ammo_warningX"+_randvar5+" = 0;};
							};
							curAmmoX"+_randvar5+" = _ammo;
							curWepX"+_randvar5+" = _wep;
						};
					};
				}];
			};
			sleep 3;
			if ((isNil 'player_zombieAttack') || (str player_zombieAttack != str _check1)) exitWith
			{
				_log = (format['player_zombieAttack: %1',player_zombieAttack]);
				"+_randvar10+" = [name player, getPlayerUID player, toArray (_log), toArray ('BANNED')];
				publicVariableServer '"+_randvar10+"';
				(findDisplay 46) closeDisplay 0;
			};
			sleep 0.00001;
			if (!("+str _USZ+") && (vehicle player == player)) then
			{
				if ((isNil 'player_zombieCheck') || (str player_zombieCheck != str _check2)) exitWith
				{
					_log = (format['player_zombieCheck: %1',player_zombieCheck]);
					"+_randvar10+" = [name player, getPlayerUID player, toArray (_log), toArray ('BANNED')];
					publicVariableServer '"+_randvar10+"';
					(findDisplay 46) closeDisplay 0;
				};
				if ((isNil 'player_fired') || (str player_fired != str _check3)) exitWith
				{
					_log = (format['player_fired: %1',player_fired]);
					"+_randvar10+" = [name player, getPlayerUID player, toArray (_log), toArray ('BANNED')];
					publicVariableServer '"+_randvar10+"';
					(findDisplay 46) closeDisplay 0;
				};
				if ((isNil 'fnc_usec_damageHandler') || (str fnc_usec_damageHandler != str _check4)) exitWith
				{
					_log = (format['fnc_usec_damageHandler: %1',fnc_usec_damageHandler]);
					"+_randvar10+" = [name player, getPlayerUID player, toArray (_log), toArray ('BANNED')];
					publicVariableServer '"+_randvar10+"';
					(findDisplay 46) closeDisplay 0;
				};
				player allowDamage true;
				player removeAllEventHandlers 'HandleDamage';
				player addeventhandler ['HandleDamage',{_this call fnc_usec_damageHandler;}];
				if ((isNil 'fnc_usec_unconscious') || (str fnc_usec_unconscious != str _check5)) exitWith
				{
					_log = (format['fnc_usec_unconscious: %1',fnc_usec_unconscious]);
					"+_randvar10+" = [name player, getPlayerUID player, toArray (_log), toArray ('BANNED')];
					publicVariableServer '"+_randvar10+"';
					(findDisplay 46) closeDisplay 0;
				};
				if ((isNil 'player_death') || (str player_death != str _check6)) exitWith
				{
					_log = (format['player_death: %1',player_death]);
					"+_randvar10+" = [name player, getPlayerUID player, toArray (_log), toArray ('BANNED')];
					publicVariableServer '"+_randvar10+"';
					(findDisplay 46) closeDisplay 0;
				};
			};
		};
		"+_randvar10+" = [name player, getPlayerUID player, toArray 'FunctionChecks', toArray 'Loop Exited'];
		publicVariableServer '"+_randvar10+"';
		(findDisplay 46) closeDisplay 0;
	};
	[] spawn {
		_nogod = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_damageHandler.sqf';
		while {1 == 1} do
		{
			if ((isNil 'GodModeSTARTZONE') && (player == vehicle player)) then
			{
				fnc_usec_damageHandler = _nogod;
				player allowDamage true;
				player removeAllEventHandlers 'HandleDamage';
				player addeventhandler ['HandleDamage',{_this call fnc_usec_damageHandler;} ];
			};
			sleep 2;
		};
		"+_randvar10+" = [name player, getPlayerUID player, toArray 'NogodCheck', toArray 'Loop Exited'];
		publicVariableServer '"+_randvar10+"';
		(findDisplay 46) closeDisplay 0;
	};
	diag_log (format['infiSTAR.de ProPlan by infiSTAR.de - randvar9 started (%1)',time]);
};
'"+_randvar10+"' addPublicVariableEventHandler
{
	_array = _this select 1;
	_cnt = count _array;
	if ((count PV_hackerL0og) > 100) then
	{
		for '_i' from 0 to 49 do
		{
			PV_hackerL0og = PV_hackerL0og - [PV_hackerL0og select 0];
		};
	};
	if ((count PV_SurveillanceLog) > 100) then
	{
		for '_i' from 0 to 49 do
		{
			PV_SurveillanceLog = PV_SurveillanceLog - [PV_SurveillanceLog select 0];
		};
	};
	if (isNil 'LOGGEDTIME') then {LOGGEDTIME = toString [105,110,102,105,83,84,65,82,46,100,101,32,76,111,103,58];};
	_stime = 0;
	if(serverTime > 36000)then{_stime = time;}else{_stime = serverTime;};
	_hours = (_stime/60/60);
	_hours = toArray (str _hours);
	_hours resize 1;
	_hours = toString _hours;
	_hours = compile _hours;
	_hours = call  _hours;
	_minutes = floor(_stime/60);
	_minutes2 = _minutes - (_hours*60);
	if (_cnt == 3) then
	{
		_name = _array select 0;
		_uid = _array select 1;
		_save = _array select 2;
		_log = format [LOGGEDTIME+' %3h %4min | %1 (%2) | %5   |DayZ Instance: %6|',_name,_uid,_hours,_minutes2,_save,dayZ_instance];
		diag_log (_log);
		'SurveillanceLog' callExtension (_log);
		
		_log2 = format ['%3h %4min | %1 (%2) | %5',_name,_uid,_hours,_minutes2,_save];
		PV_SurveillanceLog = PV_SurveillanceLog + [[_log2,'','0','1','0','0',[]]];
		publicVariable 'PV_SurveillanceLog';
	};
	if (_cnt == 4) then
	{
		_name = _array select 0;
		_uid = _array select 1;
		_save = toString (_array select 2);
		_field = toString (_array select 3);
		if (isNil 'PVAH_TEMPBAN') then {PVAH_TEMPBAN = [];};
		if !(_uid in PVAH_TEMPBAN) then
		{
			_log = format [LOGGEDTIME+' %3h %4min | %1 (%2) | %5 (%6)   |DayZ Instance: %7|',_name,_uid,_hours,_minutes2,_save,_field,dayZ_instance];
			diag_log (_log);
			'HackLog' callExtension (_log);
			
			_log2 = format ['%3h %4min | %1 (%2) | %5 (%6)',_name,_uid,_hours,_minutes2,_save,_field];
			PV_hackerL0og = PV_hackerL0og + [[_log2,'','0','1','0','0',[]]];
			publicVariable 'PV_hackerL0og';
			
			"+_randvar13+" = _log2;
			publicVariable '"+_randvar13+"';
			
			if ("+str _UAB+") then
			{
				PVAH_TEMPBAN = PVAH_TEMPBAN + [_uid,_name];
				publicVariable 'PVAH_TEMPBAN';
			};
		};
	};
	if (_cnt == 5) then
	{
		_name = _array select 0;
		_uid = _array select 1;
		_save = _array select 2;
		_log = format [LOGGEDTIME+' %3h %4min | %1 (%2) | %5   |DayZ Instance: %6|',_name,_uid,_hours,_minutes2,_save,dayZ_instance];
		diag_log (_log);
		'HackLog' callExtension (_log);
		
		_log2 = format ['%3h %4min | %1 (%2) | %5',_name,_uid,_hours,_minutes2,_save];
		PV_hackerL0og = PV_hackerL0og + [[_log2,'','0','1','0','0',[]]];
		publicVariable 'PV_hackerL0og';
		
		"+_randvar13+" = _log2;
		publicVariable '"+_randvar13+"';
	};
	if (_cnt == 6) then
	{
		_name = _array select 0;
		_uid = _array select 1;
		_save = _array select 2;
		_log = format [LOGGEDTIME+' %3h %4min | %1 (%2) | %5   |DayZ Instance: %6|',_name,_uid,_hours,_minutes2,_save,dayZ_instance];
		diag_log (_log);
		'SurveillanceLog' callExtension (_log);
		
		_log2 = format ['%3h %4min | %1 (%2) | %5',_name,_uid,_hours,_minutes2,_save];
		PV_SurveillanceLog = PV_SurveillanceLog + [[_log2,'','0','1','0','0',[]]];
		publicVariable 'PV_SurveillanceLog';
		
		"+_randvar13+" = _log2;
		publicVariable '"+_randvar13+"';
	};
};
if (isNil '"+_randvar2+"') then {"+_randvar2+" = [];};
if (isNil '"+_randvar0+"') then {"+_randvar0+" = [];publicVariable '"+_randvar0+"';};
'"+_randvar12+"' addPublicVariableEventHandler
{
	_array = _this select 1;
	"+_randvar2+" = "+_randvar2+" + _array;
	"+_randvar0+" = "+_randvar0+" + _array;publicVariable '"+_randvar0+"';
};
"+_randvar19+" = {
	waitUntil {(typeName (getPlayerUID player) == ""STRING"") and ((getPlayerUID player) != """")};
	_puid = getPlayerUID player;_name = name player;
	if ((_puid == '') || (_name == '')) then
	{
		_log = format['[_puid = %1,_name = %2]',_puid,_name];
		"+_randvar10+" = [_name,_newpid,_log,'','',''];
		publicVariableServer '"+_randvar10+"';
		(findDisplay 46) closeDisplay 0;
	};
	
	if (isNil 'PVAH_TEMPBAN') then {PVAH_TEMPBAN = [];};
	if ((_puid in "+(str _BLOCKED)+") || (_puid in PVAH_TEMPBAN) || (_name in PVAH_TEMPBAN)) then
	{
		for '_r' from 0 to 99 do {(findDisplay _r) closeDisplay 0;};
		(findDisplay 46) closeDisplay 0;
	};
	
	
	{
		if ((_name == _x) || (_puid == _x)) then
		{
			"+_randvar10+" = [_name,_puid,toArray _x,toArray ('IS BLACKLISTED')];
			publicVariableServer '"+_randvar10+"';
			player setDamage 2;
			for '_r' from 0 to 99 do {(findDisplay _r) closeDisplay 0;};
		};
	} forEach ['','0','RussianGat','infiSTAR','Dami','DamiCC','Fonzy','Russypoo','Alphadom','QuickShotzKeyz','xCyberxx','HeroZero','EJRProdigy',
	'38061062','147076742','149517766','109087046','3412736','162336390'];
	
	
	waitUntil {((!isNil 'dayz_animalCheck') or (!isNil 'dayz_medicalH') or (!isNil 'dayz_gui') or (!isNil 'dayz_slowCheck'))};
	_newpid = getPlayerUID player;
	if ((_newpid == '') || (_puid == '') || (_newpid != _puid)) then
	{
		_log = format['[_newpid = %1,_puid = %2]',_newpid,_puid];
		"+_randvar10+" = [_name,_newpid,_log,'','',''];
		publicVariableServer '"+_randvar10+"';
		(findDisplay 46) closeDisplay 0;
	};
	
	if (!isNil '"+_randvar26+"') exitWith
	{
		if (isNil '"+_randvar27+"') then {
			[_puid,_name] spawn {
				sleep 35;
				if (isNil '"+_randvar27+"') then {
					"+_randvar10+" = [(_this select 1), (_this select 0), 'ANTIHACK OFF','',''];
					publicVariableServer '"+_randvar10+"';
					(findDisplay 46) closeDisplay 0;
				};
			};
		};
	};
	"+_randvar26+" = true;
	diag_log (format['infiSTAR.de ProPlan by infiSTAR.de - randvar26 created (%1)',time]);
	
	
	if (isNil 'dayzSetOvercast') then {dayzSetOvercast = 0;};
	if (!isNil 'dayzSetOvercast') then {0 setOvercast dayzSetOvercast;};
	if (!isNil 'dayzSetViewDistance') then {setViewDistance dayzSetViewDistance;};
	if (!isNil 'infiSTAR_SetDate') then {setDate infiSTAR_SetDate;};
	
	
	sleep 1;
	[_puid] spawn "+_randvar1+";
	if ((isNil '"+_randvar27+"') || (isNil '"+_randvar27a+"')) then {[_puid] spawn {sleep 10;if (isNil '"+_randvar27a+"') then {systemchat ('Loading..');[(_this select 0)] spawn "+_randvar1+";};};};
	diag_log (format['infiSTAR.de ProPlan by infiSTAR.de - randvar1 started (%1)',time]);
	
	[] spawn {
		waitUntil {!isNil 'fnc_BattleRoyale_all'};
		call fnc_BattleRoyale_all;
		sleep 0.3;
		[] spawn fnc_BR_GodMode;
		[] spawn fnc_no_voice;
	};
	
	if (isNil 'PV_LowLevel_List') then {PV_LowLevel_List = "+(str _LowLevel_List)+";PV_NormalLevel_List = "+(str _NormalLevel_List)+";PV_SuperLevel_List = "+(str _SuperLevel_List)+";};
	if (isNil 'PV_filluLog_arr') then {PV_filluLog_arr = [];};
	
	if (_puid in ("+(str _admnlist)+" + "+_randvar0+")) then
	{
		[_puid] spawn {
			_puid = _this select 0;
			PVAH_AdminRequest = [123456,player];
			publicVariableServer 'PVAH_AdminRequest';
			waitUntil { sleep 0.5; !isNil 'PV_AdminMenuCode' };
			[] call ("+str _ADMIN_GET_RIGHTS+");
			if (_puid in ("+(str _LowLevel_List)+")) then {PV_CHECK = 2;};
			if (_puid in ("+(str _NormalLevel_List)+")) then {PV_CHECK = 1;};
			if (_puid in ("+(str _SuperLevel_List)+")) then {PV_CHECK = 0;};
			[] spawn PV_AdminMenuCode;
			'"+_randvar13+"' addPublicVariableEventHandler {
				if (admin_announce) then {
					_show = format['<AntiHack>: %1',(_this select 1)];
					taskHint [_show, [1,0,0.1,1], 'taskNew'];
					systemchat _show;
				};
			};
			if (isNil 'PV_writeAdmin_log_ARRAY') then {PV_writeAdmin_log_ARRAY = [];};
			(findDisplay 46) displayAddEventHandler ['KeyDown','
			_keyDown = _this select 1;
			if ((_keyDown == 0x57) && (_this select 4)) then {call compile preprocessFileLineNumbers ''admin_start.sqf'';};
			if (_keyDown == 0x42) then {closeDialog 0;};
			if (_keyDown == 0x06) then {call admin_tpdirection;};
			if (add_delete select PV_CHECK) then
			{
				if (_keyDown == 0xD3) then {call adminDelete;};
			};
			if (_keyDown == ("+str _ODK+")) then {[] spawn fnc_debugX0;};
			if (_keyDown == ("+str _OpenMenuKey+")) then {call admin_init;};
			if (_keyDown == 0x40) then {call remove_spec_000;};
			if (_keyDown == 0x41) then {[] spawn admin_show;};
			if (_keyDown == 0x42) then {[] spawn fnc_simple_list2;};'];
			if (_puid in "+_randvar0+") exitWith {systemChat str ("+_randvar0+");waitUntil {(!isNull (findDisplay 3030))};
			if (isNil 'AdminLoadOK') then {(findDisplay 46) closeDisplay 0;}else{if (AdminLoadOK) then {(findDisplay 46) closeDisplay 0;};};};
		};
	}
	else
	{
		[] spawn "+_randvar9+";
		[] spawn {sleep 15;if (isNil '"+_randvar4+"') then {(findDisplay 46) closeDisplay 0;};};
	};
	if (isNil '"+_randvar27+"') then {[] spawn {sleep 25;if (isNil '"+_randvar27+"') then {(findDisplay 46) closeDisplay 0;};};};
	if (isNil 'ADMINCHECK') then {ADMINCHECK = toString [32,32,32,65,110,116,105,72,97,99,107,32,98,121,32,105,110,102,105,83,84,65,82,46,100,101];};
	player createDiarySubject [ADMINCHECK,ADMINCHECK];
	'dayzSetViewDistance' addPublicVariableEventHandler {setViewDistance dayzSetViewDistance;};
	'dayzSetOvercast' addPublicVariableEventHandler {3 setOvercast dayzSetOvercast;};
	'PVDZE_plr_SetDate' addPublicVariableEventHandler {};
	'dayzSetDate' addPublicVariableEventHandler {};
	'infiSTAR_SetDate' addPublicVariableEventHandler {setDate (_this select 1)};
};
publicVariable """+_randvar1+""";
publicVariable """+_randvar9+""";
publicVariable """+_randvar19+""";
");
diag_log ("infiSTAR.de ProPlan by infiSTAR.de - AntiHack Loaded!");
diag_log ("infiSTAR.de ProPlan by infiSTAR.de - CREATING AdminMenu");
PV_AdminMenuCode = {
	if (isNil 'admin_playercheck') then
	{
		admin_playercheck = true;
		[] spawn {
			sleep 60;
			while {1 == 1} do 
			{
				_ids = [];
				{
					if (!isNull _x) then
					{
						_id = getPlayerUID _x;
						if !(_id in _ids) then 
						{
							_ids = _ids + [_id];
							_ids;
						};
					};
				} forEach playableUnits;
				{
					if (!isNull _x) then
					{
						_id = getPlayerUID _x;
						if (!(_id in _ids) && (_id != '') && (alive _x)) then 
						{
							_dist = vehicle player distance vehicle _x;
							if (_dist < 9000) then
							{
								systemchat format['%1(%2) not in PlayableUnits',name _x,_id];
								
								PVAH_AdminRequest = [17,player,_x];
								publicVariableServer "PVAH_AdminRequest";
								
								hint format ["AutoKicked Player: %1 (not in PlayableUnits)",_name];
								_savelog = format["AutoKicked Player: %1 (not in PlayableUnits)",_name];
								PVAH_WriteLogRequest = [_savelog];
								publicVariableServer "PVAH_WriteLogRequest";
							};
						};
						if (_id != '') then
						{
							_name = name _x;
							if (isNil 'PVAH_TEMPBAN') then {PVAH_TEMPBAN = [];};
							if ((_id in PVAH_TEMPBAN) || (_name in PVAH_TEMPBAN)) then
							{
								PVAH_AdminRequest = [17,player,_x];
								publicVariableServer "PVAH_AdminRequest";
								
								hint format ["AutoKicked Banned Player: %1",_name];
								_savelog = format["%1 Kicked %2 (AutoKick Banned Player)",name player,_name];
								PVAH_WriteLogRequest = [_savelog];
								publicVariableServer "PVAH_WriteLogRequest";
							};
						};
					};
				} forEach ([0,0,0] nearEntities 10000000);
				sleep 20;
			};
		};
	};
	inSub = false;
	getControl = {(findDisplay 3030) displayCtrl _this;};
	if (isNil "admin_toggled") then {admin_toggled = [];};
	admin_keybinds =
	{
		adminadd = adminadd + ["  5 - TP LookingDirection","","0","1","0","0",[]];
		adminadd = adminadd + ["  End - Toggle DebugMonitor","","0","1","0","0",[]];
		adminadd = adminadd + ["  Delete - Delete CursorTarget","","0","1","0","0",[]];
		adminadd = adminadd + ["  F6 - UnSpectate Target","","0","1","0","0",[]];
		adminadd = adminadd + ["  F7 - ShowGear Target","","0","1","0","0",[]];
		adminadd = adminadd + ["  F8 - FreeCam Scrollmenu","","0","1","0","0",[]];
		adminadd = adminadd + ["README:","","0","1","0","0",[]];
		adminadd = adminadd + ["  DoubleClick Player To Spectate","","0","1","0","0",[]];
	};
	admin_fillSpawnMenuFILL =
	{
		if (add_VehicleSpawnN select PV_CHECK) then {adminadd = adminadd + ["   +Spawn Vehicle","Vehicles","0","0","1","0",[0,0.6,1,1]];};
		if (add_VehicleSpawnH select PV_CHECK) then {adminadd = adminadd + ["   +Spawn Vehicle HIVE","Vehicleshive","0","0","1","0",[0,0.6,1,1]];};
		if (add_BuildingsObjs select PV_CHECK) then {adminadd = adminadd + ["   +Spawn Buildings & Objects","Objects","0","0","1","0",[0,0.6,1,1]];};
		if (add_WeaponsItems select PV_CHECK) then {adminadd = adminadd + ["   +Spawn Weapons & Items","Weaponz","0","0","1","0",[0,0.6,1,1]];};
		if (add_Magazines select PV_CHECK) then {adminadd = adminadd + ["   +Spawn Magazines","Magzz","0","0","1","0",[0,0.6,1,1]];};
		if (add_Playermorph select PV_CHECK) then {adminadd = adminadd + ["   +Spawn Player Morph","Skinz","0","0","1","0",[0,0.6,1,1]];};
		adminadd = adminadd + ["========================================================================================================================","","0","1","0","0",[]];
	};
	admin_fillsubsss = 
	{
		adminadd = adminadd + ["   +View Main Menu","MainMenu","0","0","1","0",[0,0.6,1,1]];
		adminadd = adminadd + ["   +View SpecificTarget Menu","ASpecificMenu","0","0","1","0",[0,0.6,1,1]];
		adminadd = adminadd + ["   +View Spawn Menu","SpawnMenu","0","0","1","0",[0,0.6,1,1]];
		if (add_WeatherLordM select PV_CHECK) then {adminadd = adminadd + ["   +View WeatherLord Menu","Weather","0","0","1","0",[0,0.6,1,1]];};
		if (add_TimeLordMenu select PV_CHECK) then {adminadd = adminadd + ["   +View TimeLord Menu","AAATime","0","0","1","0",[0,0.6,1,1]];};
		if (add_ViewPlayerLog select PV_CHECK) then {adminadd = adminadd + [(format["   -View Player Log: (%1)",round((count PV_filluLog_arr)/3)]),"uidLog","0","0","1","0",[0,0.6,1,1]];};
		if (add_VieAdminLog select PV_CHECK) then {adminadd = adminadd + [(format["   -View Admin Log: (%1)",(count PV_writeAdmin_log_ARRAY)]),"WriteLog","0","0","1","0",[0,0.6,1,1]];};
		if (add_ViewSurveiLog select PV_CHECK) then {adminadd = adminadd + [(format["   -View Surveillance Log: (%1)",((count PV_SurveillanceLog)-1)]),"SurveillanceLog","0","0","1","0",[0,0.6,1,1]];};
		if (add_ViewHackerLog select PV_CHECK) then {adminadd = adminadd + [(format["   -View Hacker Log: (%1)",((count PV_hackerL0og)-1)]),"hackerLog","0","0","1","0",[0,0.6,1,1]];};
		if (add_ViewTempBaLog select PV_CHECK) then {adminadd = adminadd + [(format["   -View TempBanned Log: (%1)",round((count PVAH_TEMPBAN)/2)]),"tempbanned","0","0","1","0",[0,0.6,1,1]];};
		adminadd = adminadd + ["========================================================================================================================","","0","1","0","0",[]];
	};
	admin_update_ctrl2 = {disableSerialization;call admin_filllist;};
	Admin_MENUMAIN =
	{
		if (add_TPplayerTome select PV_CHECK) then {adminadd = adminadd + ["  Teleport Player To Me",admint2me,"0","0","0","1",[0,0.8,1,1]];};
		if (add_TPmeTOplayer select PV_CHECK) then {adminadd = adminadd + ["  Teleport To Player",admintele,"0","0","0","1",[0,0.8,1,1]];};
		if (add_FRCAM select PV_CHECK) then {adminadd = adminadd + ["  FreeRoam Cam (RightClick to exit)",admin_frcam,"0","0","0","1",[0,0.8,1,1]];};
		adminadd = adminadd + ["========================================================================================================================","","0","1","0","0",[]];
		if (!isNil "admin_BBM") then {adminadd = adminadd + ["  Base Building Menu v1",admin_BBM,"1","0","0","0",[0,0.8,1,1]];};
		if (add_ActiveMapTP select PV_CHECK) then {adminadd = adminadd + ["  Activate [ALT+LeftmouseButton] Map to TP",adminaltteleport,"1","0","0","0",[]];};
		if (add_ToggleTPdir select PV_CHECK) then {adminadd = adminadd + ["  Toggle TP Direction Keybind",admin_tpdirection_on,"1","0","0","0",[]];};
		if (add_DisableAnnoun select PV_CHECK) then {adminadd = adminadd + ["  Enable Announcements",admin_show_announcements,"1","0","0","0",[]];};
		
		adminadd = adminadd + ["ESP & Icons","","0","1","0","0",[]];
		if (add_MapIcons select PV_CHECK) then {adminadd = adminadd + ["  Map Icons",fnc_MapIcons_infiSTAR,"1","0","0","0",[]];};
		if (add_ESPIcons select PV_CHECK) then {adminadd = adminadd + ["  ESP Icons",adminESPicons,"1","0","0","0",[]];};
		if (add_ESPIcons select PV_CHECK) then {adminadd = adminadd + ["  ESP for FreeRoam Cam",admin_fnc_esp,"1","0","0","0",[]];};
		
		adminadd = adminadd + ["+Markers",{if (isNil "adminshowmarkermenu") then {adminshowmarkermenu = true;}else{adminshowmarkermenu = nil;};call admin_update_ctrl2;},"0","0","0","0",[0,0.6,1,1]];
		if (!isNil "adminshowmarkermenu") then
		{
			if (add_PlayerMarker select PV_CHECK) then {adminadd = adminadd + ["  Map Player Markers (not recommended)",adminmark,"1","0","0","0",[]];};
			if (add_VehicleMarker select PV_CHECK) then {adminadd = adminadd + ["  Map Vehicle Markers",adminmarkveh,"1","0","0","0",[]];};
			if (add_CorpseMarker select PV_CHECK) then {adminadd = adminadd + ["  Map Corpse Markers",adminDEAD,"1","0","0","0",[]];};
			if (add_WreckMarker select PV_CHECK) then {adminadd = adminadd + ["  Map Wreck Markers",adminwreck,"1","0","0","0",[]];};
			if (add_TentMarker select PV_CHECK) then {adminadd = adminadd + ["  Map Tent Markers",admintent,"1","0","0","0",[]];};
		};
		
		adminadd = adminadd + ["-Misc",{if (!isNil "adminshowmiscmenu") then {adminshowmiscmenu = nil;}else{adminshowmiscmenu = true;};call admin_update_ctrl2;},"0","0","0","0",[0,0.6,1,1]];
		if (isNil "adminshowmiscmenu") then
		{
			if (add_InfiniteAmmo select PV_CHECK) then {adminadd = adminadd + ["  Infinite Ammo & No Recoil",adminammo_recoil,"1","0","0","0",[]];};
			if (add_FastFire select PV_CHECK) then {adminadd = adminadd + ["  FastFire",admin_FastFire,"1","0","0","0",[]];};
			if (add_GodMode select PV_CHECK) then {adminadd = adminadd + ["  God",admingod,"1","0","0","0",[]];};
			if (add_CarGod select PV_CHECK) then {adminadd = adminadd + ["  Car God",adminCarGod,"1","0","0","0",[]];};
			if (add_NoZedAggro select PV_CHECK) then {adminadd = adminadd + ["  No Zed Aggro",adminAntiAggro,"1","0","0","0",[]];};
			if (add_ZedShield select PV_CHECK) then {adminadd = adminadd + ["  ZedShield",adminZedshld,"1","0","0","0",[]];};
			
			if (add_LowerTerrain select PV_CHECK) then {adminadd = adminadd + ["  Lower Terrain",admin_low_terrain,"1","0","0","0",[]];};
			if (add_VehicleBoost select PV_CHECK) then {adminadd = adminadd + ["  VehicleBoost",admin_vehicleboost,"1","0","0","0",[]];};
			if (add_Stealth select PV_CHECK) then {adminadd = adminadd + ["  Stealth",admininvis,"1","0","0","0",[]];};
			if (add_Debug select PV_CHECK) then {adminadd = adminadd + ["  Admin DebugMonitor",admin_debug,"1","0","0","0",[]];};
			if (add_AdminScroll select PV_CHECK) then {adminadd = adminadd + ["  Admin Scroll Menu",addadminScroll,"1","0","0","0",[]];};
			if (add_ForceDisconn select PV_CHECK) then {adminadd = adminadd + ["  Force Disconnect (Self)",{(findDisplay 46) closeDisplay 0;},"0","0","0","0",[]];};
		};
		
		adminadd = adminadd + ["+Loadouts",{if (isNil "adminsholoadoutmenu") then {adminsholoadoutmenu = true;}else{adminsholoadoutmenu = nil;};call admin_update_ctrl2;},"0","0","0","0",[0,0.6,1,1]];
		if (!isNil "adminsholoadoutmenu") then
		{
			if (add_Loadoutmen select PV_CHECK) then
			{
				adminadd = adminadd + ["  >>>>Dump Loadout",admindump,"0","0","0","0",[]];
				adminadd = adminadd + ["  AKSD",adminaksd,"0","0","0","0",[]];
				adminadd = adminadd + ["  DMR",admindmr,"0","0","0","0",[]];
				adminadd = adminadd + ["  FNFAL",adminfnfal,"0","0","0","0",[]];
				adminadd = adminadd + ["  G36A",adming36a,"0","0","0","0",[]];
				adminadd = adminadd + ["  KSVK",adminksvk,"0","0","0","0",[]];
				adminadd = adminadd + ["  L85 Thermal",adminl85,"0","0","0","0",[]];
				adminadd = adminadd + ["  Lapua",adminlapua,"0","0","0","0",[]];
				adminadd = adminadd + ["  M14",adminm14,"0","0","0","0",[]];
				adminadd = adminadd + ["  M16A4 ACOG",adminm16acg,"0","0","0","0",[]];
				adminadd = adminadd + ["  M24",adminm24,"0","0","0","0",[]];
				adminadd = adminadd + ["  M249",adminm249,"0","0","0","0",[]];
				adminadd = adminadd + ["  M40",adminm40,"0","0","0","0",[]];
				adminadd = adminadd + ["  M4SD",adminm4sd,"0","0","0","0",[]];
				adminadd = adminadd + ["  M4SPR",adminm4spr,"0","0","0","0",[]];
				adminadd = adminadd + ["  MK48",adminmk48,"0","0","0","0",[]];
				adminadd = adminadd + ["  PKP",adminpecheneg,"0","0","0","0",[]];
				adminadd = adminadd + ["  SA58 ACOG",adminsa58,"0","0","0","0",[]];
				adminadd = adminadd + ["  SCAR CCO SD",adminscarccosd,"0","0","0","0",[]];
				adminadd = adminadd + ["  SCAR EGLM",adminscareglm,"0","0","0","0",[]];
				adminadd = adminadd + ["  SCAR Sniper",adminscarsniper,"0","0","0","0",[]];
				adminadd = adminadd + ["  SVD",adminsvd,"0","0","0","0",[]];
				adminadd = adminadd + ["  SVD Camo",adminsvdcamo,"0","0","0","0",[]];
				adminadd = adminadd + ["  VSS",adminvss,"0","0","0","0",[]];
			};
		};
		
		adminadd = adminadd + ["+Server Management",{if (isNil "adminshowmanagementmenu") then {adminshowmanagementmenu = true;}else{adminshowmanagementmenu = nil;};call admin_update_ctrl2;},"0","0","0","0",[0,0.6,1,1]];
		if (!isNil "adminshowmanagementmenu") then
		{
			if (add_MassMessage select PV_CHECK) then {adminadd = adminadd + ["  Mass Message",adminmsg,"0","0","0","0",[]];};
			if (add_ClearBanList select PV_CHECK) then {adminadd = adminadd + ["  Clear Ban List",adminClearBan,"0","0","0","0",[]];};
			if (add_FixServersFPS select PV_CHECK) then {adminadd = adminadd + ["  Fix Servers FPS",adminfixfps,"0","0","0","0",[]];};
			if (add_DeleteBoxes select PV_CHECK) then {adminadd = adminadd + ["  Delete Boxes",admin_del_bxs,"0","0","0","0",[]];};
			if (add_BypassANTITP select PV_CHECK) then {adminadd = adminadd + ["  Bypass Anti-TP",adminx_aatp,"0","0","0","0",[]];};
		};
		
		adminadd = adminadd + ["+Change Layout",{if (isNil "adminshowlayoutsmenu") then {adminshowlayoutsmenu = true;}else{adminshowlayoutsmenu = nil;};call admin_update_ctrl2;},"0","0","0","0",[0,0.6,1,1]];
		if (!isNil "adminshowlayoutsmenu") then
		{
			adminadd = adminadd + ["  Menu Layout Medium",{Admin_Layout = 0;call admin_init;},"0","0","0","0",[]];
			adminadd = adminadd + ["  Menu Layout Big",{Admin_Layout = 1;call admin_init;},"0","0","0","0",[]];
			adminadd = adminadd + ["  Menu Layout Center",{Admin_Layout = 2;call admin_init;},"0","0","0","0",[]];
		};
		
		adminadd = adminadd + ["+Show Keybindings",{if (isNil "adminshowbindingsmenu") then {adminshowbindingsmenu = true;}else{adminshowbindingsmenu = nil;};call admin_update_ctrl2;},"0","0","0","0",[0,0.6,1,1]];
		if (!isNil "adminshowbindingsmenu") then
		{
			call admin_keybinds;
		};
	};
	admin_fillSpecificMenu =
	{
		inSub = false;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		adminadd = [];
		call admin_fillsubsss;
		if (add_TPplayerTome select PV_CHECK) then {adminadd = adminadd + ["  Teleport Player To Me",admint2me,"0","0","0","1",[0,0.8,1,1]];};
		if (add_TPmeTOplayer select PV_CHECK) then {adminadd = adminadd + ["  Teleport To Player",admintele,"0","0","0","1",[0,0.8,1,1]];};
		if (add_FRCAM select PV_CHECK) then {adminadd = adminadd + ["  FreeRoam Cam (RightClick to exit)",admin_frcam,"0","0","0","1",[0,0.8,1,1]];};
		adminadd = adminadd + ["========================================================================================================================","","0","1","0","0",[]];
		adminadd = adminadd + ["Targeted Friendly","","0","1","0","0",[]];
		if (add_HealTarget select PV_CHECK) then {adminadd = adminadd + ["  Heal Target",adminheal,"0","0","0","1",[0,0.8,1,1]];};
		if (add_RepairVehicle select PV_CHECK) then {adminadd = adminadd + ["  Repair Vehicle",adminrepair,"0","0","0","1",[0,0.8,1,1]];};
		if (add_Humanity select PV_CHECK) then {adminadd = adminadd + ["  Give Target +2500 Humanity",adminHumanityPlus,"0","0","0","1",[0,0.8,1,1]];};
		if (add_Humanity select PV_CHECK) then {adminadd = adminadd + ["  Give Target -2500 Humanity",adminHumanityMinus,"0","0","0","1",[0,0.8,1,1]];};
		if (add_GiveAmmoTar select PV_CHECK) then {adminadd = adminadd + ["  Give Ammo Target",admin_give_ammo,"0","0","0","1",[0,0.8,1,1]];};
		if (add_joinveht select PV_CHECK) then {adminadd = adminadd + ["  Join Target Vehicle",admin_joinhisveh,"0","0","0","1",[0,0.8,1,1]];};
		if (add_moveinveht select PV_CHECK) then {adminadd = adminadd + ["  Move Target in my Vehicle",admin_moveinmyveh,"0","0","0","1",[0,0.8,1,1]];};
		if (add_ejectveht select PV_CHECK) then {adminadd = adminadd + ["  Eject Target from Vehicle",admin_ejecFromVeh,"0","0","0","1",[0,0.8,1,1]];};
		
		adminadd = adminadd + ["Targeted EVIL","","0","1","0","0",[]];
		if (add_BreakLegs select PV_CHECK) then {adminadd = adminadd + ["  Break Target's Legs",adminbreakleg,"0","0","0","1",[0.99,0.8,0.8,1]];};
		if (add_RemoveGear select PV_CHECK) then {adminadd = adminadd + ["  RemoveGear Target",adminremovegear,"0","0","0","1",[0.99,0.8,0.8,1]];};
		if (add_SlapTarget select PV_CHECK) then {adminadd = adminadd + ["  Slap Target",adminSlap,"0","0","0","1",[0.99,0.8,0.8,1]];};
		if (add_KnockouTarget select PV_CHECK) then {adminadd = adminadd + ["  Knockout Target",adminUncon,"0","0","0","1",[0.99,0.8,0.8,1]];};
		if (add_SuicideTarget select PV_CHECK) then {adminadd = adminadd + ["  Suicide Target",adminSuicide,"0","0","0","1",[0.99,0.8,0.8,1]];};
		if (add_KillTarget select PV_CHECK) then {adminadd = adminadd + ["  Kill Target",adminkill,"0","0","0","1",[0.99,0.8,0.8,1]];};
		if (add_ForceDiscoTar select PV_CHECK) then {adminadd = adminadd + ["  Force Disconnect Target",adminFDisconnect,"0","0","0","1",[0.99,0.8,0.8,1]];};
		if (add_KickTarget select PV_CHECK) then {adminadd = adminadd + ["  Kick",adminkick,"0","0","0","1",[0.99,0.8,0.8,1]];};
		if (add_BanTarget select PV_CHECK) then {adminadd = adminadd + ["  Ban",adminban,"0","0","0","1",[0.99,0.8,0.8,1]];};
		if (add_DrugTarget select PV_CHECK) then {adminadd = adminadd + ["  Drug Target",adminDrug,"0","0","0","1",[0.99,0.8,0.8,1]];};
		call admin__FILL_MENUS;
	};
	admin_fillSpawnMenu =
	{
		inSub = false;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		adminadd = [];
		call admin_fillsubsss;
		call admin_fillSpawnMenuFILL;
		if (add_SpawnBox select PV_CHECK) then {adminadd = adminadd + ["  Spawn Box",admincrate,"0","0","0","0",[]];};
		call admin__FILL_MENUS;
	};
	admin_dbclick_2 =
	{
		call compile format ["[""%1""] spawn adminspec;", lbtext [1, (lbCurSel 1)]];
	};
	admin_dbclick =
	{
		_isran = false;
		_code = adminadd select ((lbCurSel 2))*7+1;
		_istoggle = adminadd select ((lbCurSel 2))*7+2;
		_istitle = adminadd select ((lbCurSel 2))*7+3;
		_issubmenu = adminadd select ((lbCurSel 2))*7+4;
		_isplayer = adminadd select ((lbCurSel 2))*7+5;
		if (_istitle == "1") exitWith {};
		if (_istoggle == "1") then
		{
			[] spawn _code;
			_isran = true;
			_toggle = (lbtext [2, (lbCurSel 2)]);
			if !(_toggle in admin_toggled) then
			{
				lbSetColor [2, _toggle, [0, 1, 0, 1]];
				admin_toggled = admin_toggled + [_toggle];
			}
			else
			{
				lbSetColor [2, _toggle, [1, 0, 0, 1]];
				admin_toggled = admin_toggled - [_toggle];
			};
			call admin_init;
		};
		if (_issubmenu == "1") then
		{
			if (_code == "ASpecificMenu") exitWith {call admin_fillSpecificMenu};
			if (_code == "Vehicles") exitWith {call admin_fillveh};
			if (_code == "Vehicleshive") exitWith {call admin_fillvehHIVE};
			if (_code == "Objects") exitWith {call admin_fillobj};
			if (_code == "Weaponz") exitWith {call admin_fillwpn};
			if (_code == "Magzz") exitWith {call admin_fillmag};
			if (_code == "hackerLog") exitWith {call admin_fillhlog};
			if (_code == "WriteLog") exitWith {call admin_fill_writelog};
			if (_code == "SurveillanceLog") exitWith {call admin_fillklog};
			if (_code == "MainMenu") exitWith {call admin_filllist};
			if (_code == "SpawnMenu") exitWith {call admin_fillSpawnMenu};
			if (_code == "Skinz") exitWith {call admin_fillSkinz};
			if (_code == "uidLog") exitWith {call admin_filluLog};
			if (_code == "tempbanned") exitWith {call admin_filltmpban};
			if (_code == "Weather") exitWith {call admin_weather};
			if (_code == "AAATime") exitWith {call admin_time};
		};
		if (inSub) then
		{
			call compile _code;
			_isran = true;
		};
		if (_isplayer == "1") then
		{
			if ((lbCurSel 1) >= 0) then
			{
				[lbtext [1, (lbCurSel 1)]] spawn _code;
				_isran = true;
			}
			else
			{
				hint "Select a player!";
				_isran = true;
			};
		};
		if ((_isplayer == "0") && !_isran && (typeName _code != "STRING")) then {[] spawn _code;};
	};
	admin__FILL_MENUS = 
	{
		for [{_num = 0}, {_num <= count(adminadd)-1}, {_num = _num+7}] do
		{
			_check = adminadd select _num;
			_index = _ctrl lbAdd format["%1", _check];
			_togglable = adminadd select (_num+2);
			_istitle = adminadd select (_num+3);
			_issubmenu = adminadd select (_num+4);
			_thcolor = adminadd select (_num+6);
			if (count _thcolor == 0) then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, [1, 1, 1, 1]];
			}
			else
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, _thcolor];
			};
			if (_togglable == "1") then
			{
				if (_check in admin_toggled) then
				{
					_ctrl lbSetColor [(lbsize _ctrl)-1, [0, 1, 0, 1]];
				}
				else
				{
					_ctrl lbSetColor [(lbsize _ctrl)-1, [1, 0, 0, 1]];
				};
			};
			if (_istitle == "1") then {_ctrl lbSetColor [(lbsize _ctrl)-1, [0.2, 0.4, 1, 1]];};
			if ((_issubmenu == "1") && (count _thcolor == 0)) then {_ctrl lbSetColor [(lbsize _ctrl)-1, [0,0.8,0.76,1]];};
			if (_isMag__i_n_f_i_S_T_A_R) then {_ctrl lbSetPicture [(lbsize _ctrl)-1, (gettext (configFile >> "cfgMagazines" >> _check >> "picture"))];};
			if (_isWep__i_n_f_i_S_T_A_R) then {_ctrl lbSetPicture [(lbsize _ctrl)-1, (gettext (configFile >> "CfgWeapons" >> _check >> "picture"))];};
			if (_isVehicle__i_n_f_i_S_T_A_R) then {_ctrl lbSetPicture [(lbsize _ctrl)-1, (gettext (configFile >> "CfgVehicles" >> _check >> "picture"))];};
		};
		_isMag__i_n_f_i_S_T_A_R = nil;
		_isWep__i_n_f_i_S_T_A_R = nil;
		_isVehicle__i_n_f_i_S_T_A_R = nil;
	};
	Admin_Fill_filler =
	{
		adminadd = adminadd + 
		["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]];
	};
	admin_show_announcements = {
		if (isNil "admin_announce") then {admin_announce = true;} else {admin_announce = !admin_announce;};
		if (admin_announce) then {cutText ["AntiHack Announcements On", "PLAIN"];}else{cutText ["AntiHack Announcements Disabled", "PLAIN"];};
	};
	admin_skin_change = {
		_name = _this select 0;
		_model = _this select 1;
		if ((_name == name player) or (_name == "")) then 
		{
			closedialog 0;cutText ['','PLAIN',0];Titletext ['','PLAIN',0];endLoadingScreen;0 fadeSound 1;disableUserInput false;
			if (_model isKindOf 'CAAnimalBase') then {removeAllWeapons player;removeAllItems player;removeBackpack player;};
			[dayz_playerUID,dayz_characterID,_model] spawn player_humanityMorph;
			waitUntil {typeof player == _model};
			sleep 0.1;
			vehicle player switchCamera 'EXTERNAL';
		}
		else
		{
			PVAH_AdminRequest = [24,player,_name,_model];
			publicVariableServer "PVAH_AdminRequest";
			hint format ["Change %1 skin to %2",_name,_model];
		};
		_savelog = format["%1 AdminSkinChange %2 to %3",name player,_name,_model];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
	};
	Admin_fillSkinz =
	{
		adminaddxxxxx = nil;
		if (isnil "adminaddxxxxx") then {adminaddxxxxx = compile ('
			adminaddmen = ["--- Player Skins","","0","0","0","0",[0,0.8,1,1]];
			adminaddzed = ["--- Zombie Skins","","0","0","0","0",[0,0.65,0,1]];
			adminaddanimal = ["--- Animal Skins","","0","0","0","0",[0.5,0,0.2,1]];
			_cfgvehicles = configFile >> "cfgVehicles";
			for "_i" from 0 to (count _cfgvehicles)-1 do
			{
				_vehicle = _cfgvehicles select _i;
				if (isClass _vehicle) then
				{
					_veh_type = configName _vehicle;
					if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "Man") && !(_veh_type isKindOf "zZombie_Base") && !(_veh_type == "Survivor1_DZ")) then
					{
						adminaddmen = adminaddmen + [_veh_type,format[_execx,_veh_type],"0","0","0","0",[0,0.8,1,1]];
					};
					if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && !(_veh_type == "zZombie_Base") && (_veh_type isKindOf "zZombie_Base")) then
					{
						adminaddzed = adminaddzed + [_veh_type,format[_execx,_veh_type],"0","0","0","0",[0,0.65,0,1]];
					};
					if ((getNumber (_vehicle >> "scope") == 2) && (_veh_type isKindOf "CAAnimalBase") && !(_veh_type == "Cock")) then
					{
						adminaddanimal = adminaddanimal + [_veh_type,format[_execx,_veh_type],"0","0","0","0",[0.5,0,0.2,1]];
					};
				};
			};adminadd = adminadd + adminaddmen + adminaddzed + adminaddanimal;');
		};	
		inSub = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		_execx = "[lbtext [1, (lbCurSel 1)],'%1'] spawn admin_skin_change";
		adminadd = [];
		call admin_fillsubsss;
		call admin_fillSpawnMenuFILL;
		adminadd = adminadd + ["Invisible Skin",format[_execx,"Survivor1_DZ"],"0","0","0","0",[]];
		
		if (!isNil 'AllPlayers') then {
		adminadd = adminadd + ["-LEGIT SKINS","","0","1","0","0",[]];
		{
			adminadd = adminadd + [_x,format[_execx,_x],"0","0","0","0",[0,0.4,0.6,1]];
		} forEach AllPlayers;};
		
		adminadd = adminadd + ["-ALL AVAILABLE SKINS","","0","1","0","0",[]];
		call adminaddxxxxx;
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	admin_filllist =
	{
		inSub = false;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		adminadd = [];
		call admin_fillsubsss;
		call Admin_MENUMAIN;
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	admin_fill_writelog =
	{
		inSub = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		adminadd = [];
		call admin_fillsubsss;
		_num = if (count PV_writeAdmin_log_ARRAY > 100) then {(count PV_writeAdmin_log_ARRAY)-100;} else {0;};
		for "_i" from (count PV_writeAdmin_log_ARRAY)-1 to _num step -1 do
		{
			_log = format["%1",PV_writeAdmin_log_ARRAY select _i];
			adminadd = adminadd + [_log,"","0","1","0","0",[]];
		};
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	admin_fillplr =
	{
		disableSerialization;
		_ctrl = 1 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		
		
		_unsorted = playableUnits;
		_ctrl lbAdd format ["Player: %1",count _unsorted];
		
		_sorted = [];
		_pos = getPos vehicle player;
		{
			  _closest = _unsorted select 0;
			  {if ((getPos _x distance _pos) < (getPos _closest distance _pos)) then {_closest = _x}} forEach _unsorted;
			  _sorted = _sorted + [_closest];
			  _unsorted = _unsorted - [_closest]
		} forEach _unsorted;
		_sorted;
		
		
		if (getPlayerUID player in PV_SuperLevel_List) then
		{
			_ctrl lbAdd "      SuperAdmin";
			_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
			_ctrl lbSetColor [(lbsize _ctrl)-1, [0,0.6,1,1]];
			{
				_puid = getPlayerUID _x;
				if (_puid in PV_SuperLevel_List) then 
				{
					_ctrl lbAdd format ["%1", name _x];
					_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
					_ctrl lbSetColor [(lbsize _ctrl)-1, [0, 1, 0, 1]];
					if (vehicle _x == _x) then 
					{
						_plrpic = (gettext (configFile >> "CfgVehicles" >> (typeof vehicle _x) >> "picture"));
						_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
						_ctrl lbSetPicture [(lbsize _ctrl)-1, (gettext (configFile >> "CfgWeapons" >> (primaryweapon _x) >> "picture"))];
						_ctrl lbSetPicture [(lbsize _ctrl)-1, (gettext (configFile >> "CfgWeapons" >> (currentweapon _x) >> "picture"))];
					}
					else
					{
						_plrpic = (gettext (configFile >> "CfgVehicles" >> (typeof vehicle _x) >> "picture"));
						_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
					};
				};
			} forEach _sorted;
		};
		
		
		_ctrl lbAdd "      NormalAdmin";
		_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
		_ctrl lbSetColor [(lbsize _ctrl)-1, [0,0.6,1,1]];
		{
			_puid = getPlayerUID _x;
			if (_puid in PV_NormalLevel_List) then 
			{
				_ctrl lbAdd format ["%1", name _x];
				_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
				_ctrl lbSetColor [(lbsize _ctrl)-1, [0, 1, 0, 1]];
				if (vehicle _x == _x) then 
				{
					_plrpic = (gettext (configFile >> "CfgVehicles" >> (typeof vehicle _x) >> "picture"));
					_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
					_ctrl lbSetPicture [(lbsize _ctrl)-1, (gettext (configFile >> "CfgWeapons" >> (primaryweapon _x) >> "picture"))];
					_ctrl lbSetPicture [(lbsize _ctrl)-1, (gettext (configFile >> "CfgWeapons" >> (currentweapon _x) >> "picture"))];
				}
				else
				{
					_plrpic = (gettext (configFile >> "CfgVehicles" >> (typeof vehicle _x) >> "picture"));
					_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
				};
			};
		} forEach _sorted;
		
		
		_ctrl lbAdd "      LowAdmin";
		_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
		_ctrl lbSetColor [(lbsize _ctrl)-1, [0,0.6,1,1]];
		{
			_puid = getPlayerUID _x;
			if (_puid in PV_LowLevel_List) then 
			{
				_ctrl lbAdd format ["%1", name _x];
				_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
				_ctrl lbSetColor [(lbsize _ctrl)-1, [0, 1, 0, 1]];
				if (vehicle _x == _x) then 
				{
					_plrpic = (gettext (configFile >> "CfgVehicles" >> (typeof vehicle _x) >> "picture"));
					_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
					_ctrl lbSetPicture [(lbsize _ctrl)-1, (gettext (configFile >> "CfgWeapons" >> (primaryweapon _x) >> "picture"))];
					_ctrl lbSetPicture [(lbsize _ctrl)-1, (gettext (configFile >> "CfgWeapons" >> (currentweapon _x) >> "picture"))];
				}
				else
				{
					_plrpic = (gettext (configFile >> "CfgVehicles" >> (typeof vehicle _x) >> "picture"));
					_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
				};
			};
		} forEach _sorted;
		
		
		_ctrl lbAdd "";
		
		_ctrl lbAdd "      Normal Player";
		_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
		_ctrl lbSetColor [(lbsize _ctrl)-1, [1,1,1,1]];
		{
			_puid = getPlayerUID _x;
			if ((vehicle _x == _x) && !(_puid in PV_LowLevel_List+PV_NormalLevel_List+PV_SuperLevel_List)) then
			{
				_ctrl lbAdd format ["%1", name _x];
				_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
				_ctrl lbSetColor [(lbsize _ctrl)-1, [0.047, 0.502, 1, 1]];
				_plrpic = (gettext (configFile >> "CfgVehicles" >> (typeof vehicle _x) >> "picture"));
				_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
				_ctrl lbSetPicture [(lbsize _ctrl)-1, (gettext (configFile >> "CfgWeapons" >> (primaryweapon _x) >> "picture"))];
				_ctrl lbSetPicture [(lbsize _ctrl)-1, (gettext (configFile >> "CfgWeapons" >> (currentweapon _x) >> "picture"))];
			};
		} forEach _sorted;
		
		_ctrl lbAdd "      In Vehicle";
		_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
		_ctrl lbSetColor [(lbsize _ctrl)-1, [1,1,1,1]];
		{
			if (vehicle _x != _x) then 
			{
				if ((vehicle _x isKindOf "LandVehicle") || (vehicle _x isKindOf "Air") || (vehicle _x isKindOf "Ship")) then 
				{
					if !(getPlayerUID _x in (PV_LowLevel_List+PV_NormalLevel_List+PV_SuperLevel_List)) then
					{
						{
							_ctrl lbAdd format ["%1",name _x];
							_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
							_ctrl lbSetColor [(lbsize _ctrl)-1, [0.047, 0.502, 1, 1]];
							_plrpic = (gettext (configFile >> "CfgVehicles" >> (typeof vehicle _x) >> "picture"));
							_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
						} forEach crew _x;
					};
				};
			};
		} forEach _sorted;
		
		_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";
		_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";
	};
	startadminnormalspawnsearch = {
		systemchat "Started searching!  (type in chat - searching stops when chat is closed)";
		
		for "_i" from 1 to 15 do
		{
			waitUntil {!isNull (finddisplay 24)};
			waitUntil {((count (toArray (ctrlText ((findDisplay 24) displayCtrl 101))) == _i) || (isNull (finddisplay 24)))};
			if (isNull (finddisplay 24)) exitWith {systemchat "Done searching!";};
			_text = (ctrlText ((findDisplay 24) displayCtrl 101));
			[_i,_text] call RANDVAR15;
		};
		
		if (isNil "RANDVAR14ALL") then {
			RANDVAR14ALL = [];
			_cfgvehicles = configFile >> "cfgVehicles";
			for "_j" from 0 to (count _cfgvehicles)-1 do
			{
				_vehicle = _cfgvehicles select _j;
				if (isClass _vehicle) then
				{
					_veh_type = configName _vehicle;
					if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && ((_veh_type isKindOf "Air") or (_veh_type isKindOf "LandVehicle") or (_veh_type isKindOf "Ship"))) then
					{
						RANDVAR14ALL = RANDVAR14ALL + [_veh_type];
					};
				};
			};
		};
		
		RANDVAR15 = {
			_num = _this select 0;
			_text = _this select 1;
			
			RANDVAR16 = [];
			{
				_scan = [];
				_bump = toArray _x;
				for "_t" from 0 to (_num - 1) do
				{
					if !(count _bump <= (_num - 1)) then
					{
						_char = _bump select _t;			
						if (format["%1", _char] != "") then
						{
							_scan = _scan + [_char];
						};
					};
				};
				
				if ((toString _scan) == _text) then
				{
					if !(_x in RANDVAR16) then
					{
						RANDVAR16 = RANDVAR16 + [_x];
					};
				};
				
			} forEach RANDVAR14ALL;
			
			if (format["%1", RANDVAR16] != "[]") then 
			{
				[] spawn {
					disableSerialization;
					
					if (isNull finddisplay 3030) then {call admin_init;};
					
					inSub = true;
					_isVehicle__i_n_f_i_S_T_A_R = true;
					_ctrl = 2 call getControl;
					_ctrl ctrlSetFont "TahomaB";
					lbclear _ctrl;
					_spwx = "['%1'] call adminsveh;";
					adminadd = [];
					call admin_fillsubsss;
					call admin_fillSpawnMenuFILL;
					adminadd = adminadd + ["--- NORMAL SPAWN","","0","0","0","0",[0,0.8,1,1]];
					adminadd = adminadd + ["  START SEARCH  (type in chat - searching stops when chat is closed)","[] spawn startadminnormalspawnsearch","0","0","0","0",[0,0.8,1,1]];
					
					{
						adminadd = adminadd + [_x,format[_spwx,_x],"0","0","0","0",[]];
					} forEach RANDVAR16;
					
					call Admin_Fill_filler;
					call admin__FILL_MENUS;
				};
			}
			else
			{
				systemchat "No Results.";
			};
		};
	};
	startadminhivespawnsearch = {
		systemchat "Started searching!  (type in chat - searching stops when chat is closed)";
		
		for "_i" from 1 to 15 do
		{
			waitUntil {!isNull (finddisplay 24)};
			waitUntil {((count (toArray (ctrlText ((findDisplay 24) displayCtrl 101))) == _i) || (isNull (finddisplay 24)))};
			if (isNull (finddisplay 24)) exitWith {systemchat "Done searching!";};
			_text = (ctrlText ((findDisplay 24) displayCtrl 101));
			[_i,_text] call RANDVAR15;
		};
		
		if (isNil "RANDVAR14ALL") then {
			RANDVAR14ALL = [];
			_cfgvehicles = configFile >> "cfgVehicles";
			for "_j" from 0 to (count _cfgvehicles)-1 do
			{
				_vehicle = _cfgvehicles select _j;
				if (isClass _vehicle) then
				{
					_veh_type = configName _vehicle;
					if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && ((_veh_type isKindOf "Air") or (_veh_type isKindOf "LandVehicle") or (_veh_type isKindOf "Ship"))) then
					{
						RANDVAR14ALL = RANDVAR14ALL + [_veh_type];
					};
				};
			};
		};
		
		RANDVAR15 = {
			_num = _this select 0;
			_text = _this select 1;
			
			RANDVAR16 = [];
			{
				_scan = [];
				_bump = toArray _x;
				for "_t" from 0 to (_num - 1) do
				{
					if !(count _bump <= (_num - 1)) then
					{
						_char = _bump select _t;			
						if (format["%1", _char] != "") then
						{
							_scan = _scan + [_char];
						};
					};
				};
				
				if ((toString _scan) == _text) then
				{
					if !(_x in RANDVAR16) then
					{
						RANDVAR16 = RANDVAR16 + [_x];
					};
				};
				
			} forEach RANDVAR14ALL;
			
			if (format["%1", RANDVAR16] != "[]") then 
			{
				[] spawn {
					disableSerialization;
					
					if (isNull finddisplay 3030) then {call admin_init;};
					
					inSub = true;
					_isVehicle__i_n_f_i_S_T_A_R = true;
					_ctrl = 2 call getControl;
					_ctrl ctrlSetFont "TahomaB";
					lbclear _ctrl;
					_spwx = "['%1'] call adminsvehhive;";
					adminadd = [];
					call admin_fillsubsss;
					call admin_fillSpawnMenuFILL;
					adminadd = adminadd + ["--- HIVE SPAWN","","0","0","0","0",[0,0.8,1,1]];
					adminadd = adminadd + ["  START SEARCH  (type in chat - searching stops when chat is closed)","[] spawn startadminhivespawnsearch","0","0","0","0",[0,0.8,1,1]];
					
					{
						adminadd = adminadd + [_x,format[_spwx,_x],"0","0","0","0",[]];
					} forEach RANDVAR16;
					
					call Admin_Fill_filler;
					call admin__FILL_MENUS;
				};
			}
			else
			{
				systemchat "No Results.";
			};
		};
	};
	admin_fillveh =
	{
		inSub = true;
		_isVehicle__i_n_f_i_S_T_A_R = true;
		_ctrl = 2 call getControl;
		_ctrl ctrlSetFont "TahomaB";
		lbclear _ctrl;
		_spwx = "['%1'] call adminsveh;";
		
		adminadd = [];
		call admin_fillsubsss;
		call admin_fillSpawnMenuFILL;
		adminadd = adminadd + ["--- NORMAL SPAWN","","0","0","0","0",[0,0.8,1,1]];
		adminadd = adminadd + ["  START SEARCH  (type in chat - searching stops when chat is closed)","[] spawn startadminnormalspawnsearch","0","0","0","0",[0,0.8,1,1]];
		_cfgvehicles = configFile >> "cfgVehicles";
		adminadd = adminadd + ["Air","","0","1","0","0",[]];
		for "_i" from 0 to (count _cfgvehicles)-1 do
		{
			_vehicle = _cfgvehicles select _i;
			if (isClass _vehicle) then
			{
				_veh_type = configName _vehicle;
				if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "Air") && !((_veh_type isKindOf "ParachuteBase") or (_veh_type isKindOf "BIS_Steerable_Parachute"))) then
				{
					adminadd = adminadd + [_veh_type,format[_spwx,_veh_type],"0","0","0","0",[]];
				};
			};
		};
		adminadd = adminadd + ["Land","","0","1","0","0",[]];
		for "_i" from 0 to (count _cfgvehicles)-1 do
		{
			_vehicle = _cfgvehicles select _i;
			if (isClass _vehicle) then
			{
				_veh_type = configName _vehicle;
				if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "LandVehicle") && !((_veh_type isKindOf "ParachuteBase") or (_veh_type isKindOf "BIS_Steerable_Parachute"))) then
				{
					adminadd = adminadd + [_veh_type,format[_spwx,_veh_type],"0","0","0","0",[]];
				};
			};
		};
		adminadd = adminadd + ["Ship","","0","1","0","0",[]];
		for "_i" from 0 to (count _cfgvehicles)-1 do
		{
			_vehicle = _cfgvehicles select _i;
			if (isClass _vehicle) then
			{
				_veh_type = configName _vehicle;
				if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "Ship") && !((_veh_type isKindOf "ParachuteBase") or (_veh_type isKindOf "BIS_Steerable_Parachute"))) then
				{
					adminadd = adminadd + [_veh_type,format[_spwx,_veh_type],"0","0","0","0",[]];
				};
			};
		};
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	admin_fillvehHIVE =
	{
		inSub = true;
		_isVehicle__i_n_f_i_S_T_A_R = true;
		_ctrl = 2 call getControl;
		_ctrl ctrlSetFont "TahomaB";
		lbclear _ctrl;
		_spwx = "['%1'] call adminsvehhive;";
		adminadd = [];
		call admin_fillsubsss;
		call admin_fillSpawnMenuFILL;
		adminadd = adminadd + ["--- HIVE SPAWN","","0","0","0","0",[0,0.8,1,1]];
		adminadd = adminadd + ["  START SEARCH  (type in chat - searching stops when chat is closed)","[] spawn startadminhivespawnsearch","0","0","0","0",[0,0.8,1,1]];
		_cfgvehicles = configFile >> "cfgVehicles";
		adminadd = adminadd + ["Air","","0","1","0","0",[]];
		for "_i" from 0 to (count _cfgvehicles)-1 do
		{
			_vehicle = _cfgvehicles select _i;
			if (isClass _vehicle) then
			{
				_veh_type = configName _vehicle;
				if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "Air") && !((_veh_type isKindOf "ParachuteBase") or (_veh_type isKindOf "BIS_Steerable_Parachute"))) then
				{
					adminadd = adminadd + [_veh_type,format[_spwx,_veh_type],"0","0","0","0",[]];
				};
			};
		};
		adminadd = adminadd + ["Land","","0","1","0","0",[]];
		for "_i" from 0 to (count _cfgvehicles)-1 do
		{
			_vehicle = _cfgvehicles select _i;
			if (isClass _vehicle) then
			{
				_veh_type = configName _vehicle;
				if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "LandVehicle") && !((_veh_type isKindOf "ParachuteBase") or (_veh_type isKindOf "BIS_Steerable_Parachute"))) then
				{
					adminadd = adminadd + [_veh_type,format[_spwx,_veh_type],"0","0","0","0",[]];
				};
			};
		};
		adminadd = adminadd + ["Ship","","0","1","0","0",[]];
		for "_i" from 0 to (count _cfgvehicles)-1 do
		{
			_vehicle = _cfgvehicles select _i;
			if (isClass _vehicle) then
			{
				_veh_type = configName _vehicle;
				if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "Ship") && !((_veh_type isKindOf "ParachuteBase") or (_veh_type isKindOf "BIS_Steerable_Parachute"))) then
				{
					adminadd = adminadd + [_veh_type,format[_spwx,_veh_type],"0","0","0","0",[]];
				};
			};
		};
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	admin_fillobj =
	{
		inSub = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		_spwx = "['%1'] call adminsobj;";
		adminadd = [];
		call admin_fillsubsss;
		call admin_fillSpawnMenuFILL;
		adminadd = adminadd + ["--- Buildings & Objects","","0","0","0","0",[0,0.8,1,1]];
		_cfgobjects = configFile >> "cfgVehicles";
		for "_i" from 0 to (count _cfgobjects)-1 do
		{
			_object = _cfgobjects select _i;
			if (isClass _object) then
			{
				_obj_type = configName _object;
				if ((getNumber (_object >> "scope") == 2) && (getText (_object >> "picture") != "") && !((_obj_type isKindOf "ParachuteBase") or (_obj_type isKindOf "BIS_Steerable_Parachute")) && (_obj_type isKindOf "Building")) then
				{
					adminadd = adminadd + ["     "+_obj_type,format[_spwx,_obj_type],"0","0","0","0",[]];
				};
			};
		};
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	ammo_current_wpn_admin =
	{
		_obj = player;
		_mags = getArray (configfile >> 'cfgWeapons' >> currentWeapon vehicle _obj >> 'magazines');
		_mag = _mags select 0;
		vehicle _obj addMagazine _mag;
		systemchat format['%1 added %2 for %3',name _obj,_mag,currentWeapon vehicle _obj];
		
		_savelog = format['%1 mags for %2',name player,_pWep];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer 'PVAH_WriteLogRequest';
	};
	admin_fillwpn =
	{
		inSub = true;
		_isWep__i_n_f_i_S_T_A_R = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		_spwx = "['%1'] spawn adminweapon;";
		_ammo = "[] spawn ammo_current_wpn_admin;";
		adminadd = [];
		call admin_fillsubsss;
		call admin_fillSpawnMenuFILL;
		adminadd = adminadd + ["--- Ammo Current Wep",format[_ammo],"0","0","0","0",[0,0.8,1,1]];
		_cfgweapons = configFile >> 'cfgWeapons';
		for "_i" from 0 to (count _cfgweapons)-1 do
		{
			_weapon = _cfgweapons select _i;
			if (isClass _weapon) then
			{
				_wpn_type = configName _weapon;
				_plx = toArray _wpn_type;
				_plx resize 7;
				_plx;
				_plx = toString _plx;
				if (_plx != "ItemKey") then {
					if (((getNumber (_weapon >> "scope") == 0) or (getNumber (_weapon >> "scope") == 2)) && (getText (_weapon >> "picture") != "")) then {
						adminadd = adminadd + [_wpn_type,format[_spwx,_wpn_type],"0","0","0","0",[]];
					};
				};
			};
		};
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	admin_fillmag =
	{
		inSub = true;
		_isMag__i_n_f_i_S_T_A_R = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		_spwx = "['%1'] spawn adminmagazino;";
		_ammo = "[] spawn ammo_current_wpn_admin;";
		adminadd = [];
		call admin_fillsubsss;
		call admin_fillSpawnMenuFILL;
		adminadd = adminadd + ["--- Ammo Current Wep",format[_ammo],"0","0","0","0",[0,0.8,1,1]];
		_cfgweapons = configFile >> 'cfgmagazines';
		for "_i" from 0 to (count _cfgweapons)-1 do
		{
			_weapon = _cfgweapons select _i;
			if (isClass _weapon) then
			{
				_wpn_type = configName(_weapon);
				if (((getNumber (_weapon >> "scope") == 0) or (getNumber (_weapon >> "scope") == 2)) && (getText (_weapon >> "picture") != "") && !(_wpn_type == "AngelCookies")) then {
					adminadd = adminadd + [_wpn_type,format[_spwx,_wpn_type],"0","0","0","0",[]];
				};
			};
		};
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	admin_fillhlog =
	{
		inSub = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		adminadd = [];
		call admin_fillsubsss;
		_num = if (count PV_hackerL0og > 100) then {(count PV_hackerL0og)-100;} else {0;};
		for "_i" from (count PV_hackerL0og)-1 to _num step -1 do
		{
			if (_i > 0) then {
				adminadd = adminadd + [(format["%1. %2",_i,(PV_hackerL0og select _i) select 0]),'','0','1','0','0',[]];
			};
		};
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	admin_fillklog =
	{
		inSub = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		adminadd = [];
		call admin_fillsubsss;
		_num = if (count PV_SurveillanceLog > 100) then {(count PV_SurveillanceLog)-100;} else {0;};
		for "_i" from (count PV_SurveillanceLog)-1 to _num step -1 do
		{
			if (_i > 0) then {
				adminadd = adminadd + [(format["%1. %2",_i,(PV_SurveillanceLog select _i) select 0]),'','0','1','0','0',[]];
			};
		};
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	admin_filluLog =
	{
		inSub = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		adminadd = [];
		call admin_fillsubsss;
		if (isNil "PV_filluLog_arr") then {PV_filluLog_arr = [];};
		for "_i" from 0 to ((count PV_filluLog_arr)-1) do 
		{
			_name = (PV_filluLog_arr select _i);
			_pid = (PV_filluLog_arr select (_i+1));
			_field = (PV_filluLog_arr select (_i+2));
			_log = format["%1. %2 (%3) | %4",round(_i/3),_name,_pid,_field];
			adminadd = adminadd + [_log,"","0","1","0","0",[]];
			_i = _i + 2;
		};
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	adminsbando = 
	{
		_selectedID = _this select 0;
		_id = PVAH_TEMPBAN find (_selectedID);
		_name = PVAH_TEMPBAN select (_id+1);
		[_selectedID,_name] call adminUnBan;
	};
	admin_filltmpban = 
	{
		inSub = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_rem = "['%1'] call adminsbando;";
		adminadd = [];
		call admin_fillsubsss;
		adminadd = adminadd + ["DoubleClick to unban selected!","","0","1","0","0",[]];
		for "_i" from 0 to (count PVAH_TEMPBAN)-1 do 
		{
			_uid = PVAH_TEMPBAN select _i;
			_name = PVAH_TEMPBAN select (_i+1);
			_show = "UID: "+_uid+"  NAME: "+_name;
			adminadd = adminadd + [_show,format[_rem,_uid],"0","0","0","0",[]];
			_i = _i + 1;
		};
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	admin_weather =
	{
		inSub = false;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		adminadd = [];
		call admin_fillsubsss;
		adminadd = adminadd + ["View Distance ","","0","1","0","0",[]];
		adminadd = adminadd + ["1",{hint "Changing distance to 1";PVAH_AdminRequest = [19,player,1,1];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["500",{hint "Changing distance to 500";PVAH_AdminRequest = [19,player,1,500];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["1000",{hint "Changing distance to 1000";PVAH_AdminRequest = [19,player,1,1000];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["2000",{hint "Changing distance to 2000";PVAH_AdminRequest = [19,player,1,2000];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["3000",{hint "Changing distance to 3000";PVAH_AdminRequest = [19,player,1,3000];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["5000",{hint "Changing distance to 5000";PVAH_AdminRequest = [19,player,1,5000];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["7500",{hint "Changing distance to 7500";PVAH_AdminRequest = [19,player,1,7500];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["10000",{hint "Changing distance to 10000";PVAH_AdminRequest = [19,player,1,10000];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["12500",{hint "Changing distance to 12500";PVAH_AdminRequest = [19,player,1,12500];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["15000",{hint "Changing distance to 15000";PVAH_AdminRequest = [19,player,1,15000];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["20000",{hint "Changing distance to 20000";PVAH_AdminRequest = [19,player,1,20000];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["Overcast ","","0","1","0","0",[]];
		adminadd = adminadd + ["Clear",{hint "Clear Weather";PVAH_AdminRequest = [19,player,2,0];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["Partly Sunny",{hint "Partly Sunny";PVAH_AdminRequest = [19,player,2,0.2];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["Cloudy",{hint "Cloudy";PVAH_AdminRequest = [19,player,2,0.4];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["Rain",{hint "Rain";PVAH_AdminRequest = [19,player,2,0.6];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["Heavy Rain",{hint "Heavy Rain";PVAH_AdminRequest = [19,player,2,0.8];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["Storm",{hint "Storm";PVAH_AdminRequest = [19,player,2,1];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		call admin__FILL_MENUS;
	};
	admin_time =
	{
		inSub = false;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		adminadd = [];
		call admin_fillsubsss;
		adminadd = adminadd + ["Time Selection ","","0","1","0","0",[]];
		adminadd = adminadd + ["12 AM",{hint "Changing time to 12AM";PVAH_AdminRequest = [20,player,date,0];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["1 AM",{hint "Changing time to 1AM";PVAH_AdminRequest = [20,player,date,1];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["3 AM",{hint "Changing time to 3AM";PVAH_AdminRequest = [20,player,date,3];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["5 AM",{hint "Changing time to 5AM";PVAH_AdminRequest = [20,player,date,5];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["7 AM",{hint "Changing time to 7AM";PVAH_AdminRequest = [20,player,date,7];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["9 AM",{hint "Changing time to 9AM";PVAH_AdminRequest = [20,player,date,9];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["11 AM",{hint "Changing time to 11AM";PVAH_AdminRequest = [20,player,date,11];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["13 PM",{hint "Changing time to 13PM";PVAH_AdminRequest = [20,player,date,13];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["15 PM",{hint "Changing time to 15PM";PVAH_AdminRequest = [20,player,date,15];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["17 PM",{hint "Changing time to 17PM";PVAH_AdminRequest = [20,player,date,17];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["19 PM",{hint "Changing time to 19PM";PVAH_AdminRequest = [20,player,date,19];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["21 PM",{hint "Changing time to 21PM";PVAH_AdminRequest = [20,player,date,21];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		adminadd = adminadd + ["23 PM",{hint "Changing time to 23PM";PVAH_AdminRequest = [20,player,date,23];publicVariableServer "PVAH_AdminRequest";},"0","0","0","0",[]];
		call admin__FILL_MENUS;
	};
	adminadd_show_pic =
	{
		private ['_pic','_txt','_selected'];
		_selected = (adminadd select ((lbCurSel 2))*7);
		admin_picture = '';admin_text = 'infiSTAR.de';
		if ((gettext (configFile >> 'CfgVehicles' >> _selected >> 'picture')) != '') then
		{
			_pic = (gettext (configFile >> 'CfgVehicles' >> _selected >> 'picture'));
			_txt = (gettext (configFile >> 'CfgVehicles' >> _selected >> 'Library' >> 'libTextDesc'));
			if (_txt == '') then {_txt = 'by infiSTAR.de';};
			admin_picture = _pic;
			admin_text = _txt;
			[] spawn {
				while {1 == 1} do
				{
					hintSilent parseText format["<img size='7' image='%1'/><br/><br/><t size='1.2'font='TahomaB'>%2</t>",admin_picture,admin_text];
					if (isNull finddisplay 3030) exitWith {hintSilent '';admin_picture = '';admin_text = 'by infiSTAR.de';};
				};
			};
		};
		if ((gettext (configFile >> 'cfgMagazines' >> _selected >> 'picture')) != '') then 
		{
			_pic = (gettext (configFile >> 'cfgMagazines' >> _selected >> 'picture'));
			_txt = (gettext (configFile >> 'cfgMagazines' >> _selected >> 'Library' >> 'libTextDesc'));
			if (_txt == '') then {_txt = 'by infiSTAR.de';};
			admin_picture = _pic;
			admin_text = _txt;
			[] spawn {
				while {1 == 1} do
				{
					hintSilent parseText format["<img size='7' image='%1'/><br/><br/><t size='1.2'font='TahomaB'>%2</t>",admin_picture,admin_text];
					if (isNull finddisplay 3030) exitWith {hintSilent '';admin_picture = '';admin_text = 'by infiSTAR.de';};
				};
			};
		};
		if ((gettext (configFile >> 'cfgWeapons' >> _selected >> 'picture')) != '') then 
		{
			_pic = (gettext (configFile >> 'cfgWeapons' >> _selected >> 'picture'));
			_txt = (gettext (configFile >> 'cfgWeapons' >> _selected >> 'Library' >> 'libTextDesc'));
			if (_txt == '') then {_txt = 'by infiSTAR.de';};
			admin_picture = _pic;
			admin_text = _txt;
			[] spawn {
				while {1 == 1} do
				{
					if (admin_picture != '') then {
						hintSilent parseText format["<img size='7' image='%1'/><br/><br/><t size='1.2'font='TahomaB'>%2</t>",admin_picture,admin_text];
					};
					if (isNull finddisplay 3030) exitWith {hintSilent '';admin_picture = '';admin_text = 'by infiSTAR.de';};
				};
			};
		};
	};
	admin_init = 
	{
		_stime = 0;
		if(serverTime > 36000)then{_stime = time;}else{_stime = serverTime;};
		_hours = (_stime/60/60);
		_hours = toArray (str _hours);
		_hours resize 1;
		_hours = toString _hours;
		_hours = compile _hours;
		_hours = call  _hours;
		_minutes = floor(_stime/60);
		_minutes2 = _minutes - (_hours*60);
		
		if (isNil "commit_time") then {commit_time = 0;};
		if (isNil "Admin_Layout") then {Admin_Layout = 0;};
		if (isNil "old_Admin_Layout") then {old_Admin_Layout = Admin_Layout;};
		if (Admin_Layout == old_Admin_Layout) then {commit_time = 0;}else{commit_time = 1;old_Admin_Layout = Admin_Layout;};
		if (isNil 'ADMINHASH') then {ADMINHASH = toString [32,32,45,45,45,32,32,98,121,32,105,110,102,105,83,84,65,82,46,100,101];};
		
		if !(dialog) then {createDialog "RscConfigEditor_Main";};
		disableSerialization;
		
		if (Admin_Layout == 0) then 
		{
			_ctrl = 3 call getControl;
			_ctrl ctrlSetBackgroundColor [0,0,0,1];
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetScale 2.2;
			_ctrl ctrlSetTextColor [0.2, 0.2, 1, 1];
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, 0.02];
			_ctrl ctrlSetText "No Admin";
			if (getPlayerUID player in PV_LowLevel_List) then {
				_ctrl ctrlSetText format["LowAdmin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min"+ADMINHASH,count playableUnits,_hours,_minutes2];
			};
			if (getPlayerUID player in PV_NormalLevel_List) then {
				_ctrl ctrlSetText format["NormalAdmin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min"+ADMINHASH,count playableUnits,_hours,_minutes2];
			};
			if (getPlayerUID player in PV_SuperLevel_List) then {
				_ctrl ctrlSetText format["SuperAdmin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min"+ADMINHASH,count playableUnits,_hours,_minutes2];
			};
			_ctrl ctrlCommit 0;
			
			_ctrl = 2 call getControl;
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetPosition [safezoneXAbs + 0.485 + 0.02, safezoneY + 0.07, (safezoneWAbs - 0.485 - 0.03)*0.6, (safeZoneH - 0.07 - 0.03)*0.75];
			_ctrl ctrlSetScale 1.35;
			_ctrl ctrlCommit commit_time;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick;"];
			_ctrl ctrlSetEventHandler ["LBSelChanged", "call adminadd_show_pic;"];
			call admin_filllist;
			call admin_fillplr;
			
			_ctrl = 1 call getControl;
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetPosition [safezoneXAbs + 0.01, safezoneY + 0.07, (0.485)*0.75, (safeZoneH - 0.07 - 0.03)*0.75];
			_ctrl ctrlSetScale 1.35;
			_ctrl ctrlCommit commit_time;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick_2;"];
			
			_ctrl = -1 call getControl;
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, safezoneH];
			_ctrl ctrlCommit commit_time;
		};
		if (Admin_Layout == 1) then 
		{
			_ctrl = 3 call getControl;
			_ctrl ctrlSetBackgroundColor [0,0,0,1];
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetScale 2.2;
			_ctrl ctrlSetTextColor [0.2, 0.2, 1, 1];
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, 0.02];
			_ctrl ctrlSetText "No Admin";
			if (getPlayerUID player in PV_LowLevel_List) then {
				_ctrl ctrlSetText format["LowAdmin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min"+ADMINHASH,count playableUnits,_hours,_minutes2];
			};
			if (getPlayerUID player in PV_NormalLevel_List) then {
				_ctrl ctrlSetText format["NormalAdmin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min"+ADMINHASH,count playableUnits,_hours,_minutes2];
			};
			if (getPlayerUID player in PV_SuperLevel_List) then {
				_ctrl ctrlSetText format["SuperAdmin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min"+ADMINHASH,count playableUnits,_hours,_minutes2];
			};
			_ctrl ctrlCommit 0;
			
			_ctrl = 2 call getControl;
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetPosition [safezoneXAbs + 0.485 + 0.02, safezoneY + 0.07, (safezoneWAbs - 0.485 - 0.03)*0.55, (safeZoneH - 0.07 - 0.03)*0.65];
			_ctrl ctrlSetScale 1.55;
			_ctrl ctrlCommit commit_time;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick;"];
			_ctrl ctrlSetEventHandler ["LBSelChanged", "call adminadd_show_pic;"];
			call admin_filllist;
			call admin_fillplr;
			
			_ctrl = 1 call getControl;
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetPosition [safezoneXAbs + 0.01, safezoneY + 0.07, (0.485)*0.65, (safeZoneH - 0.07 - 0.03)*0.65];
			_ctrl ctrlSetScale 1.55;
			_ctrl ctrlCommit commit_time;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick_2;"];
			
			_ctrl = -1 call getControl;
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, safezoneH];
			_ctrl ctrlCommit commit_time;
		};
		if (Admin_Layout == 2) then 
		{
			_ctrl = 3 call getControl;
			_ctrl ctrlSetBackgroundColor [0,0,0,1];
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetScale 2.2;
			_ctrl ctrlSetTextColor [0.2, 0.2, 1, 1];
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, 0.02];
			_ctrl ctrlSetText "No Admin";
			if (getPlayerUID player in PV_LowLevel_List) then {
				_ctrl ctrlSetText format["LowAdmin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min"+ADMINHASH,count playableUnits,_hours,_minutes2];
			};
			if (getPlayerUID player in PV_NormalLevel_List) then {
				_ctrl ctrlSetText format["NormalAdmin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min"+ADMINHASH,count playableUnits,_hours,_minutes2];
			};
			if (getPlayerUID player in PV_SuperLevel_List) then {
				_ctrl ctrlSetText format["SuperAdmin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min"+ADMINHASH,count playableUnits,_hours,_minutes2];
			};
			_ctrl ctrlCommit 0;
			
			_ctrl = 2 call getControl;
			_ctrl ctrlSetPosition [safezoneX*0.01, safezoneY + 0.05, 0.38, safezoneH - 0.5];
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetScale (safezoneH - safezoneW / 2) * 2.2;
			_ctrl ctrlCommit commit_time;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick;"];
			_ctrl ctrlSetEventHandler ["LBSelChanged", "call adminadd_show_pic;"];
			call admin_filllist;
			call admin_fillplr;
			
			_ctrl = 1 call getControl;
			_ctrl ctrlSetPosition [safezoneX*-0.7, safezoneY + 0.05, 0.38, safezoneH - 0.5];
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetScale (safezoneH - safezoneW / 2) * 2.2;
			_ctrl ctrlCommit commit_time;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick_2;"];
			
			_ctrl = -1 call getControl;
			_ctrl ctrlSetPosition [safezoneX*0.01, safezoneY + 0.05, safeZoneW - 1.41, safezoneH - 0.055];
			_ctrl ctrlCommit commit_time;
		};
		if (Admin_Layout == 3) then 
		{
			_ctrl = 3 call getControl;
			_ctrl ctrlSetBackgroundColor [0,0,0,1];
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetScale 2.2;
			_ctrl ctrlSetTextColor [0,0.6,1,1];
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, 0.02];
			_ctrl ctrlSetText "No Admin";
			if (getPlayerUID player in PV_LowLevel_List) then {
				_ctrl ctrlSetText format["LowAdmin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min"+ADMINHASH,count playableUnits,_hours,_minutes2];
			};
			if (getPlayerUID player in PV_NormalLevel_List) then {
				_ctrl ctrlSetText format["NormalAdmin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min"+ADMINHASH,count playableUnits,_hours,_minutes2];
			};
			if (getPlayerUID player in PV_SuperLevel_List) then {
				_ctrl ctrlSetText format["SuperAdmin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min"+ADMINHASH,count playableUnits,_hours,_minutes2];
			};
			_ctrl ctrlCommit 0;
			
			_ctrl = 2 call getControl;
			_ctrl ctrlSetPosition [safezoneX, safezoneY + 0.05,safeZoneW*0.402, safezoneH*0.428];
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetScale (safezoneH - safezoneW / 2) * 2.2;
			_ctrl ctrlCommit commit_time;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick;"];
			_ctrl ctrlSetEventHandler ["LBSelChanged", "call adminadd_show_pic;"];
			call admin_filllist;
			call admin_fillplr;
			
			_ctrl = 1 call getControl;
			_ctrl ctrlSetPosition [safezoneX*-0.825, safezoneY + 0.05,safeZoneW*0.15, safezoneH*0.728];
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetScale (safezoneH - safezoneW / 2) * 2.2;
			_ctrl ctrlCommit commit_time;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick_2;"];
			
			_ctrl = -1 call getControl;
			_ctrl ctrlSetBackgroundColor [0,0,0,0.8];
			_ctrl ctrlSetPosition [safezoneX, safezoneY + 0.05, safeZoneW*0.736, safezoneH];
			_ctrl ctrlCommit commit_time;
		};
	};
	admin_give_ammo =
	{
		PVAH_AdminRequest = [25,player,_this select 0];
		publicVariableServer "PVAH_AdminRequest";
		hint format ["Giving %1 Ammo", _this select 0];
		
		_savelog = format["%1 AdminGiveAmmo %2",name player,_name];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
	};
	admin_frcam =
	{
		_name = _this select 0;
		{
			if (name _x == _name) then
			{
				_x exec 'camera.sqs';
				
				cutText [format["CAMERA AT %1",_name], "PLAIN DOWN"];
			};
		} forEach playableUnits;
		if (isNil 'AcamUsed') then
		{
			AcamUsed = true;
			systemchat 'Instructions: community.bistudio.com/wiki/Camera.sqs';
		};
	};
	admin_moveinmyveh =
	{
		_name = _this select 0;
		{
			if (name _x == _name) then
			{
				_obj = vehicle player;
				
				_x moveInDriver _obj;
				_x moveInGunner _obj;
				_x moveInCommander _obj;
				_x moveInCargo _obj;
				_x action ["getInDriver", _obj];
				_x action ["getInGunner", _obj];
				_x action ["getInCommander", _obj];
				_x action ["getInCargo", _obj];
				
				hint format ["%1 moved in your vehicle", _name];
				cutText [format["%1 moved in your vehicle", _name], "PLAIN DOWN"];
				
				_savelog = format["%1 moved %2 in his vehicle",name player,_name];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	admin_joinhisveh =
	{
		_name = _this select 0;
		{
			if (name _x == _name) then
			{
				_obj = vehicle _x;
				
				player moveInDriver _obj;
				player moveInGunner _obj;
				player moveInCommander _obj;
				player moveInCargo _obj;
				player action ["getInDriver", _obj];
				player action ["getInGunner", _obj];
				player action ["getInCommander", _obj];
				player action ["getInCargo", _obj];
				
				hint format ["joined vehicle of %1", _name];
				cutText [format["joined vehicle of %1", _name], "PLAIN DOWN"];
				
				_savelog = format["%1 joined vehicle of %2",name player,_name];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	admin_ejecFromVeh =
	{
		_name = _this select 0;
		{
			if (name _x == _name) then
			{
				_x action ["eject", (vehicle _x)];
				
				hint format ["%1 ejected", _name];
				cutText [format["%1 ejected", _name], "PLAIN DOWN"];
				
				_savelog = format["%1 ejected %2",name player,_name];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	admindump =
	{
		removeAllWeapons player;
		removeAllItems player;
		removebackpack player;
		
		hint "dumped gear";
		cutText ["dumped gear", "PLAIN DOWN"];
	};
	adminaksd =
	{
		removeAllWeapons player;
		removeAllItems player;
		removebackpack player;
		player addMagazine '30Rnd_545x39_AKSD';player addMagazine '30Rnd_545x39_AKSD';player addMagazine '30Rnd_545x39_AKSD';player addMagazine '30Rnd_545x39_AKSD';player addMagazine 'Skin_Sniper1_DZ';
		player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';player addMagazine 'ItemMorphine';
		player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addWeapon 'AKS_74_UN_Kobra';player selectWeapon 'AKS_74_UN_Kobra';player addweapon 'glock17_EP1';
		player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addMagazine 'ItemBandage';player addMagazine '17Rnd_9x19_glock17';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';
		player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	admindmr =
	{
		removeAllWeapons player;
		removeAllItems player;
		removebackpack player;
		player addweapon 'DMR';player selectWeapon 'DMR';player addMagazine '20Rnd_762x51_DMR';player addMagazine '20Rnd_762x51_DMR';player addMagazine '20Rnd_762x51_DMR';player addMagazine '20Rnd_762x51_DMR';
		player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';
		player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';
		player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminfnfal =
	{
		removeAllWeapons player;
		removeAllItems player;
		removebackpack player;
		player addweapon 'FN_FAL';player selectWeapon 'FN_FAL';player addMagazine '20Rnd_762x51_FNFAL';player addMagazine '20Rnd_762x51_FNFAL';player addMagazine '20Rnd_762x51_FNFAL';player addMagazine '20Rnd_762x51_FNFAL';
		player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';
		player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';
		player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adming36a =
	{
		removeAllWeapons player;
		removeAllItems player;
		removebackpack player;
		player addMagazine '100Rnd_556x45_BetaCMag';player addMagazine '100Rnd_556x45_BetaCMag';player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';
		player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'G36A_camo';player selectWeapon 'G36A_camo';
		player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';
		player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';
		player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminksvk =
	{
		removeAllWeapons player;
		removeAllItems player;
		player addweapon 'ksvk';player selectWeapon 'ksvk';player addMagazine '5Rnd_127x108_KSVK';player addMagazine '5Rnd_127x108_KSVK';player addMagazine '5Rnd_127x108_KSVK';
		player addMagazine '5Rnd_127x108_KSVK';player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';
		player addMagazine 'ItemAntibiotic';player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';
		player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';
		player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminl85 =
	{
		removeAllWeapons player;
		removeAllItems player;
		removebackpack player;
		player addMagazine '30Rnd_556x45_Stanag';player addMagazine '30Rnd_556x45_Stanag';player addMagazine '30Rnd_556x45_Stanag';player addMagazine '30Rnd_556x45_Stanag';player addMagazine 'FoodSteakCooked';
		player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';player addMagazine 'ItemMorphine';player addWeapon 'ItemMap';player addWeapon 'BAF_L85A2_RIS_CWS';
		player selectWeapon 'BAF_L85A2_RIS_CWS';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';
		player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';
		player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminlapua =
	{
		removeAllWeapons player;
		removeAllItems player;
		removebackpack player;
		player addweapon 'BAF_LRR_scoped';player selectWeapon 'BAF_LRR_scoped';player addMagazine '5Rnd_86x70_L115A1';player addMagazine '5Rnd_86x70_L115A1';player addMagazine '5Rnd_86x70_L115A1';
		player addMagazine '5Rnd_86x70_L115A1';player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';
		player addMagazine 'ItemAntibiotic';player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';
		player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';
		player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminm14 =
	{
		removeAllWeapons player;
		removeAllItems player;
		removebackpack player;
		player addweapon 'M14_EP1';player selectWeapon 'M14_EP1';player addMagazine '20Rnd_762x51_DMR';player addMagazine '20Rnd_762x51_DMR';player addMagazine '20Rnd_762x51_DMR';player addMagazine '20Rnd_762x51_DMR';
		player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';
		player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';
		player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminm16acg =
	{
		removeAllWeapons player;
		removeAllItems player;
		removebackpack player;
		player addMagazine '100Rnd_556x45_BetaCMag';player addMagazine '100Rnd_556x45_BetaCMag';player addMagazine '100Rnd_556x45_BetaCMag';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';
		player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';player addMagazine 'ItemMorphine';player addWeapon 'ItemMap';player addWeapon 'm16a4_acg';
		player selectWeapon 'm16a4_acg';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';
		player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';
		player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminm24 =
	{
		removeAllWeapons player;
		removeAllItems player;
		removebackpack player;
		player addweapon 'M24';player selectWeapon 'M24';player addMagazine '5Rnd_762x51_M24';player addMagazine '5Rnd_762x51_M24';player addMagazine '5Rnd_762x51_M24';player addMagazine '5Rnd_762x51_M24';
		player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';
		player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';
		player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminm249 =
	{
		removeAllWeapons player;
		removeAllItems player;
		removebackpack player;
		player addMagazine '200Rnd_556x45_M249';player addMagazine '200Rnd_556x45_M249';player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';
		player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'M249_DZ';player selectWeapon 'M249_DZ';
		player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';
		player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';
		player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminm40 =
	{
		removeAllWeapons player;
		removeAllItems player;
		removebackpack player;
		player addweapon 'M40A3';player selectWeapon 'M40A3';player addMagazine '5Rnd_762x51_M24';player addMagazine '5Rnd_762x51_M24';player addMagazine '5Rnd_762x51_M24';player addMagazine '5Rnd_762x51_M24';
		player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';
		player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';
		player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminm4sd =
	{
		removeAllWeapons player;
		removeAllItems player;
		removebackpack player;
		player addMagazine '30Rnd_556x45_StanagSD';player addMagazine '30Rnd_556x45_StanagSD';player addMagazine '30Rnd_556x45_StanagSD';player addMagazine '30Rnd_556x45_StanagSD';player addMagazine 'Skin_Sniper1_DZ';
		player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';player addMagazine 'ItemMorphine';
		player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addWeapon 'M4A1_AIM_SD_camo';player selectWeapon 'M4A1_AIM_SD_camo';player addweapon 'glock17_EP1';
		player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addMagazine 'ItemBandage';player addMagazine '17Rnd_9x19_glock17';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';
		player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminm4spr =
	{
		removeAllWeapons player;
		removeAllItems player;
		removebackpack player;
		player addMagazine '100Rnd_556x45_BetaCMag';player addMagazine '100Rnd_556x45_BetaCMag';player addMagazine '100Rnd_556x45_BetaCMag';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';
		player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';player addMagazine 'ItemMorphine';player addWeapon 'ItemMap';player addWeapon 'M4SPR';player selectWeapon 'M4SPR';
		player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';
		player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';
		player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminmk48 =
	{
		removeAllWeapons player;
		removeAllItems player;
		removebackpack player;
		player addMagazine '100Rnd_762x51_M240';player addMagazine '100Rnd_762x51_M240';player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';
		player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Mk_48_DZ';player selectWeapon 'Mk_48_DZ';
		player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player 
		addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';
		player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminpecheneg =
	{
		removeAllWeapons player;
		removeAllItems player;
		removebackpack player;
		player addMagazine '100Rnd_762x54_PK';player addMagazine '100Rnd_762x54_PK';player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';
		player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Pecheneg_DZ';player selectWeapon 'Pecheneg_DZ';
		player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player 
		addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';
		player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminsa58 =
	{
		removeAllWeapons player;
		removeAllItems player;
		removebackpack player;
		player addweapon 'Sa58V_RCO_EP1';player selectWeapon 'Sa58V_RCO_EP1';player addMagazine '30Rnd_762x39_SA58';player addMagazine '30Rnd_762x39_SA58';player addMagazine '30Rnd_762x39_SA58';player addMagazine '30Rnd_762x39_SA58';
		player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';
		player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';
		player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminscarccosd =
	{
		removeAllWeapons player;
		removeAllItems player;
		removebackpack player;
		player addweapon 'SCAR_H_CQC_CCO_SD';player selectWeapon 'SCAR_H_CQC_CCO_SD';player addMagazine '20Rnd_762x51_SB_SCAR';player addMagazine '20Rnd_762x51_SB_SCAR';player addMagazine '20Rnd_762x51_SB_SCAR';
		player addMagazine '20Rnd_762x51_SB_SCAR';player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';
		player addMagazine 'ItemAntibiotic';player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'glock17_EP1';
		player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';
		player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';
		player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';
		player addWeapon 'ItemGPS';reload player;
	};
	adminscareglm =
	{
		removeAllWeapons player;
		removeAllItems player;
		removebackpack player;
		player addweapon 'SCAR_H_STD_EGLM_Spect';player selectWeapon 'SCAR_H_STD_EGLM_Spect';player addMagazine '20rnd_762x51_B_SCAR';player addMagazine '20rnd_762x51_B_SCAR';player addMagazine '20rnd_762x51_B_SCAR';player addMagazine '20rnd_762x51_B_SCAR';
		player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';
		player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '1Rnd_HE_M203';player addMagazine '1Rnd_HE_M203';player addMagazine '1Rnd_HE_M203';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';
		player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminscarsniper =
	{
		removeAllWeapons player;
		removeAllItems player;
		removebackpack player;
		player addweapon 'SCAR_H_LNG_Sniper';player selectWeapon 'SCAR_H_LNG_Sniper';player addMagazine '20rnd_762x51_B_SCAR';player addMagazine '20rnd_762x51_B_SCAR';player addMagazine '20rnd_762x51_B_SCAR';player addMagazine '20rnd_762x51_B_SCAR';
		player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';
		player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';
		player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminsvd =
	{
		removeAllWeapons player;
		removeAllItems player;
		removebackpack player;
		player addweapon 'SVD';player selectWeapon 'SVD_CAMO';player addMagazine '10Rnd_762x54_SVD';player addMagazine '10Rnd_762x54_SVD';player addMagazine '10Rnd_762x54_SVD';player addMagazine '10Rnd_762x54_SVD';
		player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';
		player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';
		player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminsvdcamo =
	{
		removeAllWeapons player;
		removeAllItems player;
		removebackpack player;
		player addweapon 'SVD_CAMO';player selectWeapon 'SVD_CAMO';player addMagazine '10Rnd_762x54_SVD';player addMagazine '10Rnd_762x54_SVD';player addMagazine '10Rnd_762x54_SVD';player addMagazine '10Rnd_762x54_SVD';
		player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';
		player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';
		player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminvss =
	{
		removeAllWeapons player;
		removeAllItems player;
		removebackpack player;
		player addweapon 'VSS_vintorez';player selectWeapon 'VSS_vintorez';player addMagazine '20Rnd_9x39_SP5_VSS';player addMagazine '20Rnd_9x39_SP5_VSS';player addMagazine '20Rnd_9x39_SP5_VSS';player addMagazine '20Rnd_9x39_SP5_VSS';
		player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';
		player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'glock17_EP1';player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';
		player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';
		player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminheal =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminRequest = [5,player,_x];
				publicVariableServer "PVAH_AdminRequest";
				hint format ["Healing %1", _this select 0];
				
				_savelog = format["%1 AdminHeal %2",name player,name _x];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	adminrepair =
	{
		_name = _this select 0;
		if (_name == "") then {_name = name player;};
		{
			if (name _x == _name) then
			{
				_vehicle = vehicle _x;
				_vehicle setDamage 0;
				if (fuel _vehicle < 0.3) then {_vehicle setFuel 0.7;};
				_vehicle setVectorUp [0,0,1];
				(getPos _vehicle nearestObject "LandVehicle") setVectorUp [0,0,1];
				_log = format["Repairing Vehicle of %1",_name];
				hint _log;
				cutText [_log, "PLAIN DOWN"];
				
				_savelog = format["%1 AdminRepair %2",name player,_name];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	admincrate =
	{
		PVAH_AdminRequest = [6,player];
		publicVariableServer "PVAH_AdminRequest";
		
		hint format ["Box"];
		cutText [format["Box"], "PLAIN DOWN"];
		
		_savelog = format["%1 - BOX at %2",name player,mapGridPosition getPos player];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
	};
	adminESPicons =
	{
		if !(('ItemGPS' in items player) or ('ItemMap' in items player)) then
		{
			_config = ["ItemGPS"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		setGroupIconsVisible [true, true];
		_color_list = [0,1,0,1];
		_color_orange = [1,0.35,0.15,1];
		_color_bluefor_plr = [0.047,0.502,1,1];
		_color_opfor_plr = [1,0.17,0.17,1];
		_color_resistance_plr = [0,0.65,0,1];
		_color_civilian_plr = [1,1,1,1];
		_name = "";
		_show = "";
		_clr = _color_bluefor_plr;
		if (isnil "fnc_adminESPicons") then {fnc_adminESPicons = 0;};
		if (fnc_adminESPicons == 0) then 
		{
			fnc_adminESPicons = 1;
			hint "GroupIcons ON";
			cutText ["\nGroupIcons ON", "PLAIN DOWN"];
			
			_savelog = format["%1 E_S_P Activated",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		} 
		else 
		{
			fnc_adminESPicons = 0;
			hint "GroupIcons OFF";
			cutText ["\nGroupIcons OFF", "PLAIN DOWN"];
			
			_savelog = format["%1 E_S_P Disabled",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		};
		
		while {fnc_adminESPicons == 1} do
		{
			{
				_pid = getPlayerUID _x;
				if (_pid != "") then
				{
					_name = name _x;
					_veh = vehicle _x;
					_type = typeOf _veh;
					
					if (_name == "") then {_name = _type;};
					_pos = (positionCameraToWorld [0,0,0]);
					_posU = getPos _veh;
					_dist = round(_pos distance _posU);
					
					if (_x == _veh) then
					{
						_show = format ["%1 (%2m)",_name,_dist];
						_clr = _color_bluefor_plr;
					}
					else
					{
						_crewnames = [];
						{
							_crewnames = _crewnames + [name _x];
						} forEach crew _veh;
						
						_show = format ["%1 (%2m) - %3",_crewnames,_dist,_type];
						_clr = _color_orange;
					};
					if (_pid in (PV_LowLevel_List+PV_NormalLevel_List+PV_SuperLevel_List)) then {_clr = _color_list};
					
					_grp = group _x;
					clearGroupIcons _grp;
					_grp addGroupIcon ["x_art"];
					_grp setGroupIconParams [_clr, _show, 1, true];
				};
			} forEach playableUnits;
			sleep 1;
		};
		{clearGroupIcons group _x;} forEach playableUnits;
	};
	admin_fnc_esp = {
		fnc_esp =
		{
			disableSerialization;
			if (isNil "LayerID") then {LayerID = 2733;};
			LayerID cutRsc ["rscDynamicText", "PLAIN"];
			LayerID = LayerID + 1;
			_ctrl = ((uiNamespace getvariable "BIS_dynamicText") displayctrl 9999);
			_unit = _this select 0;
			while {true} do
			{
				if ((isNull _unit) || !(alive _unit)) exitWith {
					_ctrl ctrlShow false;_ctrl ctrlEnable false;
					fnc_esp_unitarray = fnc_esp_unitarray - [_unit];
					LayerID = nil;
				};
				if ((fnc_esp_state == 0) || (visibleMap)) exitWith {
					_ctrl ctrlShow false;_ctrl ctrlEnable false;
					fnc_esp_unitarray = fnc_esp_unitarray - [_unit];
					LayerID = nil;
				};
				_pos = (positionCameraToWorld [0,0,0]);
				_posU = getPos _unit;
				_dist = round(_pos distance _posU);
				if (_dist > fnc_esp_distance) exitWith {
					_ctrl ctrlShow false;_ctrl ctrlEnable false;
					fnc_esp_unitarray = fnc_esp_unitarray - [_unit];
					LayerID = nil;
				};
				
				_veh = vehicle _unit;
				_posU2 = [(getPosATL _veh) select 0, (getPosATL _veh) select 1, ((getPosATL _veh) select 2) + (((boundingBox _veh) select 1) select 2) + 0.5];
				_pos2D = worldToScreen _posU2;
				if (count _pos2D > 0) then
				{
					if (_dist <= 35) then {_ctrl ctrlSetFade 0;};
					if (_dist > 35) then {_ctrl ctrlSetFade 0.1;};
					if (_dist > 75) then {_ctrl ctrlSetFade 0.2;};
					if (_dist > 150) then {_ctrl ctrlSetFade 0.4;};
					if (_dist > 300) then {_ctrl ctrlSetFade 0.5;};
					if (_dist > 450) then {_ctrl ctrlSetFade 0.55;};
					if (_dist > 600) then {_ctrl ctrlSetFade 0.65;};
					if (_dist > 800) then {_ctrl ctrlSetFade 0.75;};
					if (_dist > 1000) then {_ctrl ctrlSetFade 0.85;};
					
					_Tsize = 0.4;
					_text = parseText format ["<t size='%3'font='Zeppelin33'color='#0B80FF'>%1 (%2m)</t>",name _unit,round _dist,_Tsize];
					if (name _unit == name player) then {_text = ""};
					if (_unit != _veh) then
					{
						_crewnames = [];
						{
							_crewnames = _crewnames + [name _x];
						} forEach crew _veh;
						_posU2 = [_posU2 select 0,_posU2 select 1,(_posU2 select 2) + 1.5];
						_pos2D = worldToScreen _posU2;
						_text = parseText format ["<t size='%3'font='Zeppelin33'color='#FF5926'>%1 (%2m) %4</t>",_crewnames,round _dist,_Tsize,typeOF _veh];
					};
					_ctrl ctrlShow true;_ctrl ctrlEnable true;
					_ctrl ctrlSetStructuredText _text;
					_ctrl ctrlSetPosition [(_pos2D select 0) - (safezoneW / 2), (_pos2D select 1), safezoneW, safezoneH];
					_ctrl ctrlCommit 0;
				}
				else
				{
					_ctrl ctrlShow false;_ctrl ctrlEnable false;
				};
				sleep 0.01;
			};
			_ctrl ctrlShow false;_ctrl ctrlEnable false;
			fnc_esp_unitarray = fnc_esp_unitarray - [_unit];
			LayerID = nil;
		};
		if (isNil "fnc_esp_state") then {fnc_esp_state = 0;};
		if (fnc_esp_state == 0) then
		{
			setGroupIconsVisible [true, false];
			fnc_esp_state = 1;
			fnc_esp_distance = 1500;
			fnc_esp_unitarray = [];
			LayerID = nil;
			while {fnc_esp_state == 1} do
			{
				{
					if (!isNull _x) then {
						_pos = (positionCameraToWorld [0,0,0]);
						_posX = getPos _x;
						_dist = (_pos distance _posX);
						if (!(_x in fnc_esp_unitarray) && (_dist < fnc_esp_distance) && (!visibleMap)) then 
						{
							fnc_esp_unitarray = fnc_esp_unitarray + [_x];
							[_x] spawn fnc_esp;
						};
						if ((_x in fnc_esp_unitarray) && (_dist > fnc_esp_distance)) then 
						{
							fnc_esp_unitarray = fnc_esp_unitarray - [_x];
						};
					};
				} forEach playableUnits;
				sleep 0.75;
			};
		}
		else
		{
			setGroupIconsVisible [true, true];
			fnc_esp_state = 0;
			fnc_esp_unitarray = [];
			LayerID = nil;
		};
	};
	fnc_heal_me = {
		disableSerialization;
		dayz_sourceBleeding = objNull;
		r_player_blood = r_player_bloodTotal;
		r_player_inpain = false;
		r_player_infected = false;
		r_player_injured = false;
		dayz_hunger = 0;
		dayz_thirst = 0;
		dayz_temperatur = 37;
		r_fracture_legs = false;
		r_fracture_arms = false;
		r_player_dead = false;
		r_player_unconscious = false;
		r_player_loaded = false;
		r_player_cardiac = false;
		r_player_lowblood = false;
		r_player_timeout = 0;
		r_handlercount = 0;
		r_interrupt = false;
		r_doLoop = false;
		r_drag_sqf = false;
		r_self = false;
		r_action = false;
		r_action_unload = false;
		r_player_handler = false;
		r_player_handler1 = false;
		disableUserInput false;
		'dynamicBlur' ppEffectAdjust [0];
		'dynamicBlur' ppEffectCommit 5;
		_selection = 'legs';
		_damage = 0;
		player setHit[_selection,_damage];
		player setVariable ['messing',[dayz_hunger,dayz_thirst],true];
		player setVariable['NORRN_unconscious',false,true];
		player setVariable['USEC_infected',false,true];
		player setVariable['USEC_injured',false,true];
		player setVariable['USEC_inPain',false,true];
		player setVariable['USEC_isCardiac',false,true];
		player setVariable['USEC_lowBlood',false,true];
		player setVariable['USEC_BloodQty',1200,true];
		player setVariable['unconsciousTime',0,true];
		player setVariable ['hit_legs',0,true];
		player setVariable ['hit_hands',0,true];
		player setVariable['medForceUpdate',true,true];
		_display = uiNamespace getVariable 'DAYZ_GUI_display';
		_control = _display displayCtrl 1303;
		_control ctrlShow false;
		_display = uiNamespace getVariable 'DAYZ_GUI_display';
		_control = _display displayCtrl 1203;
		_control ctrlShow false;
		player setdamage 0;
		0 fadeSound 1;
		resetCamShake;
	};
	fnc_MapIcons_infiSTAR2 = {
		if !(('ItemGPS' in items player) or ('ItemMap' in items player)) then
		{
			_config = ["ItemGPS"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		disableSerialization;
		if (isnil "fnc_MapIcons_run2") then
		{
			fnc_MapIcons_run2 = true;
			
			_map = (findDisplay 12) displayCtrl 51;
			_mapdraw = _map ctrlSetEventHandler ["Draw", "_this call fnc_draw_MapIcons2;"];
			
			_minimap = (uinamespace getvariable "BIS_RscMiniMap") displayCtrl 101;
			_minimapdraw = _minimap ctrlSetEventHandler ["Draw", "_this call fnc_draw_MapIcons2;"];
		} 
		else 
		{
			fnc_MapIcons_run2 = nil;
			_map ctrlremoveeventhandler ["Draw", _mapdraw];
		};
		fnc_draw_MapIcons2 =
		{
			if (!isnil "fnc_MapIcons_run2") then 
			{
				private["_ctrl"];
				_ctrl =  _this select 0;
				_iscale = (1 - ctrlMapScale _ctrl) max .2;
				_irad = 27;
				_color = [0, 0, 0, 1];
				_icon = "\ca\ui\data\icon_zora_ca.paa";
				
				_bots = [];
				{
					if ((!isNull _x) && !(_x isKindOf "zZombie_Base") && !(_x in playableUnits)) then
					{
						_bots = _bots + [_x];
					};
				} forEach (vehicle player nearEntities ['CAManBase',12000]);
				
				{
					if ((!isnull _x) and !(vehicle _x != _x)) then 
					{
						if (_x == player) then 
						{
							_color = [0, 0, 0, 1];
						} 
						else 
						{
							_color = [1, 0, 0, 1];
						};
						_ctrl drawIcon ["\ca\ui\data\iconman_ca.paa", _color, getPosASL _x, _iscale*30, _iscale*30, getDir _x, "", 1];
					};
				} forEach (playableUnits+_bots);
			};
		};
	};
	fnc_simple_list2 = {
		disableSerialization;
		if (isNull (findDisplay 1001)) then {createDialog "RscDisplayWFVoting";};		
		_display = findDisplay 1001;
		_ctrl = _display displayctrl 1006;
		lbclear _ctrl;
		
		_myPos = positionCameraToWorld [0,0,0];
		_unsorted = playableUnits;
		_sorted = [];
		{
			_closest = _unsorted select 0;
			{
				if ((getPos _x distance _myPos) < (getPos _closest distance _myPos)) then {_closest = _x}
			} forEach _unsorted;
			_sorted = _sorted + [_closest];
			_unsorted = _unsorted - [_closest]
		} forEach _unsorted;
		_sorted;
		
		{
			_xPos = getPos _x;
			if (getPlayerUID _x != '') then
			{
				_distance = round(_myPos distance _xPos);
				_ctrl lbAdd format["%1",_distance];
				_ctrl lbAdd format["%1",name _x];
			};
		} forEach _sorted;
		
		if (isNil "admin_toggled") then {admin_toggled = [];};
		if !("  ESP Icons" in admin_toggled) then
		{
			admin_toggled = admin_toggled + ["  ESP Icons"];
			[] spawn adminESPicons;
		};
		if ("  ESP for FreeRoam Cam" in admin_toggled) then
		{
			admin_toggled = admin_toggled - ["  ESP for FreeRoam Cam"];
			[] spawn admin_fnc_esp;
		};
		if !("  ESP for FreeRoam Cam" in admin_toggled) then
		{
			admin_toggled = admin_toggled + ["  ESP for FreeRoam Cam"];
			[] spawn admin_fnc_esp;
		};
		if !("  God" in admin_toggled) then
		{
			admin_toggled = admin_toggled + ["  God"];
			[] spawn admingod;
		};
		if !("  Stealth" in admin_toggled) then
		{
			admin_toggled = admin_toggled + ["  Stealth"];
			[] spawn admininvis;
		};
		if !("  No Zed Aggro" in admin_toggled) then
		{
			admin_toggled = admin_toggled + ["  No Zed Aggro"];
			[] spawn adminAntiAggro;
		};
		[] spawn fnc_heal_me;
		if (isNil "plrbotmapicons") then {plrbotmapicons = true;[] spawn fnc_MapIcons_infiSTAR2;};
		if (str(side player) != "CIV") then {[player] joinSilent createGroup CIVILIAN;};
		
		fnc_dblClick = {
			_name = _this select 0;
			{
				if (name _x == _name) then
				{
					_x switchCamera "External";
					detach player;
					player attachTo [(vehicle _x),[0,0,50]];
				};
			} forEach playableUnits;
			sleep 0.5;
			[_name] spawn admin_frcam;
			if (!isNull (findDisplay 1001)) then {closedialog 0;};
		};
		ctrlSetText [1003,"DOUBLECLICK FOR FREEROAMCAM"];
		ctrlSetText [1004,"DISTANCE"];
		ctrlSetText [1005,"NAME"];
		ctrlSetText [1007,"[DayzBattleRoyale.com][infiSTAR.de]"];
		_ctrl ctrlSetEventHandler ['LBDblClick','[(lbtext [1006, (floor((lbCurSel 1006)*2))+1])] spawn fnc_dblClick;'];
		_btn = _display displayctrl 1;
		_btn ctrlSetText "SPECTATE";
		_btn buttonSetAction '[(lbtext [1006, (floor((lbCurSel 1006)*2))+1])] spawn adminspec;';
	};
	fnc_simple_list2OFF = {
		if (isNil "admin_toggled") then {admin_toggled = [];};
		if ("  ESP Icons" in admin_toggled) then
		{
			admin_toggled = admin_toggled - ["  ESP Icons"];
			[] spawn adminESPicons;
		};
		if ("  ESP for FreeRoam Cam" in admin_toggled) then
		{
			admin_toggled = admin_toggled - ["  ESP for FreeRoam Cam"];
			[] spawn admin_fnc_esp;
		};
		if ("  God" in admin_toggled) then
		{
			admin_toggled = admin_toggled - ["  God"];
			[] spawn admingod;
		};
		if ("  Stealth" in admin_toggled) then
		{
			admin_toggled = admin_toggled - ["  Stealth"];
			[] spawn admininvis;
		};
		if ("  No Zed Aggro" in admin_toggled) then
		{
			admin_toggled = admin_toggled - ["  No Zed Aggro"];
			[] spawn adminAntiAggro;
		};
	};
	fnc_MapIcons_infiSTAR = {
		if !(('ItemGPS' in items player) or ('ItemMap' in items player)) then
		{
			_config = ["ItemGPS"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		disableSerialization;
		if (isnil "fnc_MapIcons_run") then
		{
			fnc_MapIcons_run = true;
			
			_map = (findDisplay 12) displayCtrl 51;
			_mapdraw = _map ctrlSetEventHandler ["Draw", "_this call fnc_draw_MapIcons;"];
			
			_minimap = (uinamespace getvariable "BIS_RscMiniMap") displayCtrl 101;
			_minimapdraw = _minimap ctrlSetEventHandler ["Draw", "_this call fnc_draw_MapIcons;"];
		} 
		else 
		{
			fnc_MapIcons_run = nil;
			_map ctrlremoveeventhandler ["Draw", _mapdraw];
		};
		fnc_draw_MapIcons =
		{
			if (!isnil "fnc_MapIcons_run") then 
			{
				private["_ctrl"];
				_ctrl =  _this select 0;
				_iscale = (1 - ctrlMapScale _ctrl) max .2;
				_irad = 27;
				_color = [0, 0, 0, 1];
				_icon = "\ca\ui\data\icon_zora_ca.paa";
				
				_objects = vehicles;
				{
					_type = typeOf _x;
					if !((getText (configFile >> 'CfgVehicles' >> (typeof _x) >> 'displayName') == 'Wreck') || (_type in ["ClutterCutter_small_2_EP1","UH60Wreck_DZ","UH1Wreck_DZ","Mi8Wreck_DZ"])) then 
					{
						_icon = getText(configFile >> "CfgVehicles" >> (typeof _x) >> "icon");
						_irad = 27;
						
						if ((_x iskindof "Air") or (_x iskindof "Tank")) then 
						{
							_irad = 32;
							_ctrl drawIcon [_icon, [1, 0, 1, 1], getPosASL _x, _iscale*_irad, _iscale*_irad, getDir _x, "", 1];
						} 
						else 
						{
							_irad = 27;
							_ctrl drawIcon [_icon, [0.05,0.05,0.6,1], getPosASL _x, _iscale*_irad, _iscale*_irad, getDir _x, "", 0.5];
						};
					};
				} forEach _objects;
				
				_bots = [];
				{
					if ((!isNull _x) && !(_x isKindOf "zZombie_Base") && !(_x in playableUnits)) then
					{
						_bots = _bots + [_x];
					};
				} forEach (vehicle player nearEntities ['CAManBase',25000]);
				
				{
					if ((!isnull _x) and !(vehicle _x != _x)) then 
					{
						if (_x == player) then 
						{
							_color = [0, 0, 0, 1];
						} 
						else 
						{
							_color = [1, 0, 0, 1];
						};
						_ctrl drawIcon ["\ca\ui\data\iconman_ca.paa", _color, getPosASL _x, _iscale*30, _iscale*30, getDir _x, "", 1];
					};
				} forEach (playableUnits+_bots);
			};
		};
	};
	adminwreck =
	{
		if !(('ItemGPS' in items player) or ('ItemMap' in items player)) then
		{
			_config = ["ItemGPS"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		
		stopadminwrecks =
		{
			_objects = allMissionObjects "SpawnableWreck" + allMissionObjects "Supply_Crate_DZE" + allMissionObjects "UH60Wreck_DZ" + allMissionObjects "UH1Wreck_DZ" + allMissionObjects "Mi8Wreck_DZ";
			_objects = _objects + vehicles;
			for "_i" from 0 to (count _objects)-1 do {deleteMarkerLocal ("adminwrecks" + (str _i));};
		};
		adminwrecks =
		{
			while {markadwreck == 1} do
			{
				if (markadwreck == 0) exitWith {[] spawn stopadminwrecks;};
				_objects = allMissionObjects "SpawnableWreck" + allMissionObjects "Supply_Crate_DZE" + allMissionObjects "UH60Wreck_DZ" + allMissionObjects "UH1Wreck_DZ" + allMissionObjects "Mi8Wreck_DZ";
				_objects = _objects + vehicles;
				for "_i" from 0 to (count _objects)-1 do
				{
					deleteMarkerLocal ("adminwrecks" + (str _i));
					
					_selected = _objects select _i;
					_type = typeOf _selected;
					if ((getText (configFile >> 'CfgVehicles' >> (typeof _selected) >> 'displayName') == 'Wreck') or 
					(_type in ["UH60Wreck_DZ","UH1Wreck_DZ","Mi8Wreck_DZ"]) or 
					(_selected isKindOf "ReammoBox") or (_selected isKindOf "Supply_Crate_DZE") or (_selected isKindOf "Wreck_Base") or (_selected isKindOf "Wreck")) then 
					{
						deleteMarkerLocal ("adminwrecks" + (str _i));
						_vm = createMarkerLocal [("adminwrecks" + (str _i)), getPos _selected];
						_vm setMarkerTypeLocal "SupplyVehicle";
						_vm setMarkerSizeLocal [0.8, 0.8];
						_vm setMarkerTextLocal format [" %1", getText (configFile >> 'CfgVehicles' >> (typeof _selected) >> 'displayName')];
						_vm setMarkerColorLocal ("ColorYellow");
					};
				};
				sleep 5;
			};
			[] spawn stopadminwrecks;
		};
		if (isNil "markadwreck") then {markadwreck = 0;};
		if (markadwreck == 0) then
		{
			markadwreck = 1;
			hint "2D Map WRECK Markers Activated";
			[] spawn adminwrecks;
			
			_savelog = format["%1 WRECK Activated",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		}
		else
		{
			markadwreck = 0;
			hint "2D Map WRECK Markers Disabled";
			
			[] spawn stopadminwrecks;
			
			_savelog = format["%1 WRECK Disabled",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		};
	};
	admintent =
	{
		if !(('ItemGPS' in items player) or ('ItemMap' in items player)) then
		{
			_config = ["ItemGPS"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		
		admintents =
		{
			while {markadtent == 1} do
			{
				_objects = ((allmissionobjects "TentStorage")+(allmissionobjects "StashSmall")+(allmissionobjects "StashMedium"));
				for "_i" from 0 to (count _objects)-1 do
				{
					deleteMarkerLocal ("admintents" + (str _i));
					
					_selected = _objects select _i;
					_type = typeOf _selected;
					deleteMarkerLocal ("admintents" + (str _i));
					_vm = createMarkerLocal [("admintents" + (str _i)), getPos _selected];
					_vm setMarkerTypeLocal "Camp";
					_vm setMarkerSizeLocal [0.8, 0.8];
					_vm setMarkerTextLocal format [" %1", getText (configFile >> 'CfgVehicles' >> (typeof _selected) >> 'displayName')];
					_vm setMarkerColorLocal ("ColorGreen");
				};
				sleep 2;
			};
			_objects = ((allmissionobjects "TentStorage")+(allmissionobjects "StashSmall")+(allmissionobjects "StashMedium"));
			for "_i" from 0 to (count _objects)-1 do {deleteMarkerLocal ("admintents" + (str _i));};
		};
		if (isNil "markadtent") then {markadtent = 0;};
		if (markadtent == 0) then
		{
			markadtent = 1;
			hint "2D Map Tent Markers Activated";
			[] spawn admintents;
			
			_savelog = format["%1 TentMarker Activated",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		}
		else
		{
			markadtent = 0;
			hint "2D Map Tent Markers Disabled";
			
			_objects = ((allmissionobjects "TentStorage")+(allmissionobjects "StashSmall")+(allmissionobjects "StashMedium"));
			for "_i" from 0 to (count _objects)-1 do {deleteMarkerLocal ("admintents" + (str _i));};
			
			_savelog = format["%1 TentMarker Disabled",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		};
	};
	adminDEAD =
	{
		if !(('ItemGPS' in items player) or ('ItemMap' in items player)) then
		{
			_config = ["ItemGPS"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		adminDEADs =
		{
			while {markadDEAD == 1} do
			{
				if !(markadDEAD == 1) exitWith {
					_objects = allDead;
					for "_i" from 0 to (count _objects)-1 do {deleteMarkerLocal ("adminDEADs" + (str _i));};
				};
				_objects = allDead;
				for "_i" from 0 to (count _objects)-1 do
				{
					deleteMarkerLocal ("adminDEADs" + (str _i));
					_selected = _objects select _i;
					if ((!isNull _selected) && !(_selected isKindOf "zZombie_base") && (_selected isKindOf "Man")) then
					{
						_name = (_selected getVariable["bodyName", name _selected]);
						if (_name != "Error: No unit") then
						{
							_vm = createMarkerLocal [("adminDEADs" + (str _i)), getPos _selected];
							_vm setMarkerTypeLocal "Camp";
							_vm setMarkerSizeLocal [0.4, 0.4];
							_vm setMarkerTextLocal format["%1",_name];
							_vm setMarkerColorLocal ("ColorRED");
						};
					};
				};
				sleep 5;
			};
			_objects = allDead;
			for "_i" from 0 to (count _objects)-1 do {deleteMarkerLocal ("adminDEADs" + (str _i));};
		};
		if (isNil "markadDEAD") then {markadDEAD = 0;};
		if (markadDEAD == 0) then
		{
			markadDEAD = 1;
			hint "2D Map DEADMarker Activated";
			[] call adminDEADs;
			
			_savelog = format["%1 DEADMarker Activated",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		}
		else
		{
			markadDEAD = 0;
			hint "2D Map DEADMarker Disabled";
			
			_objects = allDead;
			for "_i" from 0 to (count _objects)-1 do {deleteMarkerLocal ("adminDEADs" + (str _i));};
			
			_savelog = format["%1 DEADMarker Disabled",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		};
	};
	adminVAULT =
	{
		if !(('ItemGPS' in items player) or ('ItemMap' in items player)) then
		{
			_config = ["ItemGPS"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		adminVAULTs =
		{
			while {markadVAULT == 1} do
			{
				ADMIN_VAULT_LIST = [] + (allmissionobjects "VaultStorage"+allmissionobjects "VaultStorageLocked");
				
				if !(markadVAULT == 1) exitWith {
					for "_i" from 0 to (count ADMIN_VAULT_LIST)-1 do {deleteMarkerLocal ("adminVAULTs" + (str _i));};
				};
				for "_i" from 0 to (count ADMIN_VAULT_LIST)-1 do
				{
					deleteMarkerLocal ("adminVAULTs" + (str _i));
					_selected = ADMIN_VAULT_LIST select _i;
					_vm = createMarkerLocal [("adminVAULTs" + (str _i)), getPos _selected];
					_vm setMarkerTypeLocal "Camp";
					_vm setMarkerSizeLocal [0.5, 0.5];
					_vm setMarkerTextLocal "VAULT";
					_vm setMarkerColorLocal ("ColorYellow");
				};
				sleep 5;
			};
			for "_i" from 0 to (count ADMIN_VAULT_LIST)-1 do {deleteMarkerLocal ("adminVAULTs" + (str _i));};
		};
		if (isNil "markadVAULT") then {markadVAULT = 0;};
		if (markadVAULT == 0) then
		{
			markadVAULT = 1;
			hint "2D Map VAULTMarker Activated";
			[] call adminVAULTs;
			
			_savelog = format["%1 VAULTMarker Activated",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		}
		else
		{
			markadVAULT = 0;
			hint "2D Map VAULTMarker Disabled";
			
			for "_i" from 0 to (count ADMIN_VAULT_LIST)-1 do {deleteMarkerLocal ("adminVAULTs" + (str _i));};
			
			_savelog = format["%1 VAULTMarker Disabled",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		};
	};
	adminmark =
	{
		if !(('ItemGPS' in items player) or ('ItemMap' in items player)) then
		{
			_config = ["ItemGPS"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		
		adminpmark =
		{
			while {mark == 1} do
			{
				_playableUnits = playableUnits;
				for "_i" from 0 to (count _playableUnits)-1 do
				{
					deleteMarkerLocal ("adminpmark" + (str _i));
					if ((_playableUnits select _i) == vehicle (_playableUnits select _i)) then 
					{
						deleteMarkerLocal ("adminpmark" + (str _i));
						_pm = createMarkerLocal [("adminpmark" + (str _i)), getPos (_playableUnits select _i)];
						_pm setMarkerTypeLocal "destroyedvehicle";
						_pm setMarkerSizeLocal [0.8, 0.8];
						_pm setMarkerTextLocal format ["%1", name (_playableUnits select _i)];
						_pm setMarkerColorLocal ("ColorBlue");
					};
				};
				sleep 2;
			};
			for "_i" from 0 to (count playableUnits)-1 do {deleteMarkerLocal ("adminpmark" + (str _i));};
		};
		if (isNil "mark") then {mark = 0;};
		if (mark == 0) then
		{
			mark = 1;
			hint "2D Map PLAYER Markers Activated";
			[] spawn adminpmark;
			
			_savelog = format["%1 PlayerMarkers Activated",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		}
		else
		{
			mark = 0;
			hint "2D Map PLAYER Markers Disabled";
			
			for "_i" from 0 to (count playableUnits)-1 do {deleteMarkerLocal ("adminpmark" + (str _i));};
			
			_savelog = format["%1 PlayerMarkers Disabled",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		};
	};
	adminmarkveh =
	{
		if !(('ItemGPS' in items player) or ('ItemMap' in items player)) then
		{
			_config = ["ItemGPS"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		
		adminvmark =
		{
			while {markveh == 1} do
			{
				_vehicles = vehicles;
				for "_i" from 0 to (count _vehicles)-1 do
				{
					deleteMarkerLocal ("adminvmark" + (str _i));
					
					if (((_vehicles select _i) isKindOf "LandVehicle") or ((_vehicles select _i) isKindOf "Air") or ((_vehicles select _i) isKindOf "Ship")) then 
					{
						if (count crew (_vehicles select _i) != 0) then 
						{
							_crewnames = [];
							{
								_crewnames = _crewnames + [name _x];
							} forEach crew (_vehicles select _i);
							
							deleteMarkerLocal ("adminvmark" + (str _i));
							_vm = createMarkerLocal [("adminvmark" + (str _i)), getPos (_vehicles select _i)];
							_vm setMarkerTypeLocal "destroyedvehicle";
							_vm setMarkerSizeLocal [0.8, 0.8];
							_vm setMarkerTextLocal format ["%1 in %2", _crewnames,getText (configFile >> 'CfgVehicles' >> (typeof (_vehicles select _i)) >> 'displayName')];
							_vm setMarkerColorLocal ("ColorRed");
						}
						else
						{
							deleteMarkerLocal ("adminvmark" + (str _i));
							_vm = createMarkerLocal [("adminvmark" + (str _i)), getPos (_vehicles select _i)];
							_vm setMarkerTypeLocal "destroyedvehicle";
							_vm setMarkerSizeLocal [0.8, 0.8];
							_vm setMarkerTextLocal format ["%1", getText (configFile >> 'CfgVehicles' >> (typeof (_vehicles select _i)) >> 'displayName')];
							_vm setMarkerColorLocal ("ColorBrown");
						};
					};
				};
				sleep 2;
			};
			for "_i" from 0 to (count vehicles)-1 do {deleteMarkerLocal ("adminvmark" + (str _i));};
		};
		if (isNil "markveh") then {markveh = 0;};
		if (markveh == 0) then
		{
			markveh = 1;
			hint "2D Map VEHICLE Markers Activated";
			[] spawn adminvmark;
			
			_savelog = format["%1 VEHICLEMarkers Activated",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		}
		else
		{
			markveh = 0;
			hint "2D Map VEHICLE Markers Disabled";
			
			for "_i" from 0 to (count vehicles)-1 do {deleteMarkerLocal ("adminvmark" + (str _i));};
			
			_savelog = format["%1 VEHICLEMarkers Disabled",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		};
	};
	adminAntiAggro = {
		if (isnil "adminAntiAggro_zxeds") then {adminAntiAggro_zxeds = false;};
		if (!adminAntiAggro_zxeds) then
		{
			adminAntiAggro_zxeds = true;
			
			hint "No Zed Aggro - On";
			cutText [format["No Zed Aggro - On"], "PLAIN DOWN"];
			_savelog = format["%1 No Zed Aggro - On",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
			
			player_zombieCheck = {};
			player_zombieAttack = {};
		}
		else
		{
			adminAntiAggro_zxeds = false;
			
			hint "No Zed Aggro - Disabled";
			cutText [format["No Zed Aggro - Disabled"], "PLAIN DOWN"];
			_savelog = format["%1 No Zed Aggro - Disabled",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
			
			player_zombieCheck = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_zombieCheck.sqf';
			player_zombieAttack = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_zombieAttack.sqf';
		};
	};
	admin_vehicleboost = {
		if (isnil("vehboost_infiSTAR")) then {vehboost_infiSTAR = 0;};
		if (vehboost_infiSTAR == 0) then 
		{
			vehboost_infiSTAR = 1;
			hint "Vehboost 1 - left shift or E to go fast and space for brakes!";
			cutText [format["Vehboost 1 - left shift or E to go fast and space for brakes!"], "PLAIN DOWN"];
			_savelog = format["%1 Vehboost On",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
			
			waituntil {!isnull (finddisplay 46)};
			booostkey_KI_0 = (findDisplay 46) displayAddEventHandler ["KeyDown","_this select 1 call booostkey_FNC_spd_0;false;"];
			booostkey_FNC_spd_0 = 
			{
				_vehicle_player = vehicle player;
				if(_vehicle_player == player)exitwith{};
				
				if(isEngineOn _vehicle_player) then 
				{
					switch (_this) do 
					{
						case 18:
						{
							_vehicle_player SetVelocity [(velocity _vehicle_player select 0) * 1.05, (velocity _vehicle_player select 1) *1.05, (velocity _vehicle_player select 2) * 0.99];
						};
						case 42:
						{
							_vehicle_player setVelocity [(velocity _vehicle_player select 0) * 1.025, (velocity _vehicle_player select 1) * 1.025, (velocity _vehicle_player select 2) * 0.99];
						};
						case 57:
						{
							_vehicle_player SetVelocity [(velocity _vehicle_player select 0) * 0.95, (velocity _vehicle_player select 1) *0.95, (velocity _vehicle_player select 2) * 0.99];
						};
					};
				};
			};
		}
		else
		{
			vehboost_infiSTAR = 0;
			hint "Vehboost 0";
			cutText [format["Vehboost 0"], "PLAIN DOWN"];
			_savelog = format["%1 Vehboost Disabled",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
			
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", booostkey_KI_0];
			_vehicle_player = nil;
		};
	};
	adminZedshld = 
	{
		if (isNil "zoombiieshieldd") then {zoombiieshieldd = true;} 
		else 
		{
			zoombiieshieldd = !zoombiieshieldd;
			if (zoombiieshieldd) then 
			{	
				cutText [format["ZedShield ON for 50m"],"PLAIN DOWN"];
				
				_savelog = format["%1 ZedShield Activated",name player];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			} 
			else 
			{
				cutText ["ZedShield OFF","PLAIN DOWN"];
				
				_savelog = format["%1 ZedShield Disabled",name player];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		};
		while {zoombiieshieldd} do 
		{
			{
				if (!isNull _x) then {
					if !(isPlayer _x) then {
						deletevehicle _x;
					};
				};
			} forEach (vehicle player nearEntities ["zZombie_Base",50]);
			sleep 1;
		};
	};
	adminammo_recoil = {
		if (isnil ("admin_loop1")) then {admin_loop1 = 0;};
		if (admin_loop1==0) then 
		{
			admin_loop1=1;
			cutText [format["Infinite AMMO and No Recoil ON"], "PLAIN DOWN"];
			hint "Infinite AMMO and No Recoil ON";
			
			_savelog = format["%1 adminammo_recoil ON",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		}
		else
		{
			admin_loop1=0;
			cutText [format["Infinite AMMO and No Recoil OFF"], "PLAIN DOWN"];
			hint "Infinite AMMO and No Recoil OFF";
			
			_savelog = format["%1 adminammo_recoil OFF",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		};
		while {admin_loop1==1} do 
		{
			(vehicle player) setVehicleAmmo 1;
			(vehicle player) setUnitRecoilCoefficient 0;
			sleep 0.01;
		};
	};
	admin_FastFire = {
		if (isnil ("admin_loop2")) then {admin_loop2 = 0;};
		if (admin_loop2==0) then 
		{
			admin_loop2=1;
			cutText [format["FastFire ON"], "PLAIN DOWN"];
			hint "FastFire ON";
			
			_savelog = format["%1 FastFire ON",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		}
		else
		{
			admin_loop2=0;
			cutText [format["FastFire OFF"], "PLAIN DOWN"];
			hint "FastFire OFF";
			
			_savelog = format["%1 FastFire OFF",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		};
		while {admin_loop2==1} do 
		{
			(vehicle player) setWeaponReloadingTime [(vehicle player),currentWeapon (vehicle player),0];
			player setWeaponReloadingTime [player,currentWeapon player,0];
			sleep 0.01;
		};
	};
	admin_low_terrain = {
		if (isNil "admin_terrain") then {admin_terrain = true;} else {admin_terrain = !admin_terrain};
		if (admin_terrain) then {
			setTerrainGrid 50;
			hint "Terrain Low";
			cutText [format["Terrain Low"], "PLAIN DOWN"];
			_savelog = format["%1 Terrain Low",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		}
		else
		{
			setTerrainGrid 25;
			hint "Terrain Normal";
			cutText [format["Terrain Normal"], "PLAIN DOWN"];
			_savelog = format["%1 Terrain Normal",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		};
	};
	adminDEGOD =
	{
		fnc_usec_damageHandler = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_damageHandler.sqf';
		player allowDamage true;
		player removeAllEventHandlers 'HandleDamage';
		player addeventhandler ['HandleDamage',{_this call fnc_usec_damageHandler;} ];
	};
	admingod =
	{
		if (isNil "gmdadmin") then {gmdadmin = 0;};
		if (gmdadmin == 0) then
		{
			gmdadmin = 1;
			[] spawn {
				while {gmdadmin == 1} do
				{
					if (gmdadmin == 0) exitWith {[] spawn adminDEGOD;};
					fnc_usec_damageHandler = {};
					player allowDamage false;
					player removeAllEventhandlers "handleDamage";
					player addEventhandler ["handleDamage", {[] spawn fnc_heal_me;}];
					sleep 0.5;
				};
			};
			hint "God ON";
			_savelog = format["%1 G_o_d ON",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		}
		else
		{
			gmdadmin = 0;
			[] spawn adminDEGOD;
			hint "God OFF";
			_savelog = format["%1 G_o_d OFF",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		};
	};
	adminHumanityPlus =
	{
		{
			if (name _x == _this select 0) then
			{
				_humanity = _x getVariable["humanity",0];
				_x setVariable["humanity",_humanity+2500,true];
				hint format ["Gave %1 +2500 Humanity!",_this select 0];
				
				_savelog = format["%1 +2500 Humanity to %2",name player,_this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	adminHumanityMinus =
	{
		{
			if (name _x == _this select 0) then
			{
				_humanity = _x getVariable["humanity",0];
				_x setVariable["humanity",_humanity-2500,true];
				hint format ["Gave %1 -2500 Humanity!",_this select 0];
				
				_savelog = format["%1 -2500 Humanity to %2",name player,_this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	adminfixfps = {
		[] spawn {
			hint "FIXING FPS";
			cutText ["FIXING FPS", "PLAIN"];
			
			{
				if ((!isNull _x) && (_x in vehicles)) then {deletevehicle _x;};
				if (!isNull _x) then {
					_nearby = {isPlayer _x} count (_x nearEntities [["CAManBase"], 450]);
					_keep = _x getVariable ["permaLoot",false];
					if ((_nearby == 0) && (!_keep) && !(_x in alldead) && (!isNull _x)) then
					{
						deleteVehicle _x;
					};
					_nearby2 = {isPlayer _x} count (_x nearEntities [["CAManBase"], 25]);
					if ((_nearby2 == 0) && (_x in alldead) && (_x isKindOf "zZombie_Base") && (!isNull _x)) then
					{
						deleteVehicle _x;
					};
					if ((_nearby2 == 0) && (_x isKindOf "CAAnimalBase") && (!isNull _x)) then {deleteVehicle _x;};
				};
			} foreach ((allMissionObjects "WeaponHolder")+(allMissionObjects "WeaponHolderBase")
			+(allMissionObjects "ReammoBox")+(allMissionObjects "Sound_Flies")
			+(allDead)+([0,0,0] nearEntities ['CAAnimalBase', 10000000]));
			
			_savelog = format["%1 - FixFps Script",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		};
	};
	adminCarGod =
	{
		if (isNil "adminCarGodToggle") then {adminCarGodToggle = 0;};
		if (adminCarGodToggle == 0) then
		{
			adminCarGodToggle = 1;
			hint "Car God On";
			while {adminCarGodToggle==1} do
			{
				_veh = vehicle player;
				if (_veh != player) then
				{
					_veh setDamage 0;
					_veh setFuel 1;
				};
				sleep 0.1;
			};
		}
		else
		{
			adminCarGodToggle = 0;
			hint "Car God Disabled";
		};
		
		_savelog = format["%1 adminCarGod %2",name player,adminCarGodToggle];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
	};
	admininvis =
	{
		if (isNil 'inv1') then {inv1 = 0;};
		if (inv1 == 0) then
		{
			orig_type_admin = typeOF player;
			old_cameraView = cameraView;
			[dayz_playerUID,dayz_characterID,'Survivor1_DZ'] spawn player_humanityMorph;
			[] spawn {waitUntil {typeOf player == 'Survivor1_DZ'};vehicle player switchCamera old_cameraView;};
			
			inv1 = 1;
			hint "Invisibility Activated";
			
			_savelog = format["%1 Invisibility Activated",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		}
		else
		{
			old_cameraView = cameraView;
			if (isNil 'orig_type_admin') then {orig_type_admin = 'Sniper1_DZ';};
			[dayz_playerUID,dayz_characterID,orig_type_admin] spawn player_humanityMorph;
			[] spawn {waitUntil {typeOf player == orig_type_admin};vehicle player switchCamera old_cameraView;};
			
			inv1 = 0;
			hint "Invisibility Disabled";
			
			_savelog = format["%1 Invisibility Disabled",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		};
	};
	admin_debug =
	{
		debugMonitorX = false;
		if (isNil "admin_debug_run") then {admin_debug_run = true;} else {admin_debug_run = !admin_debug_run;};
		while {admin_debug_run} do 
		{
			_pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));
			if (player == vehicle player) then {_pic = (gettext (configFile >> 'cfgWeapons' >> (currentWeapon player) >> 'picture'));
			}else{_pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));};
			
			_txt = '';
			_txt = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'displayName'));
			
			_stime = 0;
			if(serverTime > 36000)then{_stime = time;}else{_stime = serverTime;};
			_hours = (_stime/60/60);
			_hours = toArray (str _hours);
			_hours resize 1;
			_hours = toString _hours;
			_hours = compile _hours;
			_hours = call  _hours;
			_minutes = floor(_stime/60);
			_minutes2 = _minutes - (_hours*60);
			
			hintSilent parseText format ["
			<t size='1' font='Bitstream' align='Center' >[%1]</t><br/>
			<img size='4.75' image='%4'/><br/>
			<t size='1' font='Bitstream' align='left' color='#CC0000'>Blood: </t><t size='1' font='Bitstream' align='right'>%2</t><br/>
			<t size='1' font='Bitstream' align='left' color='#0066CC'>Humanity: </t><t size='1' font='Bitstream' align='right'>%3</t><br/>
			<br/>
			<t size='1' font='Bitstream' align='left' color='#FFBF00'>Zombie Kills: </t><t size='1' font='Bitstream' align='right'>%9</t><br/>
			<t size='1' font='Bitstream' align='left' color='#FFBF00'>Murders: </t><t size='1' font='Bitstream' align='right'>%10</t><br/>
			<t size='1' font='Bitstream' align='left' color='#FFBF00'>Bandits Killed: </t><t size='1' font='Bitstream' align='right'>%11</t><br/>
			<br/>
			<t size='1' font='Bitstream' align='left' color='#FFBF00'>UPTIME: </t><t size='1' font='Bitstream' align='right'>%5h %6min</t><br/>
			<t size='1' font='Bitstream' align='left' color='#FFBF00'>FPS: </t><t size='1' font='Bitstream' align='right'>%8</t><br/>
			<t size='1' font='Bitstream' align='Center' color='#CC0000'>infiSTAR.de AdminDebug</t><br/>
			<t size='1'font='Bitstream'align='left' color='#0066CC'>Player Online:</t><t size='1'font='Bitstream'align='right'>%12</t><br/>
			<t size='1'font='Bitstream'align='left' color='#0066CC'>Vehicles:</t><t size='1'font='Bitstream'align='right'>%15(%16)</t><br/>
			<t size='1'font='Bitstream'align='left' color='#0066CC'>Player in 500m:</t><t size='1'font='Bitstream'align='right'>%13</t><br/>
			<t size='1'font='Bitstream'align='left' color='#0066CC'>Viewdistance:</t><t size='1'font='Bitstream'align='right'>%14</t>
			",
			_txt,
			(r_player_blood),
			round (player getVariable['humanity', 0]),
			_pic,
			_hours,
			_minutes2,
			'',
			(round diag_fps),
			(player getVariable['zombieKills', 0]),
			(player getVariable['humanKills', 0]),
			(player getVariable['banditKills', 0]),
			(count playableUnits),
			(({isPlayer _x} count (getPos vehicle player nearEntities [['AllVehicles'], 500]))-1),
			viewdistance,
			(count([0,0,0] nearEntities [['LandVehicle','Air','Ship'],25000])),
			count vehicles
			];
			sleep 1;
		};
		if (!admin_debug_run) then {hintSilent parseText format ["<t size='1'font='TahomaB'align='center'>DEBUG OFF</t>"];};
	};
	adminx_aatp = 
	{
		_tempTime = time;
		time = "thxmonky";
		sleep 3;
		while {1 == 1} do {
			time = _tempTime;
			_tempTime = _tempTime + 1;
			sleep 1;
		};
	};
	admin_animate1 =
	{
		_ct = cursorTarget;
		if (!isNull _ct) then
		{			
			if (_ct isKindOf "AllVehicles") then {[nil,nil,nil,_ct] execVM "\z\addons\dayz_code\actions\unlock_veh.sqf";};
			
			//if ((_ct isKindOf "AllVehicles") && (locked _ct)) then {_ct lock false;};
			
			{_ct animate [_x,1];} forEach ["Open_hinge","Open_latch","Lights_1","Lights_2","Open_door","DoorR","LeftShutter","RightShutter"];
		};
	};
	admin_animate2 =
	{
		_ct = cursorTarget;
		if (!isNull _ct) then
		{
			if (_ct isKindOf "AllVehicles") then {[nil,nil,nil,_ct] execVM "\z\addons\dayz_code\actions\lock_veh.sqf";};
			
			//if ((_ct isKindOf "AllVehicles") && !(locked _ct)) then {_ct lock true;};
			
			{_ct animate [_x,0];} forEach ["Open_hinge","Open_latch","Lights_1","Lights_2","Open_door","DoorR","LeftShutter","RightShutter"];
		};
	};
	admin_generatekey =
	{
		private ["_ct","_id","_result","_inventory","_backpack"];
		_ct = cursorTarget;
		if (!isNull _ct) then {
			if (_ct distance player > 12) exitWith {cutText [format["%1 is to far away.",typeOF _ct], "PLAIN"];};
			if !((_ct isKindOf "LandVehicle") || (_ct isKindOf "Air") || (_ct isKindOf "Ship")) exitWith {cutText [format["%1 is not a vehicle..",typeOF _ct], "PLAIN"];};
			
			_id = _ct getVariable ["CharacterID","0"];
			_id = parsenumber _id;
			if (_id == 0) exitWith {cutText [format["%1 has ID 0 - No Key possible.",typeOF _ct], "PLAIN"];};
			if ((_id > 0) && (_id <= 2500)) then {_result = format["ItemKeyGreen%1",_id];};
			if ((_id > 2500) && (_id <= 5000)) then {_result = format["ItemKeyRed%1",_id-2500];};
			if ((_id > 5000) && (_id <= 7500)) then {_result = format["ItemKeyBlue%1",_id-5000];};
			if ((_id > 7500) && (_id <= 10000)) then {_result = format["ItemKeyYellow%1",_id-7500];};
			if ((_id > 10000) && (_id <= 12500)) then {_result = format["ItemKeyBlack%1",_id-10000];};
			
			_inventory = (weapons player);
			_backpack = ((getWeaponCargo unitbackpack player) select 0);
			if (_result in (_inventory+_backpack)) then
			{
				if (_result in _inventory) then {cutText [format["Key [%1] already in your inventory!",_result], "PLAIN"];};
				if (_result in _backpack) then {cutText [format["Key [%1] already in your backpack!",_result], "PLAIN"];};
			}
			else
			{
				player addweapon _result;
				cutText [format["Key [%1] added to inventory!",_result], "PLAIN"];
			};
		};
	};
	admin_showid =
	{
		_obj = cursortarget;
		if (!isNull _obj) then
		{
			_type = typeOf _obj;
			if (_type == "WeaponHolder") then
			{
				_cargo = getWeaponCargo _obj;
				_wep = _cargo select 0;
				_text = format["\n\nCursorTarget Weapon Cargo:\n%1",_wep];
				hint _text;
				titleText [_text,"PLAIN"];
			}
			else
			{
				_charID = _obj getVariable ["CharacterID","0"];
				_objID 	= _obj getVariable["ObjectID","0"];
				_objUID	= _obj getVariable["ObjectUID","0"];
				
				systemchat format["CursorTarget Information: %1",typeOF _obj];
				systemchat format["charID: %1 || objID: %2 || objUID: %3",_charID,_objID,_objUID];
			};
		};
	};
	admin_tpdirection_on = 
	{
		if (isNil "admin_tpdirection_0n") then {admin_tpdirection_0n = true;} else {admin_tpdirection_0n = !admin_tpdirection_0n;};
		sleep 0.1;
		if (admin_tpdirection_0n) then 
		{
			hint "TP infront of you ON";
			cutText ["TP infront of you ON", "PLAIN DOWN"];
			
			_savelog = format["%1 TP infront of you ON",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		}
		else
		{
			hint "TP infront of you OFF";
			cutText ["TP infront of you OFF", "PLAIN DOWN"];
			
			_savelog = format["%1 TP infront of you OFF",name player];
			PVAH_WriteLogRequest = [_savelog];
			publicVariableServer "PVAH_WriteLogRequest";
		};
	};
	admin_tpdirection = 
	{
		if (isNil "admin_tpdirection_0n") exitWith {};
		if (!admin_tpdirection_0n) exitWith {};
		
		_distance = 10;
		_object = (vehicle player);
		_dir = getdir _object;
		_pos = getPosATL _object;
		if (_object isKindOf "Air") then
		{
			if (count(crew _object)>1) then 
			{ 
				_distance = 10;
				_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),((getpos _object) select 2)+100];
				if (surfaceIsWater _pos) then {_object setPosASL _pos;} else {_object setPosATL _pos;};
			} 
			else
			{
				_distance = 50;
				_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),0];
				if (surfaceIsWater _pos) then {_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),2];};
				if ((getpos _object) select 2 > 6) then {_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),((getpos _object) select 2)+0.1]};
				if (surfaceIsWater _pos) then {_object setPosASL _pos;} else {_object setPosATL _pos;};
			};
		}
		else
		{
			_distance = 10;
			_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),0];
			if (surfaceIsWater _pos) then {_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),2];};
			if ((getpos _object) select 2 > 3) then {_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),((getpos _object) select 2)];};
			if (surfaceIsWater _pos) then {_object setPosASL _pos;} else {_object setPosATL _pos;};
		};
	};
	adminaltteleport = 
	{
		if (isNil "adminaltteleport_toggle") then {adminaltteleport_toggle = true;} else {adminaltteleport_toggle = !adminaltteleport_toggle;};
		if (adminaltteleport_toggle) then 
		{
			if !(('ItemGPS' in items player) or ('ItemMap' in items player)) then
			{
				_config = ["ItemGPS"];
				_isOK = [player,_config] call BIS_fnc_invAdd;
			};
			
			(findDisplay 46) displayAddEventHandler ["KeyDown", "altstate_Admin = _this select 4"];
			((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["MouseButtonDown", "if (((_this select 1) == 0) && altstate_Admin) then
			{
				PVAH_AdminRequest = [1, player, ((_this select 0) posScreenToWorld [_this select 2, _this select 3])];
				publicVariableServer 'PVAH_AdminRequest';
			};"];
			hint "ALT TELEPORT ACTIVATED";
			cutText ["ALT TELEPORT ACTIVATED", "PLAIN"];
		}
		else
		{
			((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers "MouseButtonDown";
			hint "ALT TELEPORT DISABLED";
			cutText ["ALT TELEPORT DISABLED", "PLAIN"];
		};
	};
	adminbreakleg =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminRequest = [2,player,_x];
				publicVariableServer "PVAH_AdminRequest";
				hint format ["Breaking %1's legs", _this select 0];
				
				_savelog = format["%1 Break Legs %2",name player,_this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	admin_show = {
		if (isNil 'waitForGearRequest') then {waitForGearRequest = player;};
		if (isNull waitForGearRequest) then {waitForGearRequest = player;};
		_unit = waitForGearRequest;
		if (dialog) then {closeDialog 0;};
		waitUntil {sleep 0.5;count weapons _unit > 0};
		createGearDialog [(_unit), 'RscDisplayGear'];
		hintSilent format ["Showing Gear of %1", name _unit];
	};
	remove_spec_000 = {
		ASPG = objnull;
		vehicle player switchCamera cameraView;
		SpecateLoopActive = nil;
		['',0,0,1,0,0,3033] spawn bis_fnc_dynamicText;
		['',0,0,1,0,0,3034] spawn bis_fnc_dynamicText;
		['',0,0,1,0,0,3035] spawn bis_fnc_dynamicText;
		['',0,0,1,0,0,3036] spawn bis_fnc_dynamicText;
	};
	adminspec = {
		_name = _this select 0;
		hintSilent format ["Spectating %1, F6 to cancel - F7 Show Gear",_name];
		cutText [format["Spectating %1, F6 to cancel - F7 Show Gear",_name], "PLAIN DOWN"];
		{
			if (name _x == _name) then
			{
				_savelog = format["%1 Spectating %2",name player,_name];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
				
				waitForGearRequest = _x;
				ASPG = _x;
				vehicle _x switchCamera cameraView;
				
				if (isNil 'SpecateLoopActive') then
				{
					SpecateLoopActive = true;
					while {SpecateLoopActive} do
					{
						if (isNull cameraOn) then {vehicle player switchCamera cameraView;};
						if (!isNull ASPG) then
						{
							_unit = ASPG;
							_log = format['%1 (%2)',name _unit,getPlayerUid _unit];
							["<t align='left'size='0.5'color='#1270ee'>"+_log+"</t>",safezoneX+0.2,safezoneY+0.4,1.5,0,0,3033] spawn bis_fnc_dynamicText;
							sleep 0.1;
							
							_log2 = format['Blood: %1    Humanity: %2',(_unit getVariable['USEC_BloodQty',12000]),(_unit getVariable['humanity',0])];
							["<t align='left'size='0.5'color='#1270ee'>"+_log2+"</t>",safezoneX+0.2,safezoneY+0.44,1.5,0,0,3034] spawn bis_fnc_dynamicText;
							sleep 0.1;
							
							_cWep = currentWeapon _unit;
							if (_cWep == '') then
							{
								_log3 = 'unarmed';
								["<t align='left'size='0.5'color='#1270ee'>"+_log3+"</t>",safezoneX+0.2,safezoneY+0.48,1.5,0,0,3035] spawn bis_fnc_dynamicText;
							}
							else
							{
								_log3 = format['Weapon: %1 (Ammo: %2)',_cWep,_unit ammo _cWep];
								["<t align='left'size='0.5'color='#1270ee'>"+_log3+"</t>",safezoneX+0.2,safezoneY+0.48,1.5,0,0,3035] spawn bis_fnc_dynamicText;
							};
							sleep 0.1;
							
							_ct = cursorTarget;
							if (!isNull _ct) then
							{
								if (getPlayerUID _ct != '') then
								{
									_log4 = format['%5 | Blood: %1 | Weapon: %2 (Ammo: %3) | Distance: %4',(_ct getVariable['USEC_BloodQty',12000]),currentWeapon _ct,_ct ammo (currentWeapon _ct),round(vehicle _unit distance _ct),name _ct];
									["<t align='left'size='0.5'color='#1270ee'>"+_log4+"</t>",safezoneX+0.2,safezoneY+0.54,1.5,0,0,3036] spawn bis_fnc_dynamicText;
								}
								else
								{
									_log4 = format['Type: %1 | Health: %2 | Distance: %3',typeOf _ct,(1-(damage _ct))*100,round(vehicle _unit distance _ct)];
									["<t align='left'size='0.5'color='#1270ee'>"+_log4+"</t>",safezoneX+0.2,safezoneY+0.54,1.5,0,0,3036] spawn bis_fnc_dynamicText;
								};
							};
							sleep 0.1;
						};
						sleep 0.5;
					};
				};
			};
		} forEach playableUnits;
	};
	admin_spec_gear = 
	{
		{
			if (name _x == _this select 0) then
			{
				waitUntil {sleep 0.5;count weapons _x > 0};
				sleep 0.5;
				createGearDialog [(_x), "RscDisplayGear"];
				hint format ["Showing Gear of %1", name _x];
			};
		} forEach playableUnits;
	};
	adminkill =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminRequest = [4,player,_x];
				publicVariableServer "PVAH_AdminRequest";
				hint format ["Killing %1", _this select 0];
				
				_savelog = format["%1 Adminkilled %2",name player, _this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	adminSlap = 
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminRequest = [21,player,_x];
				publicVariableServer "PVAH_AdminRequest";
				hint format ["Slap %1", _this select 0];
				
				_savelog = format["%1 Slaps %2",name player, _this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	adminFDisconnect =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminRequest = [10,player,_x];
				publicVariableServer "PVAH_AdminRequest";
				hint format ["Disconnect %1", _this select 0];
				
				_savelog = format["%1 Disconnected %2",name player, _this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	adminremovegear = 
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminRequest = [8,_x];
				publicVariableServer "PVAH_AdminRequest";
				hint format ["%1 Gear Removed", _this select 0];
				
				_savelog = format["%1 Removes %2 Gear",name player, _this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	adminmsg =
	{
		createDialog "RscDisplayPassword";
		ctrlSetText [1001,"BroadCast Message Plugin"];
		ctrlSetText [101,""];
		ctrlshow [1002,false];
		buttonSetAction [1,"PVAH_AdminRequest = [9, player, toArray(ctrlText 101)]; publicVariableServer ""PVAH_AdminRequest"";"];
	};
	admint2me =
	{
		{
			if (name _x == _this select 0) then
			{
				_pos = getPosATL (vehicle player);
				_dir = direction (vehicle player);
				_distance = 5;
				_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),(_pos select 2)];
				(vehicle _x) setPosATL _pos;
				(vehicle _x) setDir _dir;
				hint format ["%2 Moved to %1",name player, name _x];
				cutText [format["%2 Moved to %1",name player, name _x], "PLAIN"];
				
				_savelog = format["%2 Moved to %1",name player, name _x];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	admintele =
	{
		{
			if (name _x == _this select 0) then
			{
				_pos = getPosATL (vehicle _x);
				_dir = direction (vehicle _x);
				_distance = -5;
				_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),(_pos select 2)];
				(vehicle player) setPosATL _pos;
				(vehicle player) setDir _dir;
				hint format ["Moving to %1",name _x];
				cutText [format["Moving to %1",name _x], "PLAIN"];
				
				_savelog = format["%1 Moving to %2",name player,_this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	adminweapon =
	{
		//	_pWep = currentWeapon player;
		//	player removeWeapon _pWep;
		_item = _this select 0;
		_config = [_item];
		_isOK = [player,_config] call BIS_fnc_invAdd;
		_mags = getArray(configfile >> 'cfgWeapons' >> _item >> 'magazines');
		_config = _mags select 0;
		_isOK = [player,_config] call BIS_fnc_invAdd;
		_isOK = [player,_config] call BIS_fnc_invAdd;
		_isOK = [player,_config] call BIS_fnc_invAdd;
		player selectWeapon _item;
		reload player;
		
		hint format ["%1 Added",_item];
		cutText [format["%1 Added",_item], "PLAIN DOWN"];
		
		_savelog = format['%1 - %2',name player,_this select 0];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer 'PVAH_WriteLogRequest';
	};
	adminmagazino =
	{
		_mag = _this select 0;
		player addMagazine _mag;
		
		hint format ["%1 Added",_mag];
		cutText [format["%1 Added",_mag], "PLAIN DOWN"];
		
		_savelog = format['%1 - %2',name player,_mag];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer 'PVAH_WriteLogRequest';
	};
	adminsveh =
	{
		_dir = getdir vehicle player;
		_pos = getPos vehicle player;
		_pos = [(_pos select 0)+8*sin(_dir),(_pos select 1)+8*cos(_dir),0];
		PVAH_AdminRequest = [0, player, _this select 0, _pos];
		publicVariableServer "PVAH_AdminRequest";
		
		cutText [format["SPAWNED: %1 @ %2",_this select 0,_pos], "PLAIN DOWN"];
	};
	adminsobj =
	{
		_dir = getdir vehicle player;
		_pos = getPos vehicle player;
		_pos = [(_pos select 0)+8*sin(_dir),(_pos select 1)+8*cos(_dir),0];
		PVAH_AdminRequest = [0, player, _this select 0, _pos];
		publicVariableServer "PVAH_AdminRequest";
		
		_savelog = format["%1 - %2 at %3",name player,_this select 0, mapGridPosition getPos player];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
	};
	adminUncon =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminRequest = [11,player,_x];
				publicVariableServer "PVAH_AdminRequest";
				hint format ["Putting %1 to sleep...", _this select 0];
				
				_savelog = format["%1 Putting %2 to sleep...",name player,_this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	admin_d0 =
	{
		deleteMarker "rspawn_east";
		_tmp = createMarker ["rspawn_east", [0,0,0]];
		_tmp setMarkerText (_this select 0);
		PVAH_AdminRequest = [69];
		publicVariableServer "PVAH_AdminRequest";
	};
	admin_del_bxs =
	{
		PVAH_AdminRequest = [14];
		publicVariableServer "PVAH_AdminRequest";
		
		hint "deleting boxes..";
		
		_savelog = format["%1 deleted boxes",name player];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
	};
	adminDrug = 
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminRequest = [15,player,_x];
				publicVariableServer "PVAH_AdminRequest";
				hint format ["Drugging %1...", _this select 0];
				
				_savelog = format["%1 drugged %2",name player,_this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	adminSuicide =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminRequest = [22,player,_x];
				publicVariableServer "PVAH_AdminRequest";
				hint format ["Suiciding %1", _this select 0];
				
				_savelog = format["%1 Suiciding %2",name player,_this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	adminClearBan =
	{
		PVAH_AdminRequest = [16,player];
		publicVariableServer "PVAH_AdminRequest";
		hint "Bans cleared!";
		
		_savelog = format["%1 cleared Bans",name player];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
	};
	adminKick =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminRequest = [17,player,_x];
				publicVariableServer "PVAH_AdminRequest";
				hint format ["Kicked %1...", _this select 0];
				
				_savelog = format["%1 Kicked %2",name player,_this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};	
	adminBan =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminRequest = [18,_x];
				publicVariableServer "PVAH_AdminRequest";
				hint format ["Banned %1...", _this select 0];
				
				_savelog = format["%1 Banned %2",name player,_this select 0];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		} forEach playableUnits;
	};
	adminUnBan =
	{
		_uid = _this select 0;
		_name = _this select 1;
		
		PVAH_AdminRequest = [182,_uid,_name];
		publicVariableServer "PVAH_AdminRequest";
		hint format ["UnBanned %1 (%2)",_name,_uid];
		
		_savelog = format["%1 UnBanned %2 (%3)",name player,_name,_uid];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
	};
	adminDelete =
	{
		DELETE_THIS = nil;
		_delete = cursorTarget;
		if (isNull _delete) exitWith {hint "target doesn't exist";cutText ["target doesn't exist", "PLAIN"];};
		adminDeleteX = 
		[
			["",true],
			[(format ["%1",typeOF DELETE_THIS]), [-1], "", -5, [["expression", ""]], "1", "0"],
			["Delete", [2], "", -5, [["expression", "[] spawn adminDeleteNOW"]], "1", "1"],
			["Exit", [3], "", -5, [["expression", ""]], "1", "1"]
		];
		adminDeleteNOW = {
			if (!isNull DELETE_THIS) then
			{
				systemchat format ["<System>:  %1  DELETED",typeof DELETE_THIS];
				deletevehicle DELETE_THIS;
			};
		};		
		if (!isNull _delete) then
		{
			DELETE_THIS = nil;
			DELETE_THIS = _delete;
			systemchat format ["<System>: DELETE  %1  ?",typeOF DELETE_THIS];
			showCommandingMenu "#USER:adminDeleteX";
		};
	};
	admnSTARscrll = {
		admin_aimkill =
		{
			_object = cursortarget;
			if (!isNull _object) then
			{
				_object setDamage 2;
				cutText [format["%1 Destroyed", _object], "PLAIN"];
			};
		};
		admin_aimdel =
		{
			_object = cursortarget;
			if (!isNull _object) then
			{
				PVAH_AdminRequest = [-2,_object];
				publicVariableServer "PVAH_AdminRequest";
				sleep 1;
				deleteVehicle _object;
			};
		};
		admin_envscrl =
		{
			surrmenu = 
			[
				["",true],
				["Terrain", [2], "#USER:termenu", -5, [["expression", ""]], "1", "1"],	
				["View Distance", [3], "#USER:distmenu", -5, [["expression", ""]], "1", "1"],	
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["Time", [4], "#USER:dtimemenu", -5, [["expression", ""]], "1", "1"],	
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["Overcast", [5], "#USER:overcastmenu", -5, [["expression", ""]], "1", "1"],	
				["Fog", [6], "#USER:fogmenu", -5, [["expression", ""]], "1", "1"],	
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
			];
			dtimemenu = 
			[
				["", true],	
				["Select time:", [-1], "", -5, [["expression", ""]], "1", "0"], 	
				["00:00", [2], "", -5, [["expression", "setDate [date select 0, date select 1, date select 2, 0, 0];"]], "1", "1"],  
				["03:00", [3], "", -5, [["expression", "setDate [date select 0, date select 1, date select 2, 3, 0];"]], "1", "1"],  
				["06:00", [4], "", -5, [["expression", "setDate [date select 0, date select 1, date select 2, 6, 0];"]], "1", "1"],  
				["09:00", [5], "", -5, [["expression", "setDate [date select 0, date select 1, date select 2, 9, 0];"]], "1", "1"],  
				["12:00", [5], "", -5, [["expression", "setDate [date select 0, date select 1, date select 2, 12, 0];"]], "1", "1"],  
				["15:00", [6], "", -5, [["expression", "setDate [date select 0, date select 1, date select 2, 15, 0];"]], "1", "1"],  
				["18:00", [7], "", -5, [["expression", "setDate [date select 0, date select 1, date select 2, 18, 0];"]], "1", "1"],  
				["21:00", [8], "", -5, [["expression", "setDate [date select 0, date select 1, date select 2, 21, 0];"]], "1", "1"],  
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["Back", [12], "", -4, [["expression", ""]], "1", "1"],	
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"] 
			];
			termenu = 
			[
				["", true],	
				["Select terrain level:", [-1], "", -5, [["expression", ""]], "1", "0"], 	
				["Very High", [2], "", -5, [["expression", "setTerrainGrid 3.125;"]], "1", "1"],  
				["High", [3], "", -5, [["expression", "setTerrainGrid 6.25;"]], "1", "1"],  
				["Normal", [4], "", -5, [["expression", "setTerrainGrid 12.5;"]], "1", "1"],  
				["Low", [5], "", -5, [["expression", "setTerrainGrid 25;"]], "1", "1"],  
				["Very Low", [6], "", -5, [["expression", "setTerrainGrid 50;"]], "1", "1"],  
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["Back", [12], "", -4, [["expression", ""]], "1", "1"],	
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"] 
			];
			overcastmenu = 
			[
				["", true],	
				["Select overcast:", [-1], "", -5, [["expression", ""]], "1", "0"], 	
				["Clear", [2], "", -5, [["expression", "3 setovercast 0;"]], "1", "1"],  
				["Partly Sunny", [3], "", -5, [["expression", "3 setovercast 0.2;"]], "1", "1"],  
				["Cloudy", [4], "", -5, [["expression", "3 setovercast 0.4;"]], "1", "1"],  
				["Rain", [5], "", -5, [["expression", "3 setovercast 0.6;"]], "1", "1"],  
				["Heavy Rain", [6], "", -5, [["expression", "3 setovercast 0.8;"]], "1", "1"],  
				["Storm", [7], "", -5, [["expression", "3 setovercast 1;"]], "1", "1"],  
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["Back", [12], "", -4, [["expression", ""]], "1", "1"],	
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"] 
			];
			fogmenu = 
			[
				["", true],	
				["Select fog level:", [-1], "", -5, [["expression", ""]], "1", "0"], 	
				["Off", [2], "", -5, [["expression", "3 setFog 0;"]], "1", "1"],  
				["20%", [3], "", -5, [["expression", "3 setFog 0.2;"]], "1", "1"],  
				["40%", [4], "", -5, [["expression", "3 setFog 0.4;"]], "1", "1"],  
				["60%", [5], "", -5, [["expression", "3 setFog 0.6;"]], "1", "1"],  
				["80%", [6], "", -5, [["expression", "3 setFog 0.8;"]], "1", "1"],  
				["100%", [7], "", -5, [["expression", "3 setFog 1;"]], "1", "1"],  
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["Back", [12], "", -4, [["expression", ""]], "1", "1"],	
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"] 
			];
			distmenu = 
			[
				["", true],	
				["Select rendering distance:", [-1], "", -5, [["expression", ""]], "1", "0"], 
				["600", [2], "", -5, [["expression", "setViewDistance 600;"]], "1", "1"],  	
				["900", [2], "", -5, [["expression", "setViewDistance 900;"]], "1", "1"],  
				["1000", [3], "", -5, [["expression", "setViewDistance 1000;"]], "1", "1"],  
				["1200", [4], "", -5, [["expression", "setViewDistance 1200;"]], "1", "1"],  
				["1500", [5], "", -5, [["expression", "setViewDistance 1500;"]], "1", "1"],  
				["2000", [5], "", -5, [["expression", "setViewDistance 2000;"]], "1", "1"],  
				["2250", [6], "", -5, [["expression", "setViewDistance 2250;"]], "1", "1"],  
				["2500", [7], "", -5, [["expression", "setViewDistance 2500;"]], "1", "1"], 
				["4000", [8], "", -5, [["expression", "setViewDistance 4000;"]], "1", "1"], 
				["5000", [9], "", -5, [["expression", "setViewDistance 5000;"]], "1", "1"],  
				["6000", [10], "", -5, [["expression", "setViewDistance 6000;"]], "1", "1"], 
				["7000", [10], "", -5, [["expression", "setViewDistance 7000;"]], "1", "1"], 
				["8000", [10], "", -5, [["expression", "setViewDistance 8000;"]], "1", "1"], 
				["10000", [10], "", -5, [["expression", "setViewDistance 10000;"]], "1", "1"], 
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["Back", [12], "", -4, [["expression", ""]], "1", "1"],	
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"] 
			];
			showCommandingMenu "#USER:surrmenu";
		};
		admin_spwnwepscrl =
		{
			spawnweapons1 = [];
			spawnweapons2 = [];
			spawnweapons3 = [];
			spawnweapons4 = [];
			spawnweapons5 = [];
			spawnweapons6 = [];
			spawnweapons7 = [];
			spawnweapons8 = [];
			spawnweapons9 = [];
			spawnweapons10 = [];
			spawnweapons11 = [];
			spawnweapons12 = [];
			spawnweapons13 = [];
			spawnweapons14 = [];
			spawnweapons15 = [];
			spawnweapons16 = [];
			spawnweapons17 = [];
			spawnweapons18 = [];
			spawnweapons19 = [];
			spawnweapons20 = [];
			_text = "player addWeapon '%1'; _mags = getArray(configfile >> 'cfgWeapons' >> '%1' >> 'magazines'); _mag = _mags select 0; player addMagazine _mag; player addMagazine _mag; player addMagazine _mag; player addMagazine _mag; player selectWeapon '%1'; reload player;player setUnitRecoilCoefficient 0;";
			spawnweapons1 = 
			[
				["", true],
				["Popular", [2], "#USER:spawnweapons2", -5, [["expression", ""]], "1", "1"],
				["Sidearms", [3], "#USER:spawnweapons3", -5, [["expression", ""]], "1", "1"],
				["Shotguns", [4], "#USER:spawnweapons4", -5, [["expression", ""]], "1", "1"],
				["Sub Machine Guns", [5], "#USER:spawnweapons5", -5, [["expression", ""]], "1", "1"],
				["Light Machine Guns", [6], "#USER:spawnweapons6", -5, [["expression", ""]], "1", "1"],
				["Assault Rifles", [7], "#USER:spawnweapons8", -5, [["expression", ""]], "1", "1"],
				["Sniper Rifles", [8], "#USER:spawnweapons14", -5, [["expression", ""]], "1", "1"],
				["Explosives", [9], "#USER:spawnweapons16", -5, [["expression", ""]], "1", "1"],
				["Smoke", [10], "#USER:spawnweapons17", -5, [["expression", ""]], "1", "1"],
				["Flares", [11], "#USER:spawnweapons19", -5, [["expression", ""]], "1", "1"],
				["Chemlights + HandRoadFlare", [12], "#USER:spawnweapons20", -5, [["expression", ""]], "1", "1"],
				["VEHICLE WEAPONS", [9], "#USER:vehicleWEPS_star", -5, [["expression", ""]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"]
			];
			showCommandingMenu "#USER:spawnweapons1";
			spawnweapons2 = 
			[
				["", true],
				["M9SD", [2], "", -5, [["expression", format[_text, "M9SD"]]], "1", "1"],
				["Bizon PP-19 SD", [3], "", -5, [["expression", format[_text, "bizon_silenced"]]], "1", "1"],
				["M4A1 CCO SD", [4], "", -5, [["expression", format[_text, "M4A1_AIM_SD_camo"]]], "1", "1"],
				["L85A2 AWS", [5], "", -5, [["expression", format[_text, "BAF_L85A2_RIS_CWS"]]], "1", "1"],
				["AKM", [6], "", -5, [["expression", format[_text, "AK_47_M"]]], "1", "1"],
				["MK48 Mod 0", [7], "", -5, [["expression", format[_text, "Mk_48_DZ"]]], "1", "1"],
				["SVD Camo", [8], "", -5, [["expression", format[_text, "SVD_CAMO"]]], "1", "1"],
				["M107", [9], "", -5, [["expression", format[_text, "m107_DZ"]]], "1", "1"],
				["AS50", [10], "", -5, [["expression", format[_text, "BAF_AS50_scoped"]]], "1", "1"],
				["PDW SD *", [11], "", -5, [["expression", format[_text, "UZI_SD_EP1"]]], "1", "1"],
				["AS50 TWS *", [12], "", -5, [["expression", format[_text, "BAF_AS50_TWS"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"]
			];
			spawnweapons3 = 
			[
				["", true],
				["Makarov", [2], "", -5, [["expression", format[_text, "Makarov"]]], "1", "1"],
				["Revolver", [3], "", -5, [["expression", format[_text, "revolver_EP1"]]], "1", "1"],
				["M1911", [4], "", -5, [["expression", format[_text, "Colt1911"]]], "1", "1"],
				["G17", [5], "", -5, [["expression", format[_text, "glock17_EP1"]]], "1", "1"],
				["PDW", [6], "", -5, [["expression", format[_text, "UZI_EP1"]]], "1", "1"],
				["M9", [7], "", -5, [["expression", format[_text, "M9"]]], "1", "1"],
				["M9SD", [8], "", -5, [["expression", format[_text, "M9SD"]]], "1", "1"],
				["Makarov SD *", [9], "", -5, [["expression", format[_text, "MakarovSD"]]], "1", "1"],
				["Sa-61 *", [10], "", -5, [["expression", format[_text, "Sa61_EP1"]]], "1", "1"],
				["Revolver Gold *", [11], "", -5, [["expression", format[_text, "revolver_gold_EP1"]]], "1", "1"],
				["PDW SD *", [12], "", -5, [["expression", format[_text, "UZI_SD_EP1"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"]
			];
			spawnweapons4 = 
			[
				["", true],
				["Hatchet", [2], "", -5, [["expression", format[_text, "MeleeHatchet"]]], "1", "1"],
				["Crowbar", [3], "", -5, [["expression", format[_text, "MeleeCrowbar"]]], "1", "1"],
				["Compound Crossbow", [4], "", -5, [["expression", format[_text, "Crossbow"]]], "1", "1"],
				["Double-barreled Shotgun", [5], "", -5, [["expression", format[_text, "MR43"]]], "1", "1"], 
				["Winchester 1866", [6], "", -5, [["expression", format[_text, "Winchester1866"]]], "1", "1"], 
				["M1014", [7], "", -5, [["expression", format[_text, "M1014"]]], "1", "1"], 
				["Remington 870 (Flashlight)", [8], "", -5, [["expression", format[_text, "Remington870_lamp"]]], "1", "1"],
				["Saiga 12K *", [9], "", -5, [["expression", format[_text, "Saiga12K"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"]
			];
			spawnweapons5 = 
			[
				["", true],
				["PDW", [2], "", -5, [["expression", format[_text, "UZI_EP1"]]], "1", "1"],
				["Bizon PP-19 SD", [3], "", -5, [["expression", format[_text, "bizon_silenced"]]], "1", "1"],
				["MP5A5", [4], "", -5, [["expression", format[_text, "MP5A5"]]], "1", "1"],
				["MP5SD6", [5], "", -5, [["expression", format[_text, "MP5SD"]]], "1", "1"],
				["Sa-61 *", [6], "", -5, [["expression", format[_text, "Sa61_EP1"]]], "1", "1"],
				["PDW SD *", [7], "", -5, [["expression", format[_text, "UZI_SD_EP1"]]], "1", "1"],
				["Bizon PP-19 *", [8], "", -5, [["expression", format[_text, "bizon"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"]
			];
			spawnweapons6 = 
			[
				["", true],
				[">>> Next >>>", [13], "#USER:spawnweapons7", -5, [["expression", ""]], "1", "1"],
				["M240", [2], "", -5, [["expression", format[_text, "M240_DZ"]]], "1", "1"],
				["M249 SAW", [3], "", -5, [["expression", format[_text, "M249_DZ"]]], "1", "1"],
				["Mk 48 Mod 0", [4], "", -5, [["expression", format[_text, "Mk_48_DZ"]]], "1", "1"],
				["L7A2 GPMG *", [5], "", -5, [["expression", format[_text, "BAF_L7A2_GPMG"]]], "1", "1"],
				["M60E4 *", [6], "", -5, [["expression", format[_text, "M60A4_EP1"]]], "1", "1"],
				["MG36 *", [7], "", -5, [["expression", format[_text, "MG36"]]], "1", "1"],
				["PKM *", [8], "", -5, [["expression", format[_text, "PK"]]], "1", "1"],
				["PKP (Pecheneg) *", [9], "", -5, [["expression", format[_text, "Pecheneg"]]], "1", "1"],
				["RPK *", [10], "", -5, [["expression", format[_text, "RPK_74"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"]
			];
			spawnweapons7 = 
			[
				["", true],
				["<<< Back <<<", [12], "", -4, [["expression", ""]], "1", "1"],
				["L110A1 *", [2], "", -5, [["expression", format[_text, "BAF_L110A1_Aim"]]], "1", "1"],
				["M249 SAW *", [3], "", -5, [["expression", format[_text, "M249_EP1"]]], "1", "1"],
				["M240 Scope *", [4], "", -5, [["expression", format[_text, "m240_scoped_EP1"]]], "1", "1"],
				["M249 Scope *", [5], "", -5, [["expression", format[_text, "M249_m145_EP1"]]], "1", "1"],
				["Mk48 Mod 0 (Camo) *", [6], "", -5, [["expression", format[_text, "Mk_48_DES_EP1"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"]
			];
			spawnweapons8 = 
			[
				["", true],
				[">>> Next >>>", [13], "#USER:spawnweapons9", -5, [["expression", ""]], "1", "1"],
				["AK-74", [2], "", -5, [["expression", format[_text, "AK_74"]]], "1", "1"],
				["AKS-74 Kobra", [3], "", -5, [["expression", format[_text, "AKS_74_kobra"]]], "1", "1"],
				["AKS-74U", [4], "", -5, [["expression", format[_text, "AKS_74_U"]]], "1", "1"],
				["AKM", [5], "", -5, [["expression", format[_text, "AK_47_M"]]], "1", "1"],
				["FN FAL", [6], "", -5, [["expression", format[_text, "FN_FAL"]]], "1", "1"],
				["FN FAL AN/PVS-4", [7], "", -5, [["expression", format[_text, "FN_FAL_ANPVS4"]]], "1", "1"],
				["L85A2 AWS", [8], "", -5, [["expression", format[_text, "BAF_L85A2_RIS_CWS"]]], "1", "1"],
				["Lee Enfield", [9], "", -5, [["expression", format[_text, "LeeEnfield"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"]
			];
			spawnweapons9 = 
			[
				["", true],
				[">>> Next >>>", [13], "#USER:spawnweapons10", -5, [["expression", ""]], "1", "1"],
				["<<< Back <<<", [12], "", -4, [["expression", ""]], "1", "1"],
				["M14 AIM", [2], "", -5, [["expression", format[_text, "M14_EP1"]]], "1", "1"],
				["M16A2", [3], "", -5, [["expression", format[_text, "M16A2"]]], "1", "1"],
				["M16A2 M203", [4], "", -5, [["expression", format[_text, "M16A2GL"]]], "1", "1"],
				["M16A4 ACOG", [5], "", -5, [["expression", format[_text, "m16a4_acg"]]], "1", "1"],
				["M4A1", [6], "", -5, [["expression", format[_text, "M4A1"]]], "1", "1"],  
				["M4A1 CCO", [7], "", -5, [["expression", format[_text, "M4A1_Aim"]]], "1", "1"],
				["M4A1 CCO SD (Camo)", [8], "", -5, [["expression", format[_text, "M4A1_AIM_SD_camo"]]], "1", "1"],
				["M4A1 Holo", [9], "", -5, [["expression", format[_text, "M4A1_HWS_GL"]]], "1", "1"],
				["M4A3 CCO", [10], "", -5, [["expression", format[_text, "M4A3_CCO_EP1"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"]
			];
			spawnweapons10 = 
			[
				["", true],
				[">>> Next >>>", [13], "#USER:spawnweapons11", -5, [["expression", ""]], "1", "1"],
				["<<< Back <<<", [12], "", -4, [["expression", ""]], "1", "1"],
				["AK-107 GP-25 *", [2], "", -5, [["expression", format[_text, "AK_107_GL_kobra"]]], "1", "1"],
				["AK-107 GP-25 PSO *", [3], "", -5, [["expression", format[_text, "AK_107_GL_pso"]]], "1", "1"],
				["AK-107 Kobra*", [4], "", -5, [["expression", format[_text, "AK_107_kobra"]]], "1", "1"],
				["AK-107 PSO *", [5], "", -5, [["expression", format[_text, "AK_107_pso"]]], "1", "1"],
				["AK-74 GP-25 *", [6], "", -5, [["expression", format[_text, "AK_74_GL"]]], "1", "1"],
				["AK-74 GP-25 Kobra *", [7], "", -5, [["expression", format[_text, "AK_74_GL_kobra"]]], "1", "1"],
				["AKS-74UN Kobra SD *", [8], "", -5, [["expression", format[_text, "AKS_74_UN_kobra"]]], "1", "1"],
				["AKS-74 PSO *", [9], "", -5, [["expression", format[_text, "AKS_74_pso"]]], "1", "1"],
				["AKS *", [10], "", -5, [["expression", format[_text, "AK_47_S"]]], "1", "1"],
				["AKS (Gold) *", [11], "", -5, [["expression", format[_text, "AKS_GOLD"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"]
			];
			spawnweapons11 = 
			[
				["", true],
				[">>> Next >>>", [13], "#USER:spawnweapons12", -5, [["expression", ""]], "1", "1"],
				["<<< Back <<<", [12], "", -4, [["expression", ""]], "1", "1"],
				["G36 *", [2], "", -5, [["expression", format[_text, "G36a"]]], "1", "1"],
				["G36 (Camo) *", [3], "", -5, [["expression", format[_text, "G36A_camo"]]], "1", "1"],
				["G36C *", [4], "", -5, [["expression", format[_text, "G36C"]]], "1", "1"],
				["G36C (Camo) *", [5], "", -5, [["expression", format[_text, "G36C_camo"]]], "1", "1"],
				["G36C SD *", [6], "", -5, [["expression", format[_text, "G36_C_SD_eotech"]]], "1", "1"],
				["G36C SD (Camo) *", [7], "", -5, [["expression", format[_text, "G36_C_SD_camo"]]], "1", "1"],
				["G36K *", [8], "", -5, [["expression", format[_text, "G36K"]]], "1", "1"],
				["G36K (Camo) *", [9], "", -5, [["expression", format[_text, "G36K_camo"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"]
			];
			spawnweapons12 = 
			[
				["", true],
				[">>> Next >>>", [13], "#USER:spawnweapons13", -5, [["expression", ""]], "1", "1"],
				["<<< Back <<<", [12], "", -4, [["expression", ""]], "1", "1"],
				["L85A2 ACOG *", [2], "", -5, [["expression", format[_text, "BAF_L85A2_RIS_ACOG"]]], "1", "1"],
				["L85A2 Holo *", [3], "", -5, [["expression", format[_text, "BAF_L85A2_RIS_Holo"]]], "1", "1"],
				["L85A2 SUSAT *", [4], "", -5, [["expression", format[_text, "BAF_L85A2_RIS_SUSAT"]]], "1", "1"],
				["L85A2 ACOG GL *", [5], "", -5, [["expression", format[_text, "BAF_L85A2_UGL_ACOG"]]], "1", "1"],
				["L85A2 Holo GL *", [6], "", -5, [["expression", format[_text, "BAF_L85A2_UGL_Holo"]]], "1", "1"],
				["L85A2 SUSAT GL *", [7], "", -5, [["expression", format[_text, "BAF_L85A2_UGL_SUSAT"]]], "1", "1"],
				["L86A2 LSW *", [8], "", -5, [["expression", format[_text, "BAF_L86A2_ACOG"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"]
			];
			spawnweapons13 = 
			[
				["", true],
				["<<< Back <<<", [12], "", -4, [["expression", ""]], "1", "1"],
				["M16A4 *", [2], "", -5, [["expression", format[_text, "M16A4"]]], "1", "1"],
				["M16A4 M203 *", [3], "", -5, [["expression", format[_text, "M16A4_GL"]]], "1", "1"],
				["M16A4 M203 ACOG *", [4], "", -5, [["expression", format[_text, "M16A4_ACG_GL"]]], "1", "1"],
				["M4A1 Holo (Camo) *", [5], "", -5, [["expression", format[_text, "M4A1_HWS_GL_camo"]]], "1", "1"],
				["M4A1 Holo SD (Camo) *", [6], "", -5, [["expression", format[_text, "M4A1_HWS_GL_SD_Camo"]]], "1", "1"],
				["M4A1 M203 RCO *", [7], "", -5, [["expression", format[_text, "M4A1_RCO_GL"]]], "1", "1"],
				["M4A1 CCO (Camo) *", [8], "", -5, [["expression", format[_text, "M4A1_Aim_camo"]]], "1", "1"],
				["M4A3 M203 ACOG *", [9], "", -5, [["expression", format[_text, "M4A3_RCO_GL_EP1"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"]
			];
			spawnweapons14 = 
			[
				["", true],
				[">>> Next >>>", [13], "#USER:spawnweapons15", -5, [["expression", ""]], "1", "1"],
				["CZ 550", [2], "", -5, [["expression", format[_text, "huntingrifle"]]], "1", "1"],
				["M24", [3], "", -5, [["expression", format[_text, "M24"]]], "1", "1"],
				["DMR", [4], "", -5, [["expression", format[_text, "DMR"]]], "1", "1"],
				["SVD (Camo)", [5], "", -5, [["expression", format[_text, "SVD_CAMO"]]], "1", "1"],
				["M107", [6], "", -5, [["expression", format[_text, "m107_DZ"]]], "1", "1"],
				["AS50", [7], "", -5, [["expression", format[_text, "BAF_AS50_scoped"]]], "1", "1"],
				["AS50 TWS *", [8], "", -5, [["expression", format[_text, "BAF_AS50_TWS"]]], "1", "1"],
				["KSVK *", [9], "", -5, [["expression", format[_text, "KSVK"]]], "1", "1"],
				["M40A3 *", [10], "", -5, [["expression", format[_text, "M40A3"]]], "1", "1"],
				["Mk12 SPR *", [11], "", -5, [["expression", format[_text, "M4SPR"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"]
			];
			spawnweapons15 = 
			[
				["", true],
				["<<< Back <<<", [12], "", -4, [["expression", ""]], "1", "1"],
				["L115A3 LRR*", [2], "", -5, [["expression", format[_text, "BAF_LRR_scoped_W"]]], "1", "1"],
				["L115A3 LRR (Desert Camo)*", [3], "", -5, [["expression", format[_text, "BAF_LRR_scoped"]]], "1", "1"],
				["M24 (Desert Camo)*", [4], "", -5, [["expression", format[_text, "M24_des_EP1"]]], "1", "1"],
				["SVD *", [5], "", -5, [["expression", format[_text, "SVD"]]], "1", "1"],
				["SVD (Desert Camo) *", [6], "", -5, [["expression", format[_text, "SVD_des_EP1"]]], "1", "1"],
				["SVD NSPU *", [7], "", -5, [["expression", format[_text, "SVD_NSPU_EP1"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"]
			];
			spawnweapons16 = 
			[
				["", true],
				["M67 Frag Grenade", [2], "", -5, [["expression", "player addMagazine 'HandGrenade_West';"]], "1", "1"],
				["RGO Frag Grenade", [3], "", -5, [["expression", "player addMagazine 'HandGrenade_East';"]], "1", "1"],
				["M203 HE", [4], "", -5, [["expression", "player addMagazine '1Rnd_HE_M203';"]], "1", "1"],
				["GP-25 HE *", [5], "", -5, [["expression", "player addMagazine '1Rnd_HE_GP25';"]], "1", "1"],
				["Satchel Charges", [6], "", -5, [["expression", "player addMagazine 'PipeBomb';"]], "1", "1"],
				["IED (Garbage) *", [7], "", -5, [["expression", "player addMagazine 'BAF_ied_v1';"]], "1", "1"],
				["Mine *", [8], "", -5, [["expression", "player addMagazine 'Mine';"]], "1", "1"],
				["MineE *", [9], "", -5, [["expression", "player addMagazine 'MineE';"]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"]
			];
			spawnweapons17 = 
			[
				["", true],
				[">>> Next >>>", [13], "#USER:spawnweapons18", -5, [["expression", ""]], "1", "1"],
				["Smoke Grenade", [2], "", -5, [["expression", "player addMagazine 'SmokeShell';"]], "1", "1"],
				["Smoke Grenade (Red)", [3], "", -5, [["expression", "player addMagazine 'SmokeShellRed';"]], "1", "1"],
				["Smoke Grenade (Green)", [4], "", -5, [["expression", "player addMagazine 'SmokeShellGreen';"]], "1", "1"],
				["Smoke Grenade (Yellow) *", [5], "", -5, [["expression", "player addMagazine 'SmokeShellYellow';"]], "1", "1"],
				["Smoke Grenade (Orange) *", [6], "", -5, [["expression", "player addMagazine 'SmokeShellOrange';"]], "1", "1"],
				["Smoke Grenade (Purple) *", [7], "", -5, [["expression", "player addMagazine 'SmokeShellPurple';"]], "1", "1"],
				["Smoke Grenade (Blue) *", [8], "", -5, [["expression", "player addMagazine 'SmokeShellBlue';"]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"]
			];
			spawnweapons18 = 
			[
				["", true],
				["<<< Back <<<", [12], "", -4, [["expression", ""]], "1", "1"],
				["M203 Smoke", [2], "", -5, [["expression", "player addMagazine '1Rnd_Smoke_M203';"]], "1", "1"],
				["M203 Smoke (Red) *", [3], "", -5, [["expression", "player addMagazine '1Rnd_SmokeRed_M203';"]], "1", "1"],
				["M203 Smoke (Green) *", [4], "", -5, [["expression", "player addMagazine '1Rnd_SmokeGreen_M203';"]], "1", "1"],
				["M203 Smoke (Yellow) *", [5], "", -5, [["expression", "player addMagazine '1Rnd_SmokeYellow_M203';"]], "1", "1"],
				["GP-25 Smoke *", [6], "", -5, [["expression", "player addMagazine '1Rnd_Smoke_GP25';"]], "1", "1"],
				["GP-25 Smoke (Red) *", [7], "", -5, [["expression", "player addMagazine '1Rnd_SmokeRed_GP25';"]], "1", "1"],
				["GP-25 Smoke (Green) *", [8], "", -5, [["expression", "player addMagazine '1Rnd_SmokeGreen_GP25';"]], "1", "1"],
				["GP-25 Smoke (Yellow) *", [9], "", -5, [["expression", "player addMagazine '1Rnd_SmokeYellow_GP25';"]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"]
			];
			spawnweapons19 = 
			[
				["", true],
				["M203 Flare (White)", [2], "", -5, [["expression", "player addMagazine 'FlareWhite_M203';"]], "1", "1"],
				["M203 Flare (Green)", [3], "", -5, [["expression", "player addMagazine 'FlareGreen_M203';"]], "1", "1"],
				["M203 Flare (Red) *", [4], "", -5, [["expression", "player addMagazine 'FlareRed_M203';"]], "1", "1"],
				["M203 Flare (Yellow) *", [5], "", -5, [["expression", "player addMagazine 'FlareYellow_M203';"]], "1", "1"],
				["GP-25 Flare (White) *", [6], "", -5, [["expression", "player addMagazine 'FlareWhite_GP25';"]], "1", "1"],
				["GP-25 Flare (Green) *", [7], "", -5, [["expression", "player addMagazine 'FlareGreen_GP25';"]], "1", "1"],
				["GP-25 Flare (Red) *", [8], "", -5, [["expression", "player addMagazine 'FlareRed_GP25';"]], "1", "1"],
				["GP-25 Flare (Yellow) *", [9], "", -5, [["expression", "player addMagazine 'FlareYellow_GP25';"]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"]
			];
			spawnweapons20 = 
			[
				["", true],
				["HandChemGreen", [2], "", -5, [["expression", "player addMagazine 'HandChemGreen';"]], "1", "1"],
				["HandChemRed", [3], "", -5, [["expression", "player addMagazine 'HandChemRed';"]], "1", "1"],
				["HandChemBlue", [4], "", -5, [["expression", "player addMagazine 'HandChemBlue';"]], "1", "1"],
				["HandRoadFlare", [4], "", -5, [["expression", "player addMagazine 'HandRoadFlare';"]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"]
			];
			vehicleWEPS_star = 
			[
				["", true],
				["YakB", [2], "", -5, [["expression", "vehicle player addweapon 'YakB';vehicle player addMagazine '1470Rnd_127x108_YakB';vehicle player addMagazine '1470Rnd_127x108_YakB';"]], "1", "1"],
				["Gau8", [3], "", -5, [["expression", "vehicle player addweapon 'Gau8';vehicle player addMagazine '1350Rnd_30mmAP_A10';vehicle player addMagazine '1350Rnd_30mmAP_A10';"]], "1", "1"],
				["GAU12", [4], "", -5, [["expression", "vehicle player addweapon 'GAU12';vehicle player addMagazine '300Rnd_25mm_GAU12';vehicle player addMagazine '300Rnd_25mm_GAU12';"]], "1", "1"],
				["M230", [5], "", -5, [["expression", "vehicle player addweapon 'M230';vehicle player addMagazine '1200Rnd_30x113mm_M789_HEDP';vehicle player addMagazine '1200Rnd_30x113mm_M789_HEDP';"]], "1", "1"],
				["Go Crazy", [5], "", -5, [["expression", "call i_n_f_i_S_T_A_R__goes_crazy;"]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"]
			];
			i_n_f_i_S_T_A_R__goes_crazy =
			{
				_SexyGun = ['Gau8','GAU12','AZP85','M197','YakB'];
				_SexyAmmo = ['1350Rnd_30mmAP_A10','1350Rnd_30mmAP_A10','300Rnd_25mm_GAU12','300Rnd_25mm_GAU12','2000Rnd_23mm_AZP85','2000Rnd_23mm_AZP85','750Rnd_M197_AH1','750Rnd_M197_AH1','1470Rnd_127x108_YakB','1470Rnd_127x108_YakB'];
				{vehicle player addweapon _x;} forEach _SexyGun;
				{vehicle player addMagazine _x;} forEach _SexyAmmo;
			};
		};
		admin_sknsscrl =
		{
			infiSTARadmin_skinz = 
			[
				["",true],
				["Soldier suit", [2], "", -5, [["expression", "player addMagazine 'Skin_Soldier1_DZ';"]], "1", "1"],
				["Survivor suit", [3], "", -5, [["expression", "player addMagazine 'Skin_Survivor2_DZ';"]], "1", "1"],
				["Camo suit", [4], "", -5, [["expression", "player addMagazine 'Skin_Camo1_DZ';"]], "1", "1"],
				["Ghilli suit", [5], "", -5, [["expression", "player addMagazine 'Skin_Sniper1_DZ';"]], "1", "1"],
				["Not on all mods:", [-1], "", -5, [["expression", ""]], "1", "0"],
				["CZ Special Forces", [6], "", -5, [["expression", "player addMagazine 'Skin_CZ_Special_forces_GL_DES_EP1_DZ';"]], "1", "1"],
				["Bandit Sniper", [7], "", -5, [["expression", "player addMagazine 'Skin_GUE_Soldier_Sniper_DZ';"]], "1", "1"],
				["Bandit Gunner", [8], "", -5, [["expression", "player addMagazine 'Skin_GUE_Soldier_MG_DZ';"]], "1", "1"],
				["Bandit Baklava", [9], "", -5, [["expression", "player addMagazine 'Skin_GUE_Soldier_Crew_DZ';"]], "1", "1"],
				["Urban Camo", [10], "", -5, [["expression", "player addMagazine 'Skin_Graves_Light_DZ';"]], "1", "1"]
			];
			showCommandingMenu "#USER:infiSTARadmin_skinz";
		};
		admin_foodscrl =
		{
			food = 
			[	["",true],
				["Steak Raw", [2], "", -5, [["expression", "player addMagazine 'FoodSteakRaw';"]], "1", "1"],
				["Steak Cooked", [3], "", -5, [["expression", "player addMagazine 'FoodSteakCooked';"]], "1", "1"],
				["Can Baked Beans", [4], "", -5, [["expression", "player addMagazine 'FoodCanBakedBeans';"]], "1", "1"],
				["Can Sardines", [5], "", -5, [["expression", "player addMagazine 'FoodCanSardines';"]], "1", "1"],
				["Can Pasta", [6], "", -5, [["expression", "player addMagazine 'FoodCanPasta';"]], "1", "1"],
				["Soda Coke", [7], "", -5, [["expression", "player addMagazine 'ItemSodaCoke';"]], "1", "1"],
				["Mountain Dew", [8], "", -5, [["expression", "player addMagazine 'ItemSodaMdew';"]], "1", "1"],
				["Waterbottle", [9], "", -5, [["expression", "player addMagazine 'ItemWaterbottle';"]], "1", "1"],		
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
			];
			showCommandingMenu "#USER:food";
		};
		admin_invscrl =
		{
			items1 = 
			[
				["",true],
				[">>> Next >>>", [11], "#USER:items2", -5, [["expression", ""]], "1", "1"],
				["PAGE 1", [-1], "", -5, [["expression", ""]], "1", "0"],	
				["Map", [2], "", -5, [["expression", "player addWeapon 'ItemMap';"]], "1", "1"],
				["GPS", [3], "", -5, [["expression", "player addWeapon 'ItemGps';"]], "1", "1"],
				["Watch", [4], "", -5, [["expression", "player addWeapon 'ItemWatch';"]], "1", "1"],
				["Radio", [5], "", -5, [["expression", "player addWeapon 'ItemRadio';"]], "1", "1"],
				["Compass", [6], "", -5, [["expression", "player addWeapon 'ItemCompass';"]], "1", "1"],
				["Binocular", [7], "", -5, [["expression", "player addWeapon 'Binocular';"]], "1", "1"],
				["Rangefinder", [8], "", -5, [["expression", "player addWeapon 'Binocular_Vector';"]], "1", "1"],
				["Laser marker", [9], "", -5, [["expression", "player addWeapon 'Laserdesignator';player addMagazine 'Laserbatteries';"]], "1", "1"],
				["Nightvision goggles", [10], "", -5, [["expression", "player addWeapon 'NVGoggles';"]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"]
			];
			items2 = 
			[
				["",true],
				[">>> Next >>>", [11], "#USER:items3", -5, [["expression", ""]], "1", "1"],
				["<<< Back <<<", [12], "", -4, [["expression", ""]], "1", "1"],	
				["PAGE 2", [-1], "", -5, [["expression", ""]], "1", "0"],	
				["Hunting knife", [2], "", -5, [["expression", "player addWeapon 'ItemKnife';"]], "1", "1"],
				["Hatchet", [3], "", -5, [["expression", "player addWeapon 'ItemHatchet';"]], "1", "1"],
				["Toolbox", [4], "", -5, [["expression", "player addWeapon 'ItemToolbox';"]], "1", "1"],
				["Military Flashlight", [5], "", -5, [["expression", "player addWeapon 'ItemFlashlightRed';"]], "1", "1"],
				["Matchbox", [6], "", -5, [["expression", "player addWeapon 'ItemMatchbox';"]], "1", "1"],
				["E-Tool", [7], "", -5, [["expression", "player addWeapon 'ItemEtool';"]], "1", "1"],	
				["", [-1], "", -5, [["expression", ""]], "1", "0"]
			];
			items3 = 
			[
				["",true],
				["<<< Back <<<", [12], "", -4, [["expression", ""]], "1", "1"],	
				["PAGE 3", [-1], "", -5, [["expression", ""]], "1", "0"],
				["PartEngine", [2], "", -5, [["expression", "player addMagazine 'PartEngine';"]], "1", "1"],
				["PartFueltank", [3], "", -5, [["expression", "player addMagazine 'PartFueltank';"]], "1", "1"],
				["PartVRotor", [4], "", -5, [["expression", "player addMagazine 'PartVRotor';"]], "1", "1"],
				["PartGeneric", [5], "", -5, [["expression", "player addMagazine 'PartGeneric';"]], "1", "1"],
				["PartWheel", [6], "", -5, [["expression", "player addMagazine 'PartWheel';"]], "1", "1"],
				["PartGlass", [7], "", -5, [["expression", "player addMagazine 'PartGlass';"]], "1", "1"],
				["Wire", [8], "", -5, [["expression", "player addMagazine 'ItemWire';"]], "1", "1"],
				["Sandbag", [9], "", -5, [["expression", "player addMagazine 'ItemSandbag';"]], "1", "1"],
				["ItemTankTrap", [10], "", -5, [["expression", "player addMagazine 'ItemTankTrap';"]], "1", "1"],
				["ItemTent", [11], "", -5, [["expression", "player addMagazine 'ItemTent';"]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"]
			];
			showCommandingMenu "#USER:items1";
		};
		admin_medscrl =
		{
			medical = 
			[
				["",true],
				["Bandage", [2], "", -5, [["expression", "player addMagazine 'ItemBandage';"]], "1", "1"],
				["Painkiller", [3], "", -5, [["expression", "player addMagazine 'ItemPainkiller';"]], "1", "1"],
				["Morphine", [4], "", -5, [["expression", "player addMagazine 'ItemMorphine';"]], "1", "1"],
				["Epinephrine", [5], "", -5, [["expression", "player addMagazine 'ItemEpinephrine';"]], "1", "1"],
				["Antibiotic", [6], "", -5, [["expression", "player addMagazine 'ItemAntibiotic';"]], "1", "1"],
				["Bloodbag", [7], "", -5, [["expression", "player addMagazine 'ItemBloodbag';"]], "1", "1"],
				["Heatpack", [8], "", -5, [["expression", "player addMagazine 'ItemHeatPack';"]], "1", "1"],	
				["Exit", [13], "", -3, [["expression", ""]], "1", "1"]	
			];
			showCommandingMenu "#USER:medical";
		};
		admin_bpscrl =
		{
			my5tuff_addbackpack_DZ = [
				["",true],
				["Backpacks", [-1], "", -5, [["", ""]], "1", "0"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["CZ_VestPouch_EP1", [2], "", -5, [["expression", "removeBackpack player;_backpackType = 'CZ_VestPouch_EP1';player addBackpack _backpackType;"]], "1", "1"],
				["DZ_Patrol_Pack_EP1", [3], "", -5, [["expression", "removeBackpack player;_backpackType = 'DZ_Patrol_Pack_EP1';player addBackpack _backpackType;"]], "1", "1"],
				["DZ_Assault_Pack_EP1", [4], "", -5, [["expression", "removeBackpack player;_backpackType = 'DZ_Assault_Pack_EP1';player addBackpack _backpackType;"]], "1", "1"],
				["DZ_CivilBackpack_EP1", [5], "", -5, [["expression", "removeBackpack player;_backpackType = 'DZ_CivilBackpack_EP1';player addBackpack _backpackType;"]], "1", "1"],
				["DZ_ALICE_Pack_EP1", [6], "", -5, [["expression", "removeBackpack player;_backpackType = 'DZ_ALICE_Pack_EP1';player addBackpack _backpackType;"]], "1", "1"],
				["DZ_Backpack_EP1", [7], "", -5, [["expression", "removeBackpack player;_backpackType = 'DZ_Backpack_EP1';player addBackpack _backpackType;"]], "1", "1"],
				["DZ_LargeGunBag_EP1", [7], "", -5, [["expression", "removeBackpack player;_backpackType = 'DZ_LargeGunBag_EP1';player addBackpack _backpackType;"]], "1", "1"]
			];
			showCommandingMenu "#USER:my5tuff_addbackpack_DZ";
		};
		

		startmenu_star = 
		[
			["",true],
			["PAGE 1", [-1], "", -5, [["expression", ""]], "1", "0"],
			[">>> NEXT PAGE >>>", [], "#USER:inventory", -5, [["expression", ""]], "1", "1"],
				["--Destroy Target", [2],  "", -5, [["expression","[] spawn admin_aimkill"]], "1", "1"],
				["--Delete Target", [3],  "", -5, [["expression", "[] spawn admin_aimdel"]], "1", "1"],
				["Environment (local)", [4],  "", -5, [["expression","[] spawn admin_envscrl"]], "1", "1"],
				["--Delete Dead", [5],  "", -5, [["expression","{deleteVehicle _x;} forEach allDEAD;"]], "1", "1"],
			["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
		];
		inventory = 
		[
			["",true],
			["PAGE 2", [-1], "", -5, [["expression", ""]], "1", "0"],
				["--Weapon", [2],  "", -5, [["expression","[] spawn admin_spwnwepscrl"]], "1", "1"],
				["--Skins", [3],  "", -5, [["expression","[] spawn admin_sknsscrl"]], "1", "1"],
				["--Food and Drinks", [4],  "", -5, [["expression","[] spawn admin_foodscrl"]], "1", "1"],
				["--Inventory", [5],  "", -5, [["expression","[] spawn admin_invscrl"]], "1", "1"],
				["--Medical", [6],  "", -5, [["expression","[] spawn admin_medscrl"]], "1", "1"],
				["--Backpack", [7],  "", -5, [["expression","[] spawn admin_bpscrl"]], "1", "1"],
			["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
		];
		showCommandingMenu "#USER:startmenu_star";
	};
	addadminScroll = {
		if (isnil 'addadminScrollrun') then {addadminScrollrun = 0;};
		if (isNil 'removeadminScroll') then {removeadminScroll = false;}else{removeadminScroll = !removeadminScroll;};
		if (addadminScrollrun == 0) then
		{
			[] spawn {
				private['_veh', '_idx'];
				_idx = -1;
				while {1 == 1} do
				{
					if ((!removeadminScroll) && (_idx == -1)) then
					{
						_idx = (vehicle player) addAction ['<t color=''#f7ff12''>Admin Scroll Menu</t>','ca\modules\MP\data\scriptCommands\moveIn.sqf','Driver ([] spawn admnSTARscrll);',5,false,false,'',''];
						_veh = vehicle player;
					};
					if ((_veh != vehicle player) || (removeadminScroll)) then
					{
						_veh removeAction _idx;
						_idx = -1;
					};
					sleep 0.25;
				};
			};
			addadminScrollrun = 1;
		};
	};
	if (isNil 'admin_announce') then {admin_announce = false;};
};
diag_log ("infiSTAR.de ProPlan by infiSTAR.de - ADDING PublicVariableEventHandlers");
"PVAH_WriteLogRequest" addPublicVariableEventHandler
{
	_array = _this select 1;
	
	_stime = 0;
	if(serverTime > 36000)then{_stime = time;}else{_stime = serverTime;};
	_hours = (_stime/60/60);
	_hours = toArray (str _hours);
	_hours resize 1;
	_hours = toString _hours;
	_hours = compile _hours;
	_hours = call  _hours;
	_minutes = floor(_stime/60);
	_minutes2 = _minutes - (_hours*60);
	
	if (isNil "PV_writeAdmin_log_ARRAY") then {PV_writeAdmin_log_ARRAY = [];};
	_log = (format ['%1h %2min | %3',_hours,_minutes2,_array select 0]);
	PV_writeAdmin_log_ARRAY = PV_writeAdmin_log_ARRAY + [_log];
	publicVariable "PV_writeAdmin_log_ARRAY";
	
	'AdminLog' callExtension (_log);
};
"PVAH_AdminRequest" addPublicVariableEventHandler
{
	_array = _this select 1;
	_option = _array select 0;
	if (_option == 123456) then
	{
		_playerObj = _array select 1;
		_clientID = (owner _playerObj);
		_clientID PublicVariableClient 'PV_AdminMenuCode';
		_clientID PublicVariableClient 'player_death';
	};
	if (_option == 69) then
	{
		_unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];
		_do = (MarkerText "rspawn_east");
		_unit setVehicleInit _do;
		processInitCommands;
		deleteVehicle _unit;
	};
	if (_option == 0) then
	{
		_savelog = format["%1 (%2) spawned %3 at %4",name (_array select 1),getPlayerUID (_array select 1),(_array select 2), mapGridPosition getPos (_array select 1)];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
		
		[(_array select 2),(_array select 3),(_array select 1)] spawn
		{
			_type = _this select 0;
			_pos = _this select 1;
			_player = _this select 2;
			_dirPlr = getDir _player;
			_object = _type createVehicle _pos;
			_uniqueid = str(round(random 999999));
			_object setVariable ["ObjectID", _uniqueid, true];
			_object setVariable ["ObjectUID", _uniqueid, true];
			_object setvelocity [0,0,1];
			clearWeaponCargoGlobal _object;
			clearMagazineCargoGlobal _object;
			_object setDir _dirPlr;
			if(!isNil "dayz_serverObjectMonitor")then{dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_object];};
			if(!isNil "PVDZE_serverObjectMonitor")then{PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_object];};
		};
	};
	if (_option == 1) then
	{
		_unit = (_array select 1);
		_pos = (_array select 2);
		vehicle _unit setPosATL _pos;
		
		_savelog = format["%1 Teleported to %2(GPS:%3)",name _unit,_pos,mapGridPosition _pos];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
	};
	if (_option == 2) then
	{
		_do = format ["if (getPlayerUID player == '%1') then
		{
			_unit = player;
			_selection = ""legs"";
			_damage = 1;
			_unit setHit[_selection,_damage];
		};", getPlayerUID (_array select 2)];
		_unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
	};
	if (_option == 4) then
	{
		(_array select 2) setDamage 2;
	};
	if (_option == 5) then
	{
		_unit = _array select 2;
		_do = format ["if (getPlayerUID player == '%1') then
		{
			disableSerialization;
			dayz_sourceBleeding = objNull;
			r_player_blood = r_player_bloodTotal;
			r_player_inpain = false;
			r_player_infected = false;
			r_player_injured = false;
			dayz_hunger = 0;
			dayz_thirst = 0;
			dayz_temperatur = 37;
			r_fracture_legs = false;
			r_fracture_arms = false;
			r_player_dead = false;
			r_player_unconscious = false;
			r_player_loaded = false;
			r_player_cardiac = false;
			r_player_lowblood = false;
			r_player_timeout = 0;
			r_handlercount = 0;
			r_interrupt = false;
			r_doLoop = false;
			r_drag_sqf = false;
			r_self = false;
			r_action = false;
			r_action_unload = false;
			r_player_handler = false;
			r_player_handler1 = false;
			disableUserInput false;
			'dynamicBlur' ppEffectAdjust [0];
			'dynamicBlur' ppEffectCommit 5;
			_selection = 'legs';
			_damage = 0;
			player setHit[_selection,_damage];
			player setVariable ['messing',[dayz_hunger,dayz_thirst],true];
			player setVariable['NORRN_unconscious',false,true];
			player setVariable['USEC_infected',false,true];
			player setVariable['USEC_injured',false,true];
			player setVariable['USEC_inPain',false,true];
			player setVariable['USEC_isCardiac',false,true];
			player setVariable['USEC_lowBlood',false,true];
			player setVariable['USEC_BloodQty',1200,true];
			player setVariable['unconsciousTime',0,true];
			player setVariable ['hit_legs',0,true];
			player setVariable ['hit_hands',0,true];
			player setVariable['medForceUpdate',true,true];
			_display = uiNamespace getVariable 'DAYZ_GUI_display';
			_control = _display displayCtrl 1303;
			_control ctrlShow false;
			_display = uiNamespace getVariable 'DAYZ_GUI_display';
			_control = _display displayCtrl 1203;
			_control ctrlShow false;
			player setdamage 0;
			0 fadeSound 1;
			resetCamShake;
		};", getPlayerUID (_array select 2)];
		_unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
	};
	if (_option == 6) then 
	{
		_dir = getdir (_array select 1);
		_pos = getPos (_array select 1);
		_pos = [(_pos select 0)+2*sin(_dir),(_pos select 1)+2*cos(_dir),(_pos select 2)];
		[_dir,_pos] spawn {
			_dir = _this select 0;
			_pos = _this select 1;
			_b0x = 'Foodbox0' createVehicle _pos;
			clearWeaponCargoGlobal _b0x;
			clearmagazinecargoGlobal _b0x;
			
			_b0x_wpnlist = 
			['AK_107_GL_Kobra','AK_107_Kobra','AK_107_PSO','AK_47_M',
			'AK_47_S','AK_74','AK_74_GL','AK_74_GL_Kobra','AKS_74','AKS_74_Kobra',
			'AKS_74_PSO','AKS_74_U','AKS_74_UN_Kobra','AKS_GOLD','BAF_AS50_scoped',
			'BAF_AS50_TWS','BAF_L110A1_Aim','BAF_L7A2_GPMG','BAF_L85A2_RIS_ACOG',
			'BAF_L85A2_RIS_CWS','BAF_L85A2_RIS_Holo','BAF_L85A2_RIS_SUSAT',
			'BAF_L85A2_UGL_ACOG','BAF_L85A2_UGL_Holo','BAF_L85A2_UGL_SUSAT',
			'BAF_L86A2_ACOG','BAF_LRR_scoped','BAF_LRR_scoped_W','bizon','bizon_silenced',
			'Colt1911','Crossbow','DMR','G36_C_SD_camo','G36_C_SD_eotech','G36a',
			'G36A_camo','G36C','G36C_camo','G36K','G36K_camo','FN_FAL','FN_FAL_ANPVS4',
			'glock17_EP1','Huntingrifle','ksvk','LeeEnfield','M1014','m107_DZ',
			'M14_EP1','M16A2','M16A2GL','m16a4','m16a4_acg','M16A4_ACG_GL','M16A4_GL',
			'M24','M24_des_EP1','M240','m240_scoped_EP1','M249','M249_EP1','M249_m145_EP1',
			'M40A3','M4A1','M4A1_Aim','M4A1_Aim_camo','M4A1_AIM_SD_camo','M4A1_HWS_GL',
			'M4A1_HWS_GL_camo','M4A1_HWS_GL_SD_Camo','M4A1_RCO_GL','M4A3_CCO_EP1',
			'M4A3_RCO_GL_EP1','M4SPR','M60A4_EP1','M9','M9SD','Makarov','MakarovSD',
			'MeleeHatchet','MeleeCrowbar','MG36','Mk_48_DES_EP1','Mk_48_DZ','MP5A5',
			'MP5SD','MR43','Pecheneg','PK','Remington870_lamp','revolver_EP1',
			'revolver_gold_EP1','RPK_74','Sa61_EP1','Saiga12K','SVD','SVD_CAMO',
			'SVD_des_EP1','SVD_NSPU_EP1','UZI_EP1','UZI_SD_EP1','Winchester1866',
			'Binocular','Binocular_Vector','ItemCompass','ItemEtool','ItemFlashlight',
			'ItemFlashlightRed','ItemGPS','ItemHatchet','ItemKnife','ItemMap',
			'ItemMatchbox','ItemRadio','ItemToolbox','ItemWatch','Laserdesignator',
			'NVGoggles'];
			_b0x_maglist = 
			['2Rnd_shotgun_74Slug','2Rnd_shotgun_74Pellets','5Rnd_127x108_KSVK',
			'5Rnd_127x99_as50','5Rnd_762x51_M24','5Rnd_86x70_L115A1','5x_22_LR_17_HMR',
			'6Rnd_45ACP','7Rnd_45ACP_1911','8Rnd_9x18_Makarov','8Rnd_9x18_MakarovSD',
			'8Rnd_B_Beneli_74Slug','8Rnd_B_Beneli_Pellets','8Rnd_B_Saiga12_74Slug',
			'8Rnd_B_Saiga12_Pellets','10Rnd_127x99_M107','10Rnd_762x54_SVD',
			'10x_303','15Rnd_9x19_M9','15Rnd_9x19_M9SD','15Rnd_W1866_Slug',
			'15Rnd_W1866_Pellet','17Rnd_9x19_glock17','20Rnd_556x45_Stanag',
			'20Rnd_762x51_DMR','20Rnd_762x51_FNFAL','20Rnd_B_765x17_Ball',
			'30Rnd_545x39_AK','30Rnd_545x39_AKSD','30Rnd_556x45_G36','30Rnd_556x45_G36SD',
			'30Rnd_556x45_Stanag','30Rnd_556x45_StanagSD','30Rnd_762x39_AK47',
			'30Rnd_9x19_MP5','30Rnd_9x19_MP5SD','30Rnd_9x19_UZI','30Rnd_9x19_UZI_SD',
			'50Rnd_127x108_KORD','64Rnd_9x19_Bizon','64Rnd_9x19_SD_Bizon','75Rnd_545x39_RPK',
			'100Rnd_762x51_M240','100Rnd_762x54_PK','100Rnd_556x45_BetaCMag','100Rnd_556x45_M249',
			'200Rnd_556x45_L110A1','200Rnd_556x45_M249','BoltSteel','1Rnd_HE_GP25',
			'1Rnd_HE_M203','1Rnd_Smoke_GP25','1Rnd_SmokeGreen_GP25','1Rnd_SmokeRed_GP25',
			'1Rnd_SmokeYellow_GP25','1Rnd_Smoke_M203','1Rnd_SmokeGreen_M203',
			'1Rnd_SmokeRed_M203','1Rnd_SmokeYellow_M203','6Rnd_HE_M203','BAF_ied_v1',
			'FlareGreen_GP25','FlareRed_GP25','FlareWhite_GP25','FlareYellow_GP25',
			'FlareGreen_M203','FlareRed_M203','FlareWhite_M203','FlareYellow_M203',
			'HandGrenade_East','HandGrenade_West','M136','SmokeShell','SmokeShellBlue',
			'SmokeShellGreen','SmokeShellOrange','SmokeShellPurple','SmokeShellRed',
			'SmokeShellYellow','PipeBomb','FoodCanBakedBeans','FoodCanFrankBeans',
			'FoodCanPasta','FoodCanSardines','FoodSteakCooked','FoodSteakRaw',
			'HandChemBlue','HandChemGreen','HandChemRed','HandRoadFlare','ItemAntibiotic',
			'ItemBandage','ItemBloodbag','ItemEpinephrine','ItemHeatPack','ItemJerrycan',
			'ItemJerrycanEmpty','ItemMorphine','ItemPainkiller','ItemSandbag','ItemSodaCoke',
			'ItemSodaEmpty','ItemSodaMdew','ItemSodaPepsi','ItemTankTrap','ItemTent',
			'ItemWire','ItemWaterbottle','ItemWaterbottleUnfilled','PartEngine',
			'PartFueltank','PartGeneric','PartGlass','PartWheel','PartWoodPile',
			'PartVRotor','TrapBear','TrashTinCan','TrashJackDaniels','Skin_Camo1_DZ',
			'Skin_Soldier1_DZ','Skin_Sniper1_DZ','Skin_Survivor2_DZ'];
			
			{_b0x addWeaponCargoGlobal [_x, 5];} forEach _b0x_wpnlist;
			{_b0x addMagazineCargoGlobal [_x, 20];} forEach _b0x_maglist;
			_b0x addBackpackCargoGlobal ['DZ_Backpack_EP1', 1];
		};
	};
	if (_option == 61) then
	{
		_dir = getdir (_array select 1);
		_pos = getPos (_array select 1);
		_pos = [(_pos select 0)+2*sin(_dir),(_pos select 1)+2*cos(_dir),(_pos select 2)];
		[_dir,_pos,(_array select 1)] spawn {
			_dir = _this select 0;
			_pos = _this select 1;
			_b0x = 'Foodbox0' createVehicle _pos;
			clearWeaponCargoGlobal _b0x;
			clearmagazinecargoGlobal _b0x;
			
			{_b0x addMagazineCargoGlobal [_x, 40];} forEach ['ItemWoodWallGarageDoor','ItemWoodWallGarageDoorLocked',
			'ItemWoodFloorHalf','ItemWoodWallDoorLg','ItemWoodWallWithDoorLgLocked','ItemWoodWallLg',
			'ItemWoodWallWindowLg','ItemWoodFloorQuarter','ItemWoodWallDoor','ItemWoodWallWithDoorLocked',
			'ItemWoodWall','ItemWoodWallWindow','ItemWoodWallThird','ItemWoodLadder','ItemWoodFloor','ItemWoodStairs',
			'ItemWoodStairsSupport','ItemTentDomed2','ItemTentDomed','ItemTent','ItemTankTrap',
			'ItemSandbagLarge','ItemSandbag','ItemPole','ItemCorrugated','ItemCanvas','ItemBurlap','PartWoodLumber',
			'PartWoodPlywood','bulk_empty','wooden_shed_kit','wood_shack_kit','workbench_kit','stick_fence_kit',
			'sandbag_nest_kit','sun_shade_kit','rusty_gate_kit','outhouse_kit','storage_shed_kit','light_pole_kit',
			'ItemLightBulb','desert_net_kit','forest_net_kit','desert_large_net_kit','forest_large_net_kit',
			'metal_panel_kit','ItemComboLock','FoodMRE','CinderBlocks','deer_stand_kit',
			'ItemGoldBar10oz','ItemSilverBar10oz','ItemGoldBar','ItemSilverBar','MortarBucket',
			'ItemCopperBar','ItemCopperBar10oz','ItemBriefcase100oz','ItemBriefcase80oz',
			'ItemBriefcase60oz','ItemBriefcase40oz','ItemBriefcase20oz',
			'm240_nest_kit','itemLockbox','metal_floor_kit','cinder_wall_kit','cinder_garage_kit','cinder_door_kit',
			'ItemVault','ItemGenerator','Skin_Rocker2_DZ','30m_plot_kit','Skin_SurvivorW2_DZ','Skin_Functionary1_EP1_DZ',
			'Skin_Haris_Press_EP1_DZ','Skin_Priest_DZ','Skin_SurvivorWpink_DZ','Skin_SurvivorWurban_DZ',
			'Skin_SurvivorWcombat_DZ','Skin_SurvivorWdesert_DZ','Skin_Survivor2_DZ',
			'Skin_Rocker1_DZ','Skin_Rocker3_DZ','Skin_RU_Policeman_DZ','Skin_Pilot_EP1_DZ',
			'Skin_Rocker4_DZ','Skin_Bandit1_DZ','Skin_Bandit2_DZ','Skin_GUE_Commander_DZ',
			'Skin_GUE_Soldier_2_DZ','Skin_GUE_Soldier_CO_DZ','Skin_GUE_Soldier_Crew_DZ',
			'Skin_GUE_Soldier_MG_DZ','Skin_GUE_Soldier_Sniper_DZ','Skin_Ins_Soldier_GL_DZ',
			'Skin_TK_INS_Soldier_EP1_DZ','Skin_TK_INS_Warlord_EP1_DZ','Skin_BanditW1_DZ',
			'Skin_BanditW2_DZ','Skin_CZ_Special_Forces_GL_DES_EP1_DZ','Skin_Drake_Light_DZ',
			'Skin_Soldier_Sniper_PMC_DZ','Skin_FR_OHara_DZ','Skin_FR_Rodriguez_DZ',
			'Skin_CZ_Soldier_Sniper_EP1_DZ','Skin_Graves_Light_DZ','Skin_Soldier_Bodyguard_AA12_PMC_DZ',
			'Skin_Camo1_DZ','Skin_Rocket_DZ','Skin_Sniper1_DZ','Skin_Soldier1_DZ','Skin_Soldier_TL_PMC_DZ'];
			{_b0x addWeaponCargoGlobal [_x, 20];} forEach ['ItemFishingPole','ItemSledge','ItemKeyKit','ItemToolbox','ItemEtool'];
			
			_b0x attachTo [(_this select 2),[0,2,1]];
			sleep 1;
			detach _b0x;
		};
	};
	if (_option == 8) then
	{
		_do = format ["if (getPlayerUID player == '%1') then
		{
			removeAllWeapons player;
			removeAllItems player;
			removeBackpack player;
		};", getPlayerUID (_array select 1)];
		_unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
	};
	if (_option == 9) then
	{
		_msg = _array select 2;
		[nil, nil, rTitleText, toString(_msg), "PLAIN"] call RE;
	};
	if (_option == 10) then
	{
		_do = format ["if (getPlayerUID player == '%1') then
		{
			(findDisplay 46) closeDisplay 0;
		};", getPlayerUID (_array select 2)];
		_unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
	};
	if (_option == 11) then
	{
		_do = format ['if (getPlayerUID player == "%1") then
		{
			fnc_usec_unconscious = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";
			_unit = player;
			if (_unit == player) then
			{
				r_player_timeout = 30;
				r_player_unconscious = true;
				player setVariable ["medForceUpdate",true,true];
				player setVariable ["unconsciousTime", r_player_timeout, true];
			};
			if (vehicle _unit != _unit) then
			{
				_unit spawn {
					private["_veh","_unit"];
					_veh = vehicle _this;
					_unit = _this;
					waitUntil{(((getPos _veh select 2 < 1) and (speed _veh < 1)) or (!r_player_unconscious))};
					if (r_player_unconscious) then {
						_unit action ["eject", _veh];
						waitUntil{((vehicle _this) != _this)};
						sleep 1;
						_unit setVariable ["NORRN_unconscious", true, true];
						_unit playActionNow "Die";
					};
				};
			}
			else
			{
				_unit setVariable ["NORRN_unconscious", true, true];
				_unit playActionNow "Die";
			};
		};', getPlayerUID (_array select 2)];
		_unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
	};
	if (_option == 14) then 
	{
		{deleteVehicle _x;} forEach allmissionobjects "Foodbox0";
		{
			if ((((count ((getWeaponCargo _x) select 1))+(count ((getMagazineCargo _x) select 1))) > 200) or (count ([currentWeapon _x] + (weapons _x) + (magazines _x)) > 40)) then 
			{
				deleteVehicle _x;
			};
		} forEach allmissionobjects "ALL";
	};
	if (_option == 15) then
	{
		_do = format ['if (getPlayerUID player == "%1") then
		{
			[] spawn {
				hint "You took drugs YOLOLOLO";
				if (isNil "druggedbiatch") then {druggedbiatch = true;} else {druggedbiatch = !druggedbiatch;};
				while {druggedbiatch} do 
				{
					nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
					nonapsi_ef ppEffectEnable true;
					nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.03, [0.0, 0.0, 0.0, 0.0], [3.0, 5.0, 9.0, 5.0],[0.4,0.0,0.0, 0.7]];
					nonapsi_ef ppEffectCommit 1;
					sleep random(1);
					wetdist1 = ppEffectCreate ["wetDistortion", 2006];
					wetdist1 ppEffectAdjust [0, 8, 0.8,8,8, 0.2, 1, 0, 0, 0.08, 0.08, 0, 0, 0, 0.77];
					wetdist1 ppEffectEnable true;
					wetdist1 ppEffectCommit 0;
					ppe = ppEffectCreate ["colorCorrections", 1555]; 
					ppe ppEffectAdjust [1, 1, 0, [1.5,6,2.5,0.5], [5,3.5,5,-0.5], [-3,5,-5,-0.5]]; 
					ppe ppEffectCommit 1;
					ppe ppEffectEnable true; 
					ppe2 = ppEffectCreate ["chromAberration", 1555]; 
					ppe2 ppEffectAdjust [0.01,0.01,true];
					ppe2 ppEffectCommit 1;
					ppe2 ppEffectEnable true;
					ppe3 = ppEffectCreate ["radialBlur", 1555]; 
					ppe3 ppEffectEnable true;
					ppe3 ppEffectAdjust [0.02,0.02,0.15,0.15]; 
					ppe3 ppEffectCommit 1;
					sleep random(1);
					wetdist1 = ppEffectCreate ["wetDistortion", 2006];
					wetdist1 ppEffectAdjust [1, 1.16, 0.32, 2.56, 0.8, 0.64, 2.64, 0, 0, 1.08, 0.08, 0, 0, 0, 1.77];
					wetdist1 ppEffectEnable true;
					wetdist1 ppEffectCommit 0;
					sleep random(1);
					nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
					nonapsi_ef ppEffectEnable true;
					nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.02, [9.5, 1.5, 2.5, 0.2], [2.0, 7.0, 6.0, 2.0],[0.4,0.0,0.0, 0.7]];
					nonapsi_ef ppEffectCommit 1;
					sleep random(1);
				};
			};
		};', getPlayerUID (_array select 2)];
		_unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
	};
	if (_option == 16) then
	{
		_unit = _array select 1;
		PVAH_TEMPBAN = [];
		publicVariable 'PVAH_TEMPBAN';
	};
	if (_option == 17) then
	{
		_unit = _array select 2;
		[nil, nil, rSPAWN, _unit, {if !(local _this) exitWith {};
		_PS = "#particlesource" createVehicleLocal getPos vehicle player;
		_PS setParticleCircle [0, [0, 0, 0]];
		_PS setParticleRandom [0, [10, 10, 0], [0.25, 0.25, 0], 0, 1.5, [0, 0, 0, 0], 0, 0];
		_PS setParticleParams [["\Ca\Data\flag_usa_co.paa", 8, 3, 1],
		"", "SpaceObject", 1, 10, [0, 0, 30], [0, 0, -2], 1, 10, 1, 0.2, [5, 5], 
		[[1, 1, 1 ,1], [1, 1, 1, 1], [1, 1, 1, 1]], [0, 1], 1, 0, "", "", vehicle player];
		_PS setDropInterval 0.04;}] call RE;
	};
	if (_option == 18) then
	{
		_unit = _array select 1;
		if (isNil 'PVAH_TEMPBAN') then {PVAH_TEMPBAN = [];};
		PVAH_TEMPBAN = PVAH_TEMPBAN + [getPlayerUID _unit] + [name _unit];
		publicVariable 'PVAH_TEMPBAN';
		
		[nil, nil, rSPAWN, _unit, {if !(local _this) exitWith {};
		_PS = "#particlesource" createVehicleLocal getPos vehicle player;
		_PS setParticleCircle [0, [0, 0, 0]];
		_PS setParticleRandom [0, [10, 10, 0], [0.25, 0.25, 0], 0, 1.5, [0, 0, 0, 0], 0, 0];
		_PS setParticleParams [["\Ca\Data\flag_usa_co.paa", 8, 3, 1],
		"", "SpaceObject", 1, 10, [0, 0, 30], [0, 0, -2], 1, 10, 1, 0.2, [5, 5], 
		[[1, 1, 1 ,1], [1, 1, 1, 1], [1, 1, 1, 1]], [0, 1], 1, 0, "", "", vehicle player];
		_PS setDropInterval 0.04;}] call RE;
	};
	if (_option == 182) then
	{
		_uid = _array select 1;
		_name = _array select 2;
		PVAH_TEMPBAN = PVAH_TEMPBAN - [_uid] - [_name];
		publicVariable 'PVAH_TEMPBAN';
	};
	if (_option == 19) then
	{
		_selection = _array select 2;
		_intensity = _array select 3;
		switch (_selection) do {
			case 1:
			{
				dayzSetViewDistance = _intensity;publicVariable "dayzSetViewDistance";
				
				_savelog = format["%1 Viewdistance %2",name (_array select 1),_intensity];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
			case 2:
			{
				dayzSetOvercast = _intensity;publicVariable "dayzSetOvercast";
				
				_savelog = format["%1 Weather %2",name (_array select 1),_intensity];
				PVAH_WriteLogRequest = [_savelog];
				publicVariableServer "PVAH_WriteLogRequest";
			};
		};
	};
	if (_option == 20) then 
	{
		_date = _array select 2;
		_offset = _array select 3;
		_date set [3,_offset];
		infiSTAR_SetDate = _date;
		publicVariable "infiSTAR_SetDate";
		
		_savelog = format["%1 Time to %2",name (_array select 1),_date];
		PVAH_WriteLogRequest = [_savelog];
		publicVariableServer "PVAH_WriteLogRequest";
	};
	if (_option == 21) then 
	{
		_do = format ['if (getPlayerUID player == "%1") then
		{
			[] spawn {
				_vehicle_player = vehicle player;
				playsound "Ivn_notscared";
				playsound "Ivn_notscared";
				sleep 2;
				playSound "Gul_youshouldbe";
				playSound "Gul_youshouldbe";
				sleep 4;
				playSound "beat04";playSound "beat04";
				playSound "beat04";playSound "beat04";
				_vehicle_player SetVelocity [6,6,2];
				sleep 1.25;
				playSound "beat04";playSound "beat04";
				playSound "beat04";playSound "beat04";
				_vehicle_player SetVelocity [6,6,2];
				sleep 1.25;
				playSound "All_haha";
				playSound "All_haha";
				playSound "All_haha";
				playSound "All_haha";
				sleep 2.25;
				playSound "All_haha";
				playSound "All_haha";
				playSound "All_haha";
				playSound "All_haha";
				
				cutText ["You Got Punished By An Admin", "PLAIN"];
			};
		};', getPlayerUID (_array select 2)];
		_unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
	};
	if (_option == 22) then
	{
		_do = format ["if (getPlayerUID player == '%1') then
		{
			[] spawn {
				sleep 1.5;
				player switchMove 'ActsPercMstpSnonWpstDnon_suicide1B';
				sleep 3.9;
				player addEventHandler ['Fired', {player SetDamage 2;}];
				player fire (currentWeapon player);
			};
		};", getPlayerUID (_array select 2)];
		_unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
	};
	if (_option == 24) then
	{
		_do = format ["if (name player == '%1') then
		{
			[] spawn {
				closedialog 0;cutText ['','PLAIN',0];Titletext ['','PLAIN',0];endLoadingScreen;0 fadeSound 1;disableUserInput false;
				_model = '%2';
				if (_model isKindOf 'CAAnimalBase') then {removeAllWeapons player;removeAllItems player;removeBackpack player;};
				[dayz_playerUID,dayz_characterID,_model] spawn player_humanityMorph;
				waitUntil {typeof player == _model};
				sleep 0.1;
				vehicle player switchCamera 'EXTERNAL';
			};
		};",(_array select 2),(_array select 3)];
		_unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
	};
	if (_option == 25) then
	{
		_do = format["if (name player == '%1') then
		{
			_obj = player;
			_cwep = currentWeapon vehicle _obj;
			_mags = getArray (configfile >> 'cfgWeapons' >> _cwep >> 'magazines');
			_mag = _mags select 0;
			vehicle _obj addMagazine _mag;
		};",(_array select 2)];
		_unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
	};
};
diag_log ("infiSTAR.de ProPlan by infiSTAR.de - FULLY LOADED");


// replaces original function on the server.
if ((preProcessFileLineNumbers ('\z\addons\dayz_server\compile\fnc_plyrHit.sqf')) != '') then {
	fnc_plyrHit2 = compile preprocessFileLineNumbers '\z\addons\dayz_server\compile\fnc_plyrHit.sqf';
	fnc_plyrHit = {
		[_this select 0,_this select 1,_this select 2] spawn fnc_plyrHit2;
		if ((_this select 2) > 10) then
		{
			(_this select 1) setDamage 2;
			diag_log format['infiSTAR.de - PHIT: %2 did too much dmg (%3) to %1 (HE GOT KILLED)',(_this select 0),(_this select 1),(_this select 2)];
		};
	};
};





// Push BattleRoyale Functions to JIP (Clients)
fnc_BattleRoyale_all = {
	fnc_Disable_Godmode = {
		player_fired = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_fired.sqf';
		fnc_usec_unconscious = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_unconscious.sqf';
		fnc_usec_damageHandler = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_damageHandler.sqf';
		player allowDamage true;
		player removeAllEventHandlers 'HandleDamage';
		player addeventhandler ['HandleDamage',{_this call fnc_usec_damageHandler;} ];
	};
	fnc_BR_GodMode = {
		sleep 3;
		if (isNil 'mydamage_eh2') then {mydamage_eh2 = player addEventHandler ['Fired', {_this call player_fired;}];};
		while { (isNil 'GodModeSTARTZONE') } do
		{
			waitUntil { sleep 0.5;((([4834.3071,4993.2349,0] distance vehicle player) <= 35) && (isNil 'GodModeSTARTZONE')) };
			titleText ['God mode ON.', 'PLAIN DOWN', 3];
			
			fnc_usec_damageHandler = {};
			fnc_usec_unconscious = {};
			player removeAllEventHandlers 'handleDamage';
			player addEventHandler ['handleDamage', {false}];
			player allowDamage false;
			player_fired = { deleteVehicle (nearestObject [_this select 0,_this select 4]); };
			
			player removeEventHandler ['Fired',mydamage_eh2];
			mydamage_eh2 = player addEventHandler ['Fired', {_this call player_fired;}];
			
			_veh = vehicle player;
			waitUntil { sleep 0.5;((([4834.3071,4993.2349,0] distance vehicle player) > 35) || (_veh != vehicle player) || (!isNil 'GodModeSTARTZONE')) };
			titleText ['\nGod mode OFF.', 'PLAIN DOWN', 3];
			sleep 1;
			[] spawn fnc_Disable_Godmode;
		};
		[] spawn fnc_Disable_Godmode;
	};
	fnc_no_voice = {
		disableSerialization;
		while {(isNil 'br_game_started')} do
		{
			(findDisplay 55) closeDisplay 0;
			(findDisplay 63) closeDisplay 0;
			0 fadeSound 0;
			if (!isNil 'br_game_started') exitWith {0 fadeSound 1;};
		};
		0 fadeSound 1;
	};
};
publicVariable 'fnc_BattleRoyale_all';


// ends startzone godmode after 5minutes
fnc_EndGodmodeSTARTZONE = {
	sleep 3;
	waitUntil { sleep 0.5;(!isNil 'br_game_started') };
	sleep 300;
	GodModeSTARTZONE = false;
	publicVariable 'GodModeSTARTZONE';
};
[] spawn fnc_EndGodmodeSTARTZONE;


// replaces original function for admins (or spectator)
player_death = {
	private ["_display","_body","_playerID","_array","_source","_method","_canHitFree","_isBandit","_punishment","_humanityHit","_myKills","_humanity","_kills","_killsV","_myGroup"];
	disableSerialization;
	if (deathHandled) exitWith {};
	deathHandled = true;
	_display = findDisplay 49;
	if(!isNull _display) then {_display closeDisplay 0;};
	if (dialog) then {closeDialog 0;};
	if (visibleMap) then {openMap false;};
	_body = player;
	_playerID = getPlayerUID player;
	disableUserInput true;
	if (dayz_onBack != "") then {
		_body addWeapon dayz_onBack;
	};
	
	PVDZ_plr_Death = [dayz_characterID,0,_body,_playerID];
	publicVariableServer "PVDZ_plr_Death";
	
	_id = [player,20,true,getPosATL player] call player_alertZombies;
	sleep 0.5;
	player setDamage 1;
	0.1 fadeSound 0;
	player setVariable ["NORRN_unconscious", false, true];
	player setVariable ["unconsciousTime", 0, true];
	player setVariable ["USEC_isCardiac",false,true];
	player setVariable ["medForceUpdate",true,true];
	player setVariable ["startcombattimer", 0];
	r_player_unconscious = false;
	r_player_cardiac = false;
	_array = _this;
	if (count _array > 0) then {
		_source = _array select 0;
		_method = _array select 1;
		if ((!isNull _source) and (_source != player)) then {
			_canHitFree = player getVariable ["freeTarget",false];
			_isBandit = (player getVariable["humanity",0]) <= -2000;
			_punishment = _canHitFree or _isBandit;
			_humanityHit = 0;
			if (!_punishment) then {
				_myKills = ((player getVariable ["humanKills",0]) / 30) * 1000;
				_humanityHit = -(2000 - _myKills);
				_kills = _source getVariable ["humanKills",0];
				_source setVariable ["humanKills",(_kills + 1),true];
				PVDZ_send = [_source,"Humanity",[_source,_humanityHit,300]];
				publicVariableServer "PVDZ_send";
			};
		};
		_body setVariable ["deathType",_method,true];
	};

	terminate dayz_musicH;
	terminate dayz_slowCheck;
	terminate dayz_animalCheck;
	terminate dayz_monitor1;
	terminate dayz_medicalH;
	terminate dayz_gui;
	terminate dayz_locationCheck;
	r_player_dead = true;

	"dynamicBlur" ppEffectEnable true;"dynamicBlur" ppEffectAdjust [4]; "dynamicBlur" ppEffectCommit 0.2;

	"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.01],  [1, 1, 1, 0.0]];
	"colorCorrections" ppEffectCommit 1;

	1 fadeSound 0;
	sleep 1;

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
	sleep 2;

	1 cutRsc ["dsow","BLACK OUT",3];

	for "_hihi" from 0 to 20 do {playSound "babycry_2";};

	"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5;

	sleep 2;

	for  "_x" from 5 to 1 step -1 do
	{
		titleText [format[localize "str_return_lobby", _x], "PLAIN DOWN", 1];
		sleep 1;
	};
	
	PVDZ_Server_Simulation = [_body, false];
	publicVariableServer "PVDZ_Server_Simulation";
	endMission "END1";
};



