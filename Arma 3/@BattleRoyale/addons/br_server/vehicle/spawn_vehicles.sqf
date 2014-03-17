/* Made for exclusively for A3 Battle Royale Mod by [VB]AWOL */ 

private ["_velimit","_isAir","_isShip","_position","_dir","_marker","_vehObj","_vehClass","_allowedVehiclesList","_centerMarkerPosition","_dynamicVehicleArea","_roadList"];

EPOCH_DEBUG_VEH = false;

_allowedVehiclesList = [ 
	//Civilians
	["C_Hatchback_01_F",1],
	["C_Hatchback_01_sport_F",2],
	["C_Offroad_01_F",2],
	["C_Quadbike_01_F",5],
	["C_SUV_01_F",1],
	["C_Van_01_box_F",3],
	["C_Van_01_transport_F",3],
	// Civ Boats
	["C_Boat_Civil_01_F",1],
	["C_Boat_Civil_01_police_F",2],
	["C_Boat_Civil_01_rescue_F",2],
	["C_Rubberboat",2],
	// AAF
	["I_Quadbike_01_F",5],
	["I_Truck_02_covered_F",1],
	["I_Truck_02_transport_F",1],
	// AAF boats
	["I_Boat_Transport_01_F",1],
	// CSAT
	["O_Quadbike_01_F",5],
	["O_Truck_02_covered_F",3],
	["O_Truck_02_transport_F",3],
	// CSAT Boat
	["O_Lifeboat",3],
	// FIA
	["B_G_Offroad_01_F",2],
	["B_G_Quadbike_01_F",5],
	["B_G_Van_01_transport_F",4],
	// FIA Boat
	["B_G_Boat_Transport_01_F",4],
	//NATO
	["C_Hatchback_01_F",1],
	["C_Hatchback_01_sport_F",1],
	["C_Offroad_01_F",1],
	["C_Quadbike_01_F",5],
	["C_SUV_01_F",3],
	["C_Van_01_box_F",1],
	["C_Van_01_transport_F",4],
	// NATO Boats
	["B_Boat_Transport_01_F",6],
	["B_Lifeboat",3]
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
