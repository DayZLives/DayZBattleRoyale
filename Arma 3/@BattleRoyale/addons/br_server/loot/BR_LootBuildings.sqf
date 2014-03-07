/* 
	Made for A3 Battle Royale by [VB]AWOL
*/
private ["_classname","_types","_limitKey","_forEachIndex","_limit","_loot","_numLoot","_typesCount","_randomType","_config","_loots","_lootsCount","_lootPosition","_item","_numLootLoop","_positions","_limits","_typeConfig","_obj","_type","_ok","_buildingList"];

_buildingList = (getMarkerPos "center") nearObjects ["House",5000];

// Loop on all buildings and spawn loot
{

	_obj = _x;
	
	_type = typeOf _obj;
	
	_config = configFile >> "CfgBuildingLootPos" >> _type;

	_ok = isClass (_config);
	
	if(_ok) then {
	
		_positions = [] + getArray (_config >> "lootPos");

		_limits = getArray (_config >> "limits");

		// parse loot list for classes 
		_types = [];
		_typeConfig = configFile >> "CfgBuildingLootList";
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
				_lootPosition = _obj modelToWorld _x;

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
			
		} forEach _positions;
	};
} forEach _buildingList;