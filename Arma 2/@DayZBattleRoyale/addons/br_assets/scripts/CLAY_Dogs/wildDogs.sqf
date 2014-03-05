
if (isServer) then
	{
	_wdm = [getMarkerPos "center",random 3300,random 360,false] call SHK_pos;
	_dist = 150;

	_count = 5;

	if (isNil "CLAY_fnc_findNearEnemy") then
	{
		CLAY_fnc_findNearEnemy = compile preprocessFile "\z\addons\br_assets\scripts\CLAY_Dogs\fn_findNearEnemy.sqf";
	};
	
	publicVariable "CLAY_fnc_findNearEnemy";


	_search = 
	{
		_dog = _this select 0;
		_dist = _this select 1;

		while {alive _dog} do
		{
			_nearUnits = nearestObjects [_dog, ["Man"], _dist];
			if (count _nearUnits > 0) then
			{
				_nearEnemys = [];
				{
					if ((alive _x) && !(_x isKindOf "CLAY_Dog")) then
					{
						_nearEnemys set [count _nearEnemys, _x];
					};
				} forEach _nearUnits;

				if (count _nearEnemys > 0) then
				{
					_target = _nearEnemys select 0;
					sleep 1;
					_attacking = [_dog, _target] execVM "\z\addons\br_assets\scripts\CLAY_Dogs\scripts\attack.sqf";
					waitUntil {scriptDone _attacking};
				};
			};
			sleep 1;
		};
	};

	_c = (_count - 1) + (floor (random 3));
	if (_c < 1) then {_c = 1};

	for "_i" from 1 to _c do
	{
		private "_type";
		if (random 10 > 5) then
		{
			_type = "CLAY_Dog";
		}
		else
		{
			_type = "CLAY_Dog2";
		};

		createCenter CIVILIAN;
		_grp = createGroup CIVILIAN;
		_dog = _grp createUnit [_type, [(getPos _wdm select 0) + (10 - (random 20)), (getPos _wdm select 1) + (10 - (random 20)), 0], [], 0, "NONE"];
		_dog setDir (random 360);
		_dog addRating -2500;

		nul = [_dog, _dist] spawn _search;
	};
};
