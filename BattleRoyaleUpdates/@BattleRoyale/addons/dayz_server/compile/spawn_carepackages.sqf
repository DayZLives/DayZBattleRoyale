//_chutetype, _boxtype, _helistart, _crashwreck
private ["_chutetype","_boxtype","_helistart","_crashwreck","_randomizedLoot","_guaranteedLoot","_chute","_box","_num","_weights","_index","_aaa","_itemType","_lootRadius","_lootPos","_pos","_bam","_i","_nearby","_smoke","_flare","_itemTypes","_itemChance","_cntWeights"];

_chutetype = _this select 0;
_boxtype = _this select 1;
_helistart	= _this select 2;
_crashwreck	= _this select 3;
_randomizedLoot = _this select 4;
_guaranteedLoot = _this select 5;

_lootRadius = 1;
_lootTable = ["Military","HeliCrash","MilitarySpecial"] call BIS_fnc_selectRandom;

	_chute = createVehicle [_chutetype,_helistart,[],0,"CAN_COLLIDE"];
	_chute setVariable["Sarge",1];
	_chute setPos [(getpos _crashwreck select 0), (getPos _crashwreck select 1), (getPos _crashwreck select 2)-10];
	
	_box = createVehicle [_boxtype,_helistart,[],0,"CAN_COLLIDE"];
	_box setVariable["Sarge",1];
	_box setPos [(getpos _crashwreck select 0), (getPos _crashwreck select 1), (getPos _crashwreck select 2)-10];
	
	_box attachto [_chute, [0, 0, 0]];
	
	_i = 0;


	while {_i < 45} do {
	scopeName "loop1";
    if (((getPos _box) select 2) < 1) then {breakOut "loop1"};

    sleep 1;
    _i=_i+1;
	};  


	switch (true) do {
	  case not (alive _box): {detach _box;_box setpos [(getpos _box select 0), (getpos _box select 1), 0];};
	  case alive _box: {detach _box;_box setpos [(getpos _box select 0), (getpos _box select 1), 0];_bam = _boxtype createVehicle [(getpos _box select 0),(getpos _box select 1),(getpos _box select 2)+0];deletevehicle _box;};
	};
	_bam setVariable["Sarge",1];
	deletevehicle _chute;
	
	sleep 2;
	
	_pos1 = [getpos _bam select 0, getpos _bam select 1,0];
	_pos = [_pos1,random 30,random 360,false] call SHK_pos;
	
	
	
	
	_smoke = createVehicle ["SmokeShellred",_pos,[],0,"CAN_COLLIDE"];
	_smoke setVariable["Sarge",1];

	
    _num		= (round(random _randomizedLoot)) + _guaranteedLoot;

              //_config = configFile >> "CfgBuildingLoot" >> _lootTable;
			  //_itemTypes = [] + getArray (configFile >> "CfgBuildingLoot" >> _lootTable >> "lootType");
			  
				_itemTypes = [
				["FN_FAL","weapon",0.02],
				["MedBox0","object",0.01],
				["AmmoBoxSmall_556","object",0.07],
				["AmmoBoxSmall_762","object",0.07],
				["Camo4_DZ","magazine",0.08],
				["Skin_Sniper2_DZ","magazine",0.05],
				["G36C_camo","weapon",0.02],
				["G36_C_SD_camo","weapon",0.01],
				["G36A_camo","weapon",0.02],
				["SCAR_H_LNG_Sniper","weapon",0.01],
				["VSS_vintorez","weapon",0.01],
				["M40A3","weapon",0.04],
				["Pecheneg","weapon",0.02],
				["PK","weapon",0.02],
				["SCAR_L_CQC_CCO_SD","weapon",0.02],
				["20Rnd_762x51_FNFAL","magazine",0.03],
				["SCAR_L_STD_Mk4CQT","weapon",0.02],
				["Skin_Sniper1_DZ","magazine",0.01],
				["Camo8_DZ","magazine",0.02],
				["20rnd_762x51_B_SCAR","magazine",0.02],
				["10Rnd_9x39_SP5_VSS","magazine",0.01],
				["RH_Deaglemzb","weapon",0.05],
				["RH_deaglem","weapon",0.05],
				["RH_deagle","weapon",0.05],
				["RH_bull","weapon",0.05],
				["FHQ_MSR_DESERT","weapon",0.01],
				["FHQ_XM2010_DESERT","weapon",0.01],
				["FHQ_ACR_WDL_HAMR_SD","weapon",0.01],
				["FHQ_ACR_TAN_RCO_SD","weapon",0.01],
				["KSVK","weapon",0.03],
				["5Rnd_127x108_KSVK","magazine",0.03],
				["VIL_M24B","weapon",0.02],
				["VIL_SVD_P21","weapon",0.01],
				["VIL_SVU","weapon",0.02],
				["VIL_HK417s","weapon",0.02],
				["Binocular_Vector","military",0.03],
				["FHQ_rem_20Rnd_762x51_PMAG_T_SD","magazine",0.01],
				["FHQ_rem_20Rnd_762x51_PMAG_T","magazine",0.01],
				["Skin_Sniper3_DZ","magazine",0.04],
				["Skin_Sniper4_DZ","magazine",0.01],
				["Skin_Sniper5_DZ","magazine",0.02],
				["Skin_Sniper6_DZ","magazine",0.01],
				["ItemSodaCoke","magazine",0.05],
				["FoodCanFrankBeans","magazine",0.06],
				["ItemBandage","magazine",0.04],
				["ItemAntibiotic","magazine",0.04],
				["ItemBloodbag","magazine",0.05],
				["ItemPainkiller","magazine",0.08],
				["ItemMorphine","magazine",0.03],
				["","military",0.3]
				];
				_itemChance = [
				0.02
				,0.01
				,0.07
				,0.07
				,0.08
				,0.05
				,0.02
				,0.01
				,0.02
				,0.01
				,0.01
				,0.04
				,0.02
				,0.02
				,0.02
				,0.03
				,0.02
				,0.05
				,0.02
				,0.02
				,0.01
				,0.05
				,0.05
				,0.05
				,0.05
				,0.02
				,0.01
				,0.01
				,0.01
				,0.03
				,0.03
				,0.02
				,0.01
				,0.02
				,0.02
				,0.03
				,0.01
				,0.01
				,0.01
				,0.01
				,0.01
				,0.01
				,0.05
				,0.06
				,0.04
				,0.04
				,0.05
				,0.08
				,0.03
				,0.3
				];
 
              _weights = [];
              _weights = [_itemTypes,_itemChance] call fnc_buildWeightedArray;
              _cntWeights = count _weights;
             

		//Creating the Lootpiles outside of the _crashModel
		for "_x" from 1 to _num do {
			//Create loot
		   	_aaa = random _cntweights;
			_index = floor(_aaa);		
			_index = _weights select _index;
			_itemType = _itemTypes select _index;
		
			
			//Let the Loot spawn in a non-perfect circle around _crashModel
			_lootPos = [_pos, ((random 2) + (sizeOf(_boxtype) * _lootRadius)), random 360] call BIS_fnc_relPos;
			[_itemType select 0, _itemType select 1, _lootPos, 0] call spawn_loot;

			diag_log(format["CAREPACKAGE: Loot spawn at '%1' with loot %2", _lootPos, _itemType]); 

			// ReammoBox is preferred parent class here, as WeaponHolder wouldn't match MedBox0 and other such items.
			_nearby = _pos nearObjects ["ReammoBox", (sizeOf(_boxtype)+3)];
			{
				_x setVariable ["permaLoot",true];
			} forEach _nearBy;
		};