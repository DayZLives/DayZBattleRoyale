//Script by lazyink for Battle Royale: Stratis v0.1
//Script inspired by, and uses parts of ARMA3Alpha FILL HOUSE SCRIPT v1.6 - by SPUn / lostvar

private ["_unit","_sniperCount","_sniperArray","_sniperPosArray","_sniperPositions","_sniperMax","_towerList","_skillArray","_snipersGrp","_startPosition","_snipersSide","_unitType","_towerPos","_obj","_tower"];

if (isServer) then {

    _towerList =  nearestObjects [[4000,4000,0], ["Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F"], 5000];
		
	_snipersSide = createCenter east;    
    _snipersGrp = createGroup east;
	
	_sniperPosArray = [[-2.38232,-2.73657,5.01471],[2.54736,0.380859,5.01471],[-3.48779,-1.89331,5.01471]];
	
	_sniperArray = ["O_soldier_LAT_F","O_Soldier_SL_F","O_Soldier_TL_F","O_soldier_AAR_F","O_soldier_AAA_F","O_spotter_F","O_sniper_F"];
	
	_skillArray = [0.65,0.5,0.6,0.85,0.9,1,1,0.75,1,0.6];
	
	_towerNo = 1;
	
    {			
		_obj = _x;
        _sniperCount = 0;
        _sniperMax = floor(random 3);
		
		if (_sniperMax < 1) then {_sniperMax = 1;};  
		
        while{_sniperCount <= _sniperMax} do {	           
			
            _unitType = _sniperArray call BIS_fnc_selectRandom;
            _startPosition = [3000,3000,0];

			_unit = _snipersGrp createUnit [_unitType, _startPosition, [], 0, "FORM"];
			
			_towerPos = _sniperPosArray select _sniperCount;
			
			_unit setPos (_obj modelToWorld _towerPos);			
            
            _unit setSkill ["aimingAccuracy",(_skillArray select 0)];
            _unit setSkill ["aimingShake",(_skillArray select 1)];
            _unit setSkill ["aimingSpeed",(_skillArray select 2)];
            _unit setSkill ["spotDistance",(_skillArray select 3)];
            _unit setSkill ["spotTime",(_skillArray select 4)];
            _unit setSkill ["courage",(_skillArray select 5)];
            _unit setSkill ["commanding",(_skillArray select 6)];
            _unit setSkill ["general",(_skillArray select 7)];
            _unit setSkill ["endurance",(_skillArray select 8)];
            _unit setSkill ["reloadspeed",(_skillArray select 9)];
			_unit disableAI "FSM";
			           
            _sniperCount = _sniperCount + 1;
            
        };
		
		_towerNo = _towerNo + 1;
   
    } forEach _towerList;
	
};