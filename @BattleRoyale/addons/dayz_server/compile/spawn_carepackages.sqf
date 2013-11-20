//_chutetype, _boxtype, _helistart, _crashwreck
private["_chutetype", "_boxtype", "_helistart", "_crashwreck", "_randomizedLoot", "_guaranteedLoot", "_chute", "_chutetype", "_helistart", "_crashwreck", "_box", "_boxtype", "_num", "_weights", "_index", "_aaa", "_itemType", "_lootRadius", "_lootPos", "_pos", "_bam"];

_chutetype = _this select 0;
_boxtype = _this select 1;
_helistart	= _this select 2;
_crashwreck	= _this select 3;
_randomizedLoot = _this select 4;
_guaranteedLoot = _this select 5;

_lootRadius = 1;
//_lootTable = ["Military","HeliCrash","MilitarySpecial"] call BIS_fnc_selectRandom;

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

    sleep 0.1;
    _i=_i+0.1;
	};  


	switch (true) do {
	  case not (alive _box): {detach _box;_box setpos [(getpos _box select 0), (getpos _box select 1), 0];};
	  case alive _box: {detach _box;_box setpos [(getpos _box select 0), (getpos _box select 1), 0];_bam = _boxtype createVehicle [(getpos _box select 0),(getpos _box select 1),(getpos _box select 2)+0];deletevehicle _box;};
	};
	_bam setVariable["Sarge",1];
	deletevehicle _chute;
	
	sleep 2;
	
	_pos = [getpos _bam select 0, getpos _bam select 1,0];
	
	
	_smoke = createVehicle ["SmokeShellred",_pos,[],0,"CAN_COLLIDE"];
	_smoke setVariable["Sarge",1];
	
	_flare = "F_40mm_white" createVehicle [getPos _bam select 0, getPos _bam select 1, (getPos _bam select 2) +150];
	_flare setVariable["Sarge",1];
	
	
	
	_num		= round(random _randomizedLoot) + _guaranteedLoot;

              //_config = configFile >> "CfgBuildingLoot" >> _lootTable;
              _itemTypes = [
			  ["M16A4_ACG","weapon"],
			  ["UZI_SD_EP1","weapon"],
			  ["RH_p226","weapon"],
			  ["VIL_M110","weapon"],
			  ["M4A1_HWS_GL_camo","weapon"],
			  ["SCAR_H_STD_EGLM_Spect","weapon"],
			  ["M4SPR","weapon"],
			  ["VIL_HK416_EDR","weapon"],
			  ["VIL_Galil_arm","weapon"],
			  ["VIL_SR25","weapon"],
			  ["RH_deaglem","weapon"],
			  ["UZI_EP1","weapon"],
			  ["VIL_SVD_P21","weapon"],
			  ["Skin_Camo1_DZ","magazine"],
			  ["Skin_Sniper3_DZ","magazine"],
			  ["Skin_Sniper6_DZ","magazine"],
			  ["SCAR_L_CQC_CCO_SD","weapon"],
			  ["VIL_M24B","weapon"],
			  ["FHQ_MSR_DESERT","weapon"],
			  ["M4A1","weapon"],
			  ["Sa58P_EP1","weapon"],
			  ["VIL_M40A3","weapon"],
			  ["DZ_British_ACU","object"],
			  ["FHQ_ACR_WDL_HWS_GL","weapon"],
			  ["RH_tec9","weapon"],
			  ["MedBox0","object"],
			  ["AmmoBoxSmall_680x43","object"],
			  ["DZ_TK_Assault_Pack_EP1","object"],
			  ["FHQ_ACR_BLK_RCO_SD","weapon"],
			  ["SCAR_H_LNG_Sniper","weapon"],
			  ["RH_uspsd","weapon"],
			  ["glock17_EP1","weapon"],
			  ["FHQ_RSASS_TAN","weapon"],
			  ["Winchester1866","weapon"],
			  ["DZ_CivilBackpack_EP1","object"],
			  ["Skin_Camo12_DZ","magazine"],
			  ["Skin_Camo15_DZ","magazine"],
			  ["ItemMatchbox","generic"],
			  ["SCAR_L_STD_HOLO","weapon"],
			  ["Binocular_Vector","military"],
			  ["ItemMap","weapon"],
			  ["RH_m1911sd","weapon"],
			  ["RH_python","weapon"],
			  ["BAF_L85A2_RIS_Holo","weapon"],
			  ["","food"],
			  ["","medical"]];
              _itemChance = [
			  0.06, //M16A4_ACG
			  0.08, //UZI_SD_EP1
			  0.04, //RH_p226
			  0.02, //VIL_M110
			  0.03, //M4A1_HWS_GL_camo
			  0.01, //SCAR_H_STD_EGLM_Spect
			  0.02, //M4SPR
			  0.01, //VIL_HK416_EDR
			  0.01, //VIL_Galil_arm
			  0.01, //VIL_SR25
			  0.01, //RH_deaglem
			  0.03, //UZI_EP1
			  0.01, //VIL_SVD_P21
			  0.03, //Skin_Camo1_DZ
			  0.03, //Skin_Sniper3_DZ
			  0.02, //Skin_Sniper6_DZ
			  0.01, //SCAR_L_CQC_CCO_SD
			  0.01, //VIL_M24B
			  0.01, //FHQ_MSR_DESERT
			  0.03, //M4A1
			  0.03, //Sa58P_EP1
			  0.01, //VIL_M40A3
			  0.02, //DZ_British_ACU
			  0.01, //FHQ_ACR_WDL_HWS_GL
			  0.06, //RH_tec9
			  0.1,  //MedBox0
			  0.05,  //AmmoBoxSmall_680x43
			  0.1,  //DZ_TK_Assault_Pack_EP1
			  0.01,  //FHQ_ACR_BLK_RCO_SD
			  0.02, //SCAR_H_LNG_Sniper
			  0.02, //RH_uspsd
			  0.02, //glock17_EP1
			  0.02, //FHQ_RSASS_TAN
			  0.05, //Winchester1866
			  0.05, //DZ_CivilBackpack_EP1
			  0.05, //Skin_Camo12_DZ
			  0.09, //Skin_Camo15_DZ
			  0.08, //ItemMatchbox
			  0.03, //SCAR_L_STD_HOLO
			  0.08, //Binocular_Vector
			  0.08, //ItemMap
			  0.06,  //RH_m1911sd
			  0.02,  //RH_python
			  0.05,  //BAF_L85A2_RIS_Holo
			  0.35, //Food
			  0.25  //medical
			  ];
 
              _weights = [];
              _weights = [_itemType,_itemChance] call fnc_buildWeightedArray;
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

			diag_log(format["CAREPACKAGE: Loot spawn at '%1' with loot %2", _lootPos, _itemtype]); 

			// ReammoBox is preferred parent class here, as WeaponHolder wouldn't match MedBox0 and other such items.
			_nearby = _pos nearObjects ["ReammoBox", (sizeOf(_boxtype)+3)];
			{
				_x setVariable ["permaLoot",true];
			} forEach _nearBy;
		};