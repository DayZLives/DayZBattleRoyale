private ["_chutetype","_boxtype","_helistart","_crashwreck","_randomizedLoot","_guaranteedLoot","_chute","_box","_num","_lootRadius","_lootPos","_pos","_bam","_i","_smoke","_lootholder","_selecteditem","_lootClass","_loot","_randChance","_lootspawned","_lootType"];

_chutetype = _this select 0;
_boxtype = _this select 1;
_helistart	= _this select 2;
_crashwreck	= _this select 3;
_randomizedLoot = _this select 4;
_guaranteedLoot = _this select 5;

_lootRadius = 1;
_lootClass = 1;
_lootType = 1;

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

//Start loot generation

spawnClassChance_list = [
    [0, -1, -1, -1, -1, -1],	// civil
    [1, 43, 55, 34, 26, -1],	// military
    [2, -1, -1, -1, -1, -1],	// industrial
    [3, -1, -1, -1, -1, -1]		// research
];

#include "LSlootLists.sqf"

sleep 1;
_pos = [getPos _bam select 0, getPos _bam select 1, 0];
_num = (round(random _randomizedLoot)) + _guaranteedLoot;

_smoke = createVehicle ["SmokeShellred",_pos,[],0,"CAN_COLLIDE"];

//Creating the Lootpiles outside of the _crashModel
for "_x" from 1 to _num do {
    for "_lootType" from 1 to 5 do {        
        //get chance for loot every time, so all combos in spawnClassChance_list are viable
        _randChance = floor(random(100));
        if (((spawnClassChance_list select _lootClass) select _lootType) > _randChance) then {
            _lootspawned = true;
            //special for weapons
            if(_lootType == 1) exitWith {
                _lootPos = [_pos, ((random 2) + (sizeOf(_boxtype) * _lootRadius)), random 360] call BIS_fnc_relPos;
                _lootholder = createVehicle ["GroundWeaponHolder", _lootPos, [], 0, "CAN_COLLIDE"];
                _selecteditem = (floor(random(count((lootWeapon_list select _lootClass) select 1))));
                _loot = (((lootWeapon_list select _lootClass) select 1) select _selecteditem);
                _lootholder addWeaponCargoGlobal [_loot, 1];
                //_lootholder setPosATL _lootPos;
            };
            //special for magazines: spawn 1-6
            if(_lootType == 2) exitWith {
                _lootPos = [_pos, ((random 2) + (sizeOf(_boxtype) * _lootRadius)), random 360] call BIS_fnc_relPos;
                _lootholder = createVehicle ["GroundWeaponHolder", _lootPos, [], 0, "CAN_COLLIDE"];
                _randChance = 1 + floor(random(5));
                for "_rm" from 0 to _randChance do {
                    _selecteditem = (floor(random(count((lootMagazine_list select _lootClass) select 1))));
                    _loot = (((lootMagazine_list select _lootClass) select 1) select _selecteditem);
                    _lootholder addMagazineCargoGlobal [_loot, 1];
                };
                //_lootholder setPosATL _lootPos;
            };
            //special for item/cloth/vests
            if(_lootType == 3) exitWith {
                _lootPos = [_pos, ((random 2) + (sizeOf(_boxtype) * _lootRadius)), random 360] call BIS_fnc_relPos;
                _lootholder = createVehicle ["GroundWeaponHolder", _lootPos, [], 0, "CAN_COLLIDE"];
                _selecteditem = (floor(random(count((lootItem_list select _lootClass) select 1))));
                _loot = (((lootItem_list select _lootClass) select 1) select _selecteditem);
                _lootholder addItemCargoGlobal [_loot, 1];
                //_lootholder setPosATL _lootPos;
            };
            //special for backpacks
            if(_lootType == 4) exitWith {
                _lootPos = [_pos, ((random 2) + (sizeOf(_boxtype) * _lootRadius)), random 360] call BIS_fnc_relPos;
                _lootholder = createVehicle ["GroundWeaponHolder", _lootPos, [], 0, "CAN_COLLIDE"];
                _selecteditem = (floor(random(count((lootBackpack_list select _lootClass) select 1))));
                _loot = (((lootBackpack_list select _lootClass) select 1) select _selecteditem);
                _lootholder addBackpackCargoGlobal [_loot, 1];
                //_lootholder setPosATL _lootPos;
            };
            diag_log(format["CAREPACKAGE: Loot spawn at '%1' with loot %2", _lootPos, _selecteditem]);
        }; 
    };    
};
