// Map Clutter Script by lazyink for Battle Royale
// Inspired by Roadside IED script by mantls http://forums.bistudio.com/showthread.php?154744-Roadside-IED-Script
//

private ["_list","_junkarray","_junktype","_road","_pos","_junkpos","_junk","_center","_counter","_amount","_dist","_junkamount","_wreakArray","_wreakType","_wreakPos","_wreak","_skellyType","_skellyPos","_skelly","_barrelPos","_barrel","_barrelAmount","_lootType","_lootPos","_lootItem","_skellyAmount","_lootAmount","_skellyArray","_lootArray","_radius","_bradius"];

_center = getMarkerPos "center";    
_counter = 0;
_amount = (floor (random 100)) + 50;
_dist = 4500;
_list = _center nearRoads _dist;

_wreakArray = ["Land_GarbagePallet_F","Land_CanisterFuel_F","Land_GarbageWashingMachine_F","Land_JunkPile_F","Land_GarbageBags_F","Land_Wreck_Car2_F","Land_Wreck_Car3_F","Land_Wreck_CarDismantled_F","Land_Wreck_Offroad_F","Land_ScrapHeap_2_F","Land_Wreck_Skodovka_F","Land_Wreck_Truck_F","Land_UWreck_MV22_F","Land_Wreck_UAZ_F","Land_Wreck_Van_F","Land_ScrapHeap_1_F","Land_Wreck_Offroad2_F","Land_Wreck_Truck_dropside_F","Land_Wreck_Ural_F"]; // Objects used as Wreak

_junkArray = ["Land_MetalBarrel_empty_F","Land_GarbageBarrel_01_F","Land_BarrelEmpty_grey_F","Land_CanisterPlastic_F","Land_Tyre_F","Land_Garbage_line_F","Land_Garbage_square3_F","Land_Garbage_square5_F","Land_Ground_sheet_folded_F","Land_Ground_sheet_folded_khaki_F","Land_Laptop_unfolded_F","Land_Portable_generator_F","Land_DuctTape_F","RoadCone_F"]; // Objects used as Junk

_skellyArray = ["Land_HumanSkull_F","Land_HumanSkeleton_F"];

_lootArray = ["V_Press_F","MineDetector","V_Press_F","V_Press_F","V_Press_F","FirstAidKit","ToolKit","Medikit","U_NikosAgedBody","U_C_Journalist","U_I_G_Story_Protagonist_F","U_I_G_resistanceLeader_F","U_C_Scientist","H_Cap_press","U_OrestesBody","I_Fieldpack_oli_LAT","I_Fieldpack_oli_Repair","I_Fieldpack_oli_Medic","I_Fieldpack_oli_Ammo"]; // Loot


while {_counter < _amount} do {
    
    _junkAmount = (floor (random 3)) + 2;
    _skellyAmount = (floor (random 2)) + 2;
    _barrelAmount = (floor (random 2)) + 1;
    _lootAmount = (floor (random 3)) + 1;
    
    _radius = 2 + (random 1);
    _bradius = 2 + (random 3);	
    
    
    _wreakType = _wreakArray select (floor random (count _wreakArray));
    _road = _list select (round random (count _list));
    _pos = getPos _road;
    _wreakPos = [_pos,random 50,random 360,false] call SHK_pos;
    _wreak = createVehicle [_wreakType, _wreakPos, [], 0, "NONE"];
    _wreak setDir (random 360);
    _wreak setPos _wreakPos;
    
    diag_log format["CLUTTER DEBUG WREAK: type: %1 location: %2", _wreakType, _wreakPos];
    
    for "_x" from 0 to _junkAmount do {
        
        _junkType = _junkArray select (floor random (count _junkArray));
        _junkPos = [_wreakPos,_radius,random 360,false] call SHK_pos;
        _junk = createVehicle [_junkType, _junkPos, [], 0, "NONE"];
        _junk setdir (random 360);
        _junk setPos _junkPos;
        
    };
    
    for "_x" from 0 to _skellyAmount do {
        
        _skellyType = _skellyArray select (floor random (count _skellyArray));
        _skellyPos = [_wreakPos,_radius,random 360,false] call SHK_pos;
        _skelly = createVehicle [_skellyType, _skellyPos, [], 0, "NONE"];
        _skelly setdir (random 360);
        _skelly setPos _skellyPos;
        
    };
    
    for "_x" from 0 to _barrelAmount do {
        
        _barrelPos = [_wreakPos,_bradius,random 360,false] call SHK_pos;
        _barrel = createVehicle ["MetalBarrel_burning_F", _barrelPos, [], 0, "NONE"];
        _barrel setdir (random 360);
        _barrel setPos _barrelPos;
        
    };
    
    for "_x" from 0 to _lootAmount do {
                
        _lootType = _lootArray select (floor random (count _lootArray));
        _lootPos = [_wreakPos,_radius,random 360,false] call SHK_pos;
        _lootItem = createVehicle ["groundWeaponHolder", _wreakPos, [], 0, "CAN_COLLIDE"];
        _lootItem addItemCargoGlobal [_lootType,1];
        _lootItem setdir (random 360);
        _lootItem setPos _lootPos;
        
    };
    
    _counter = _counter + 1;
};
