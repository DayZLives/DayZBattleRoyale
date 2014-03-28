// Map Clutter Script by lazyink for Battle Royale
// Inspired by Roadside IED script by mantls http://forums.bistudio.com/showthread.php?154744-Roadside-IED-Script
//

private ["_list","_junkarray","_junktype","_road","_pos","_junkpos","_junk","_center","_counter","_amount","_dist","_junkamount","_wreakArray","_wreakType","_wreakPos","_wreak","_skellyType","_skellyPos","_skelly","_barrelPos","_barrel","_barrelAmount","_lootType","_lootPos","_lootItem","_skellyAmount","_lootAmount","_skellyArray","_lootArray","_radius","_bradius"];

_center = getMarkerPos "center";    
_counter = 0;
_amount = (floor (random 100)) + 50;
_dist = 4500;
_list = _center nearRoads _dist;

_wreakArray = ["Land_GarbagePallet_F","Land_GarbageWashingMachine_F","Land_JunkPile_F","Land_GarbageBags_F","Land_Wreck_Car2_F","Land_Wreck_Car3_F","Land_Wreck_CarDismantled_F","Land_Wreck_Offroad_F","Land_ScrapHeap_2_F","Land_Wreck_Skodovka_F","Land_Wreck_Truck_F","Land_UWreck_MV22_F","Land_Wreck_UAZ_F","Land_Wreck_Van_F","Land_ScrapHeap_1_F","Land_Wreck_Offroad2_F","Land_Wreck_Truck_dropside_F","Land_Wreck_Ural_F"]; // Objects used as Wreak

_junkArray = ["Land_BarrelEmpty_F","Land_BarrelSand_F","Land_BarrelTrash_F","Land_BarrelWater_F","Land_Bucket_F","Land_Bucket_clean_F","Land_Bucket_painted_F","Land_BucketNavy_F","Land_CanisterFuel_F","Land_CanisterOil_F","Land_MetalBarrel_empty_F","Land_GarbageBarrel_01_F","Land_BarrelEmpty_grey_F","Land_CanisterPlastic_F","Land_Tyre_F","Land_Ground_sheet_folded_F","Land_Ground_sheet_folded_khaki_F","Land_Portable_generator_F","Land_DuctTape_F","RoadCone_F","Land_BottlePlastic_V1_F","Land_Can_Dented_F","Land_Can_Rusty_F","Land_Can_V1_F","Land_Can_V2_F","Land_Can_V3_F","Land_TacticalBacon_F","Land_ButaneCanister_F","Land_ButaneTorch_F","Land_CanOpener_F","Land_FireExtinguisher_F","Land_GasCanister_F","Land_GasCooker_F","Land_Matches_F","Land_MetalWire_F","Land_Shovel_F","Land_BakedBeans_F","Land_BottlePlastic_V2_F","Land_Canteen_F","Land_CerealsBox_F","Land_PowderedMilk_F","Land_RiceBox_F","Land_Leaflet_01_F","Land_Leaflet_02_F","Land_Leaflet_03_F","Land_Leaflet_04_F","Land_Map_altis_F","Land_Map_blank_F","Land_Map_stratis_F","Land_Poster_01_F","Land_Poster_02_F","Land_Poster_03_F","Land_Poster_04_F","Land_Poster_05_F","Land_Poster_06_F"]; // Objects used as Junk

_skellyArray = ["Land_HumanSkull_F","Land_HumanSkeleton_F"];

_lootArray = ["V_Press_F","FirstAidKit","ToolKit","Medikit","U_NikosAgedBody","U_C_Journalist","U_I_G_Story_Protagonist_F","U_I_G_resistanceLeader_F","U_C_Scientist","H_Cap_press","U_OrestesBody"]; // Loot

while {_counter < _amount} do {
    
    _junkAmount = (floor (random 6)) + 4;
    _skellyAmount = (floor (random 2)) + 2;
    _barrelAmount = (floor (random 2)) + 1;
    _lootAmount = (floor (random 3)) + 2;
	
    _radius = 2;
    _lradius = 3;
    _bradius = 4;
    
    
    _wreakType = _wreakArray select (floor random (count _wreakArray));
    _road = _list select (round random (count _list));
    _pos = getPos _road;
    _wreakPos = [_pos,random 50,random 360,false] call SHK_pos;
    _wreak = createVehicle [_wreakType, _wreakPos, [], 0, "NONE"];
    _wreak setDir (random 360);
    _wreak setPos _wreakPos;
	_wreak setVectorUp surfaceNormal position _wreak;
	
	_trashType = ["Land_Garbage_line_F","Land_Garbage_square3_F","Land_Garbage_square5_F"] call BIS_fnc_selectRandom;
    _trash = createVehicle [_trashType, _wreakPos, [], 0, "CAN_COLLIDE"];
    _trash setdir (random 360);
    _trash setPos _wreakPos;

    diag_log format["CLUTTER DEBUG WREAK: type: %1 location: %2", _wreakType, _wreakPos];
    
    for "_x" from 0 to _junkAmount do {
	
        _junkType = _junkArray select (floor random (count _junkArray));
        _junkPos = [_wreakPos,_radius,random 360,false] call SHK_pos;
        _junk = createVehicle [_junkType, _junkPos, [], 0, "NONE"];
        _junk setdir (random 360);
        _junk setPos _junkPos;
		_junk setVectorUp surfaceNormal position _junk;
        
    };
    
    for "_x" from 0 to _skellyAmount do {
        
        _skellyType = _skellyArray select (floor random (count _skellyArray));
        _skellyPos = [_wreakPos,_radius,random 360,false] call SHK_pos;
        _skelly = createVehicle [_skellyType, _skellyPos, [], 0, "NONE"];
        _skelly setdir (random 360);
        _skelly setPos _skellyPos;
		_skelly setVectorUp surfaceNormal position _skelly;
        
    };
    
    for "_x" from 0 to _barrelAmount do {
       
		_barrelPos = [_wreakPos,_bradius,random 360,false] call SHK_pos;
        _barrelType = ["Land_MetalBarrel_empty_F","MetalBarrel_burning_F"] call BIS_fnc_selectRandom;
        _barrel = createVehicle [_barrelType, _barrelPos, [], 0, "NONE"];
        _barrel setdir (random 360);
        _barrel setPos _barrelPos;
        
    };
    
    for "_x" from 0 to _lootAmount do {
                
        _lootType = _lootArray select (floor random (count _lootArray));
        _lootPos = [_wreakPos,_lradius,random 360,false] call SHK_pos;
        _lootItem = createVehicle ["groundWeaponHolder", _wreakPos, [], 0, "CAN_COLLIDE"];
        _lootItem addItemCargoGlobal [_lootType,1];
        _lootItem setdir (random 360);
        _lootItem setPos _lootPos;
        _lootItem setVectorUp surfaceNormal position _lootItem;
    };
    
    _counter = _counter + 1;
};
