/* 
	Made for A3 Battle Royale by [VB]AWOL
*/
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

		_weaponLimit = _limits select 0;
		_magazineLimit = _limits select 1;
		_itemLimit = _limits select 2;
		_backpackLimit = _limits select 3;
		_objectLimit = _limits select 4;
		
		_types = ["weapon","magazine","item","backpack","object"];

		_spawnedWeaponLimit = 0;
		_spawnedMagazineLimit = 0;
		_spawnedItemLimit = 0;
		_spawnedBackpackLimit = 0;
		_spawnedObjectLimit = 0;

		_numLoot = 1;

		{

			if (_spawnedWeaponLimit >= _weaponLimit) then {
				_types = _types - ["weapon"];
			};
			if (_spawnedMagazineLimit >= _magazineLimit) then {
				_types = _types - ["magazine"];
			};
			if (_spawnedItemLimit >= _itemLimit) then {
				_types = _types - ["item"];
			};
			if (_spawnedBackpackLimit >= _backpackLimit) then {
				_types = _types - ["backpack"];
			};
			if (_spawnedObjectLimit >= _objectLimit) then {
				_types = _types - ["object"];
			};
			
			_typesCount = count _types;

			// randomly spawn one of these categorys
			_randomType = _types select floor(random(_typesCount));

			// get loot array for type
			diag_log format["DEBUG LOOT: type: %1", _randomType];

			// get master list of loot for randomType
			_config = configFile >> "CfgBuildingLootList" >> _randomType;
			
			// get loot array based on building type 
			_loots = getArray (_config >> "items");
			_lootsCount = count _loots;

			// choose random item to spawn from table
			_loot = _loots select floor(random(_lootsCount));

			// get world position from model offset
			_lootPosition = _obj modelToWorld _x;

			if (_randomType == "object") then {

				_item = createVehicle [_loot, _lootPosition, [], 0, "CAN_COLLIDE"];

				// set position
				_item setPos _lootPosition;

				_spawnedObjectLimit = _spawnedObjectLimit + 1;

			} else {

				// create weapon holder
				_item = createVehicle ["groundWeaponHolder", _lootPosition, [], 0, "CAN_COLLIDE"];

				// set position
				_item setPos _lootPosition;

				// add item to WH
				switch (_randomType) do 
				{
					case "weapon": {
						_item addWeaponCargoGlobal [_loot,_numLoot];
						_spawnedWeaponLimit = _spawnedWeaponLimit + _numLoot;
					};
					case "magazine": {

						_numLoot = ((random 3) + 1);
						_item addMagazineCargoGlobal [_loot,_numLoot];
						_spawnedMagazineLimit = _spawnedMagazineLimit + _numLoot;
			
					};
					case "item": {
						
						_numLoot = ((random 3) + 1);
						_item addItemCargoGlobal [_loot,_numLoot];
						_spawnedItemLimit = _spawnedItemLimit + _numLoot;
			
					};
					case "backpack": {
						_item addBackpackCargoGlobal [_loot,_numLoot];
						_spawnedBackpackLimit = _spawnedBackpackLimit + _numLoot;
					};
				};
			};		
		} forEach _positions;
	};
} forEach _buildingList;
