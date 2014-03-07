private ["_chutetype","_boxtype","_helistart","_crashwreck","_randomizedLoot","_guaranteedLoot","_chute","_box","_num","_lootRadius","_lootPos","_pos","_bam","_i","_smoke","_loot","_types","_spawnedWeaponLimit","_spawnedMagazineLimit","_spawnedItemLimit","_spawnedBackpackLimit","_spawnedObjectLimit","_weaponLimit","_magazineLimit","_itemLimit","_backpackLimit","_objectLimit","_numLoot","_typesCount","_randomType","_config","_loots","_lootsCount","_item"];

_chutetype = _this select 0;
_boxtype = _this select 1;
_helistart	= _this select 2;
_crashwreck	= _this select 3;
_randomizedLoot = _this select 4;
_guaranteedLoot = _this select 5;

_lootRadius = 1;

_weaponLimit = 1;
_magazineLimit = 1;
_itemLimit = 1;
_backpackLimit = 1;
_objectLimit = 1;

_types = ["weapon","magazine","item","backpack","object"];

_spawnedWeaponLimit = 0;
_spawnedMagazineLimit = 0;
_spawnedItemLimit = 0;
_spawnedBackpackLimit = 0;
_spawnedObjectLimit = 0;

_chute = createVehicle [_chutetype,_helistart,[],0,"CAN_COLLIDE"];
_chute setPos [(getPos _crashwreck select 0), (getPos _crashwreck select 1), (getPos _crashwreck select 2)-10];

_box = createVehicle [_boxtype,_helistart,[],0,"CAN_COLLIDE"];
_box setPos [(getPos _crashwreck select 0), (getPos _crashwreck select 1), (getPos _crashwreck select 2)-10];
_box attachto [_chute, [0, 0, 0]];

_i = 0;
while {_i < 45} do {
    scopeName "loop1";
    if (((getPos _box) select 2) < 1) then {breakOut "loop1"};
    
    sleep 0.1;
    _i=_i+0.1;
};

switch (true) do {
    case not (alive _box): {detach _box;_box setpos [(getPos _box select 0), (getPos _box select 1), 0];};
    case alive _box: {detach _box;_box setpos [(getPos _box select 0), (getPos _box select 1), 0];_bam = _boxtype createVehicle [(getPos _box select 0),(getPos _box select 1),(getPos _box select 2)+0];deletevehicle _box;};
};

deletevehicle _chute;
sleep 1;


sleep 1;
_pos = [getPos _bam select 0, getPos _bam select 1, 0];
_num = (round(random _randomizedLoot)) + _guaranteedLoot;

_smoke = createVehicle ["SmokeShellred",_pos,[],0,"CAN_COLLIDE"];

//Creating the Lootpiles outside of the _crashModel
for "_x" from 1 to _num do {
    
    
    // get world position from model offset
    
		_limits = getArray (_config >> "limits");

		// parse loot list for classes 
		_types = [];
		_typeConfig = configFile >> "CfgCarePackageLootList";
		for "_i" from 0 to ((count _typeConfig) - 1) do {
			_classname = configName (_typeConfig select _i);
			_types set [(count _types), _classname];
			missionNamespace setVariable [format["%1_limit", _classname],(_limits select _i)];
			missionNamespace setVariable [format["%1_counter", _classname],0];
		};

		{
			
			{
				_limit = missionNamespace getVariable [format["%1_limit", _x],0];
				_counter = missionNamespace getVariable [format["%1_counter", _x],0];
				if (_counter >= _limit) then {
					_types = _types - [_x];
				};
			} forEach _types;

			_typesCount = count _types;

			if (_typesCount > 0) then {
				// randomly spawn one of these categorys
				_randomType = _types select floor(random(_typesCount));

				// get loot array for type
				diag_log format["DEBUG LOOT: type: %1", _randomType];

				// get master list of loot for randomType
				_config = configFile >> "CfgBuildingLootList" >> _randomType;
				
				// get loot array based on building type 
				_loots = getArray (_config >> "items");
				_lootsCount = count _loots;

				// get world position from model offset
				_lootPosition = [_pos, ((random 2) + (sizeOf(_boxtype) * _lootRadius)), random 360] call BIS_fnc_relPos; 

				// create weapon holder
				_item = createVehicle ["groundWeaponHolder", _lootPosition, [], 0, "CAN_COLLIDE"];

				// set position
				_item setPos _lootPosition;

				_numLoot = 1;
				_numLootLoop = 1;

				if (_randomType == "Magazine") then {
					_numLootLoop = (round(random 2)) + 1;
					_numLoot = (round(random 2)) + 1;
				};
				if (_randomType == "Item") then {
					_numLootLoop = (round(random 2)) + 1; 
				};

				for "_z" from 1 to _numLootLoop do {
					// choose random item to spawn from table
					_loot = _loots select floor(random(_lootsCount));
					switch (_randomType) do 
					{
						case "Weapon": {
							_item addWeaponCargoGlobal [_loot,_numLoot];
							// add a few random mags
							_mags = configFile >> "CfgWeapons" >> _loot >> "magazines";
							_magsCount = count _mags;
							if (_magsCount > 0) then {
								_mag = _mags select floor(random(_magsCount));
								_item addMagazineCargoGlobal [_mag,(round(random 2)) + 1)];
							};
						};
						case "Magazine": {
							_item addMagazineCargoGlobal [_loot,_numLoot];
						};
						case "Item": {
							_item addItemCargoGlobal [_loot,_numLoot];
						};
						case "Backpack": {
							_item addBackpackCargoGlobal [_loot,_numLoot];
						};
						case "Uniform": {
							_item addItemCargoGlobal [_loot,_numLoot];
						};
					};

					diag_log format["DEBUG LOOT: added %1 x %2 from %3", _numLoot, _loot, _type];
					
					_limit = missionNamespace getVariable [format["%1_counter", _randomType],0];
					missionNamespace setVariable [format["%1_counter", _randomType],(_limit + _numLoot)];
				};	
			} else {
				diag_log format["DEBUG LOOT: limit reached or table empty: %1", _type];
			};
};
            