//Script by lazyink for Battle Royale: Stratis
//Script inspired by, and uses parts of ARMA3Alpha FILL HOUSE SCRIPT v1.6 - by SPUn / lostvar

private ["_unit","_sniperCount","_sniperArray","_sniperPosArray","_sniperPositions","_sniperMax","_towerList","_skillArray","_snipersGrp","_startPosition","_snipersSide","_unitType","_towerPos","_obj","_tower"];

if (isServer) then {

    _towerList =  nearestObjects [[4000,4000,0], ["Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F"], 5000];
		
	_snipersSide = createCenter east;    
    _snipersGrp = createGroup east;
	
	_sniperPosArray1 = [[-4.0874,-5.38379,4.92715],[6.20752,-0.717773,4.98471],[-1.78174,5.61035,4.98471]];
    _sniperPosArray2 = [[-2.24561,-5.12842,4.98471],[4.2251,-3.07764,4.98471],[-4.48169,5.7168,4.98471]];
    _sniperPosArray3 = [[-4.64063,-0.605957,5.00471],[4.43848,3.58545,5.00471],[-4.72485,4.24854,5.00471]];
	
	_sniperArray = ["O_soldier_LAT_F","O_Soldier_SL_F","O_Soldier_TL_F","O_soldier_AAR_F","O_soldier_AAA_F","O_soldier_AAT_F"];
	
	_skillArray = [0.65,0.5,0.6,0.85,0.9,1,1,0.75,1,0.6];
	
    {	
		
		_obj = _x;

		_sniperPositions = [_sniperPosArray1,_sniperPosArray2,_sniperPosArray3] call BIS_fnc_selectRandom;
		
		diag_log format["DEBUG AI: sniper Positions: %1", _sniperPositions];
		
        _sniperCount = 0;
        _sniperMax = floor(random 4);		
        
        while{_sniperCount < _sniperMax} do {		
            
			
            _unitType = _sniperArray call BIS_fnc_selectRandom;
            _startPosition = [3000,3000,0];

			_unit = _snipersGrp createUnit [_unitType, _startPosition, [], 0, "FORM"];
			
			_towerPos = _sniperPositions select _sniperCount;
			
			diag_log format["DEBUG AI: tower Pos: %1", _towerPos];
			
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
            
            _sniperCount = _sniperCount + 1;
			
			sleep 0.1;
            
        };
		
		sleep 0.1;
        
    } forEach _towerList;		
    
};