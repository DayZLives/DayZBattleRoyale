private ["_bombPos","_duration","_loc","_coords","_repeat","_break","_rad","_numbeofBombs","_bombzone","_time","_finish_time_minutes","_finish_time_seconds"];
sleep 1;

//Check the timer

while{ELAPSED_TIME < END_TIME } do
{
    _time = END_TIME - ELAPSED_TIME;
    _finish_time_minutes = floor(_time / 60);
    _finish_time_seconds = (floor(_time)) - (60 * _finish_time_minutes);
    
	//Wait for timer	
    if ((_finish_time_minutes == 65) && (_finish_time_seconds < 50)) then {

		//Settings
		_repeat = 13;                             			//Number of bombing zones to run
        _break = 1;                             			//Time between bombings
        _numbeofBombs = 50;                       			//how many bombs are dropped assuming 1 per cycle
        _rad = 500;		                        			//radius
		
		//Start the bombing           
        while {_repeat > 0} do {
		
            _duration = _numbeofBombs;
			
			//Create Bomb Zone  			
            _coords = [getMarkerPos "center",random 3500,random 360,false] call SHK_pos;                        
            sleep 1; 
			
			//Place the marker
            _bombzone = createMarker["bombzone", _coords];
            _bombzone setMarkerShape "ELLIPSE";
            "bombzone" setMarkerSize [500,500];
            "bombzone" setMarkerColor "ColorRed";
            "bombzone" setMarkerBrush "Grid"; 
			
            _loc = createVehicle ["Land_HelipadEmpty_F", _coords,[], 0, "NONE"];            
            sleep 3; 
			
            //Start bombing
            while {_duration > 0} do {             
                _choice = floor(random 3);
                _bombPos = createVehicle ["Land_HelipadEmpty_F",position _loc,[], _rad, "NONE"];
                _bombPos setPos [getPos _bombPos select 0, getPos _bombPos select 1, 100];
                sleep 2;
                if (_choice == 0) then {
                    createVehicle ["Sh_120mm_HE",position _bombPos,[], 0, "NONE"];
                };
                if (_choice == 1) then {
                    createVehicle ["BO_GBU12",position _bombPos,[], 0, "NONE"];
                };
                if (_choice == 2) then {
                    createVehicle ["Sh_120mm_HE",position _bombPos,[], 0, "NONE"];
                };
                if (_choice == 3) then {
                    createVehicle ["BO_GBU12",position _bombPos,[], 0, "NONE"];
                };
                _duration = _duration - 1;
                sleep (random 2);
                deletevehicle _bombPos;              
            }; 
			
            sleep 10;
			//Tidy up
            deletevehicle _loc;
            sleep 0.1;
            deleteMarker "bombzone";
            sleep _break;    
        }; 
        exit        
    };  
};  

