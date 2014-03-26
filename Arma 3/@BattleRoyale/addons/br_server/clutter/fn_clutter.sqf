// Map Clutter Script by lazyink for Battle Royale
// Inspired by Roadside IED script by mantls http://forums.bistudio.com/showthread.php?154744-Roadside-IED-Script
//

private ["_newDir","_list","_junkarray","_junktype","_road","_roadDir","_chance","_dir","_pos","_posx","_posy","_tx","_ty","_junkpos","_junk","_center","_counter","_amount","_dist","_rwreak","_junkamount","_wreakArray","_wreakType","_wreakPos","_wreak"];

if (isServer) then {

	_center = getMarkerPos "center";    
	_counter = 0;
	_amount = 100;          
	_dist = 4500;

	while {_counter < _amount} do {
		
		_rwreak = 1.75;
		_junkamount = floor (random 5);
		_list = _center nearRoads _dist;
		
		_wreakArray =["Land_GarbagePallet_F","Land_CanisterFuel_F","Land_GarbageWashingMachine_F","Land_JunkPile_F","Land_CanisterPlastic_F","Land_Tyres_F","Land_GarbageBags_F","Land_Wreck_Car2_F","Land_Wreck_Car3_F","Land_Wreck_BRDM2_F","Land_Wreck_CarDismantled_F","Land_Wreck_Hunter_F","Land_Wreck_Offroad_F","Land_ScrapHeap_2_F","Land_Wreck_Skodovka_F","Land_Wreck_Slammer_F","Land_Wreck_Slammer_turret_F","Land_Wreck_Truck_F","Land_UWreck_MV22_F","Land_Wreck_UAZ_F","Land_Wreck_Van_F","Land_ScrapHeap_1_F","Land_Scrap_MRAP_01_F"]; // Objects used as Wreak
		
		_junkarray =["MetalBarrel_burning_F","Land_MetalBarrel_empty_F","Land_Pallets_stack_F","Land_Grave_rocks_F","Land_GarbageBarrel_01_F","Land_Leaflet_03_F","Land_Leaflet_02_F","Land_Leaflet_01_F","Land_Leaflet_04_F","Land_BarrelEmpty_grey_F","RoadCone_F","Land_Coil_F","Land_HumanSkull_F","Land_Tyre_F","Land_Garbage_line_F","Land_Garbage_square3_F","Land_Garbage_square5_F","Land_TacticalBacon_F","and_Can_Dented_F","Land_Bucket_painted_F"]; // Objects used as Junk
		
		_wreakType = _wreakArray select (floor random (count _wreakArray));
		_road = _list select (round random (count _list));
		_dir =  getDir _road;
		_pos = getpos _road;
		_posx = _pos select 0;
		_posy = _pos select 1;
		_tx = (_posx + (_rwreak * sin(_dir)));
		_ty = (_posy + (_rwreak * cos(_dir)));	
		_wreakPos = [_tx,_ty,0];
		_wreak = createVehicle [_wreakType, _wreakPos, [], 0, "NONE"]
		_wreak setDir (random 360);
		
		diag_log format["CLUTTER DEBUG WREAK: type: %1 location: %2", _wreakType, _wreakPos];
		
		for "_x" from 0 to _junkamount do {
		
			_junktype = _junkarray select (floor random (count _junkarray));
			_junkpos = [_wreakPos,random 2,random 360,false] call SHK_pos;
			_junk = createVehicle [_junktype, _junkpos, [], 0, "NONE"]
			_junk setdir (random 360);
			diag_log format["CLUTTER DEBUG JUNK: type: %1 location: %2", _junktype, _junkpos];
			sleep 0.1;
		};

		sleep 0.1;
		
	};

};