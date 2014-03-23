	fn_keybindings {
		private ["_keyDown"];
		_keyDown = _this select 1;	
		if (_keyDown == 0x42) then {[] spawn fnc_simple_list2;};
	};
	
	br_frcam =
	{
		_name = _this select 0;
		{
			if (name _x == _name) then
			{
				_x exec 'camera.sqs';
				
				cutText [format["CAMERA AT %1",_name], "PLAIN DOWN"];
			};
		} forEach playableUnits;
	};
	
	br_fnc_esp = {
		fnc_esp =
		{
			
            private ["_text","_crewnames","_posU2","_pos2D","_Tsize","_pos","_posU","_dist","_veh","_ctrl","_unit"];
            disableSerialization;
			if (isNil "LayerID") then {LayerID = 2733;};
			LayerID cutRsc ["rscDynamicText", "PLAIN"];
			LayerID = LayerID + 1;
			_ctrl = ((uiNamespace getvariable "BIS_dynamicText") displayctrl 9999);
			_unit = _this select 0;
			while {1 == 1} do
			{
				if ((isNull _unit) || !(alive _unit)) exitWith {
					_ctrl ctrlShow false;_ctrl ctrlEnable false;
					fnc_esp_unitarray = fnc_esp_unitarray - [_unit];
					LayerID = nil;
				};
				if ((fnc_esp_state == 0) || (visibleMap)) exitWith {
					_ctrl ctrlShow false;_ctrl ctrlEnable false;
					fnc_esp_unitarray = fnc_esp_unitarray - [_unit];
					LayerID = nil;
				};
				_pos = (positionCameraToWorld [0,0,0]);
				_posU = getPos _unit;
				_dist = round(_pos distance _posU);
				if (_dist > fnc_esp_distance) exitWith {
					_ctrl ctrlShow false;_ctrl ctrlEnable false;
					fnc_esp_unitarray = fnc_esp_unitarray - [_unit];
					LayerID = nil;
				};
				
				_veh = vehicle _unit;
				_posU2 = [(getPosATL _veh) select 0, (getPosATL _veh) select 1, ((getPosATL _veh) select 2) + (((boundingBox _veh) select 1) select 2) + 0.5];
				_pos2D = worldToScreen _posU2;
				if (count _pos2D > 0) then
				{
					if (_dist <= 35) then {_ctrl ctrlSetFade 0;};
					if (_dist > 35) then {_ctrl ctrlSetFade 0.1;};
					if (_dist > 75) then {_ctrl ctrlSetFade 0.2;};
					if (_dist > 150) then {_ctrl ctrlSetFade 0.4;};
					if (_dist > 300) then {_ctrl ctrlSetFade 0.5;};
					if (_dist > 450) then {_ctrl ctrlSetFade 0.55;};
					if (_dist > 600) then {_ctrl ctrlSetFade 0.65;};
					if (_dist > 800) then {_ctrl ctrlSetFade 0.75;};
					if (_dist > 1000) then {_ctrl ctrlSetFade 0.85;};
					
					
					
					_Tsize = 0.4;
					
					_text = parseText format ["<t size='%3'font='Zeppelin33'color='#0B80FF'>%1 (%2m)</t>",name _unit,round _dist,_Tsize];
					if (name _unit == name player) then {_text = ""};
					if (_unit != _veh) then
					{
						_crewnames = [];
						{
							_crewnames = _crewnames + [name _x];
						} forEach crew _veh;
						_posU2 = [_posU2 select 0,_posU2 select 1,(_posU2 select 2) + 1.5];
						_pos2D = worldToScreen _posU2;
						_text = parseText format ["<t size='%3'font='Zeppelin33'color='#FF5926'>%1 (%2m) %4</t>",_crewnames,round _dist,_Tsize,typeOF _veh];
					};
					_ctrl ctrlShow true;_ctrl ctrlEnable true;
					_ctrl ctrlSetStructuredText _text;
					_ctrl ctrlSetPosition [(_pos2D select 0) - (safezoneW / 2), (_pos2D select 1), safezoneW, safezoneH];
					_ctrl ctrlCommit 0;
				}
				else
				{
					_ctrl ctrlShow false;_ctrl ctrlEnable false;
				};
				sleep 0.01;
			};
			_ctrl ctrlShow false;_ctrl ctrlEnable false;
			fnc_esp_unitarray = fnc_esp_unitarray - [_unit];
			LayerID = nil;
		};
		if (isNil "fnc_esp_state") then {fnc_esp_state = 0;};
		if (fnc_esp_state == 0) then
		{
			setGroupIconsVisible [true, false];
			fnc_esp_state = 1;
			fnc_esp_distance = 2000;
			fnc_esp_unitarray = [];
			LayerID = nil;
			while {fnc_esp_state == 1} do
			{
				{
					if (!isNull _x) then {
						_pos = (positionCameraToWorld [0,0,0]);
						_posX = getPos _x;
						_dist = (_pos distance _posX);
						if (!(_x in fnc_esp_unitarray) && (_dist < fnc_esp_distance) && (!visibleMap)) then 
						{
							fnc_esp_unitarray = fnc_esp_unitarray + [_x];
							[_x] spawn fnc_esp;
						};
						if ((_x in fnc_esp_unitarray) && (_dist > fnc_esp_distance)) then 
						{
							fnc_esp_unitarray = fnc_esp_unitarray - [_x];
						};
					};
				} forEach playableUnits;
				sleep 0.75;
			};
		}
		else
		{
			setGroupIconsVisible [true, true];
			fnc_esp_state = 0;
			fnc_esp_unitarray = [];
			LayerID = nil;
		};
	};
	
	fnc_simple_list2 = {
		disableSerialization;
		if (isNull (findDisplay 1001)) then {createDialog "RscDisplayWFVoting";};		
		_display = findDisplay 1001;
		_ctrl = _display displayctrl 1006;
		lbclear _ctrl;
		
		_myPos = positionCameraToWorld [0,0,0];
		_unsorted = playableUnits;
		_sorted = [];
		{
			_closest = _unsorted select 0;
			{
				if ((getPos _x distance _myPos) < (getPos _closest distance _myPos)) then {_closest = _x}
			} forEach _unsorted;
			_sorted = _sorted + [_closest];
			_unsorted = _unsorted - [_closest]
		} forEach _unsorted;
		_sorted;
		
		{
			_xPos = getPos _x;
			if (getPlayerUID _x != '') then
			{
				_distance = round(_myPos distance _xPos);
				_ctrl lbAdd format["%1",_distance];
				_ctrl lbAdd format["%1",name _x];
			};
		} forEach _sorted;
		if (str(side player) == "CIV") then {[player] joinSilent (createGroup WEST);};
		
		fnc_dblClick = {
			_name = _this select 0;
			{
				if (name _x == _name) then
				{
					_x switchCamera "External";
				};
			} forEach playableUnits;
			sleep 0.5;
			[_name] spawn br_frcam;
			[] spawn br_fnc_esp;
			if (!isNull (findDisplay 1001)) then {closedialog 0;};
		};
		ctrlSetText [1003,"DOUBLECLICK FOR FREEROAMCAM"];
		ctrlSetText [1004,"DISTANCE"];
		ctrlSetText [1005,"NAME"];
		ctrlSetText [1007,"[DayZBattleRoyale.com]"];
		_ctrl ctrlSetEventHandler ['LBDblClick','[(lbtext [1006, (floor((lbCurSel 1006)*2))+1])] spawn fnc_dblClick;'];

	};
	
	findDisplay 46 displayAddEventHandler ["KeyDown",{_this call fn_keybindings}];	
	