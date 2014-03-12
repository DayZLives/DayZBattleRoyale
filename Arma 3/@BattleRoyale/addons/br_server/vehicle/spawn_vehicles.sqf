/* Made for exclusively for A3 Battle Royale Mod by [VB]AWOL */ 

private ["_velimit","_isAir","_isShip","_position","_dir","_marker","_vehObj","_vehClass","_allowedVehiclesList","_centerMarkerPosition","_dynamicVehicleArea","_roadList"];

EPOCH_DEBUG_VEH = true;

_allowedVehiclesList = [ 
	//Civilians
	["C_Hatchback_01_F",1],
	["C_Hatchback_01_sport_F",1],
	["C_Offroad_01_F",1],
	["C_Quadbike_01_F",1],
	["C_SUV_01_F",1],
	["C_Van_01_box_F",1],
	["C_Van_01_transport_F",1],
	// Civ Boats
	["C_Boat_Civil_01_F",1],
	["C_Boat_Civil_01_police_F",1],
	["C_Boat_Civil_01_rescue_F",1],
	["C_Rubberboat",1],
	// AAF
	["I_MRAP_03_F",1],
	["I_MRAP_03_gmg_F",1],
	["I_MRAP_03_hmg_F",1],
	["I_Quadbike_01_F",1],
	["I_Truck_02_covered_F",1],
	["I_Truck_02_transport_F",1],
	// AAF Air
	["I_Heli_Transport_02_F",1],
	["I_Plane_Fighter_03_AA_F",1],
	["I_Plane_Fighter_03_CAS_F",1],
	// AAF boats
	["I_Boat_Armed_01_minigun_F",1],
	["I_Boat_Transport_01_F",1],
	// CSAT
	["O_MRAP_02_F",1],
	["O_MRAP_02_gmg_F",1],
	["O_MRAP_02_hmg_F",1],
	["O_Quadbike_01_F",1],
	["O_Truck_02_covered_F",1],
	["O_Truck_02_transport_F",1],
	// CSAT Air
	["O_Heli_Attack_02_black_F",1],
	["O_Heli_Attack_02_F",1],
	["O_Heli_Light_02_F",1],
	["O_Heli_Light_02_unarmed_F",1],
	// CSAT Boat
	["O_Boat_Armed_01_hmg_F",1],
	["O_Boat_Transport_01_F",1],
	["O_Lifeboat",1],
	// FIA
	["B_G_Offroad_01_armed_F",1],
	["B_G_Offroad_01_F",1],
	["B_G_Quadbike_01_F",1],
	["B_G_Van_01_transport_F",1],
	// FIA Boat
	["B_G_Boat_Transport_01_F",1],
	//NATO
	["C_Hatchback_01_F",1],
	["C_Hatchback_01_sport_F",1],
	["C_Offroad_01_F",1],
	["C_Quadbike_01_F",1],
	["C_SUV_01_F",1],
	["C_Van_01_box_F",1],
	["C_Van_01_transport_F",1],
	["C_Van_01_transport_F",1],
	// NATO Air
	["B_Heli_Attack_01_F",1],
	["B_Heli_Light_01_armed_F",1],
	["B_Heli_Light_01_F",1],
	["B_Heli_Transport_01_camo_F",1],
	["B_Heli_Transport_01_F",1],
	// NATO Boats
	["B_Boat_Armed_01_minigun_F",1],
	["B_Boat_Transport_01_F",1],
	["B_Lifeboat",1]
];

_centerMarkerPosition = getMarkerPos "center";
_dynamicVehicleArea = 5000;
_roadList = _centerMarkerPosition nearRoads _dynamicVehicleArea;

{
	_vehClass = _x select 0;
	_velimit = _x select 1;
	
	for "_i" from 1 to _velimit do {
	
		// Find Vehicle Type to better control spawns
		_isAir = _vehClass isKindOf "Air";
		_isShip = _vehClass isKindOf "Ship";
	
		if(_isShip || _isAir) then {
			if(_isShip) then {
				_position = [_centerMarkerPosition,0,_dynamicVehicleArea,10,0,4000,1] call BIS_fnc_findSafePos;
				_position = [_position,0,100,10,2,4000,0] call BIS_fnc_findSafePos;
			} else {
				_position = [_centerMarkerPosition,0,_dynamicVehicleArea,10,0,1000,0] call BIS_fnc_findSafePos;
			};
		} else {
			// Spawn near roads			
			_position = _roadList call BIS_fnc_selectRandom;
			_position = _position modelToWorld [0,0,0];
			_position = [_position,0,10,10,0,2000,0] call BIS_fnc_findSafePos;
		};

		if ((count _position) == 2) then { 
			_dir = round(random 360);
			//place vehicle 
			_vehObj = createVehicle [_vehClass, _position, [], 0, "CAN_COLLIDE"];
			_vehObj setdir _dir;
			
			clearWeaponCargoGlobal    _vehObj;
			clearMagazineCargoGlobal  _vehObj;
			clearBackpackCargoGlobal  _vehObj;
			clearItemCargoGlobal	  _vehObj;
			
			_position set [2,0];
			
			if(surfaceIsWater _position) then {
				_vehObj setposASL _position;
			} else {
				_vehObj setposATL _position;
			};
			
			if(EPOCH_DEBUG_VEH) then {
				_marker = createMarker [str(_position) , _position];
				_marker setMarkerShape "ICON";
				_marker setMarkerType "mil_dot";
				_marker setMarkerText _vehClass; 
			};
		};
	};
} forEach _allowedVehiclesList;
