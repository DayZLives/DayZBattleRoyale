/////     /////     /////     /////     /////     /////     /////     /////     /////
/////////////////////////////////////////////////////////////////////////////////////////////
///////////////mmmyum's animated air raid dayz///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//                                                v0.6 RC5 may 5 2013 7pmEST RANDOM AND STATIC
//		decided to get you guys some kind of update with some of the requested features. 
//		non-animated version will not be updated at this time, maybe later if there is demand.  
//      to do following the code
//       don't forget to read the readme! (below)
//thanks to: opendayz.net! arma scripters Maxjoiner and DarkXess.  Sarge and Kind-Sir for all their help with this, and Grafzhal for his animated heli crashes code which helped me learn
//
//-------------------------------------------------------------------------------------------------------------
// README
//	README
//    README
// change SETUP sections
// change SETUP section later in code if you want custom bomber spawn in and spawn out locations
// change SET UP AI CODE section if you want AI spawns
// read further comments if you'd like to customize further 
//	note: if you fuck up formatting, especially for _loc
//													it will not work
//
//!!!!!!!!!!!!!!!!!!!!!!   IMPORTANT SETUP VALUES: MUST SET THESE FOR CODE TO WORK PROPERLY FOR YOU 
//_rmodyn ----- _useRandChoice ---------- _useRandBomb ------------ _spawnynAI -------------_spawnnumAI----_spawnMarker
//locations list - change if you want less/different locations - if you change me, random(##) must represent number of cases.
// start and end points
//---------------------------------------------------------------------------------------------------------------
//////////////////////////////BEGIN FILE

private ["_preWaypointPos","_spawnMarker","_spawnRadius","_wp","_espl","_sound","_duration","_aispawncoords","_aispawn","_rndSel","_loc","_city","_z","_xx","_y","_coords","_target","_posdebug","_heliModel","_heliStart","_safetyPoint","_bomberName","_positionLand","_bomber","_landingzone2","_aigroup2","_helipilot2","_wp2","_pos","_siren","_pos1","_wp3","_repeat","_break","_choice","_rmodyn","_preWaypoints","_sounddist","_ray","_pos2","_targetpos","_poswhistl","_sirenB","_citySwing","_wpT","_citySwing2","_wpT2","_wpLand","_rndSlp","_esp2","_useRandChoice","_useRandBomb","_aiSpawnX","_aiSpawnY","_spawnynAI","_spawnnumAI","_wpLandSpawn","_numbeofBombs","_esp3","_posEsp3","_debugPosEs1","_bomberDisT","_sirenPlayCnt","_randomLyn","_bomberPos","_debugYn","_yumEndCounter","_safetyEndPos","_safetyEnd"];

sleep 1;



//Initialize

while{ELAPSED_TIME < END_TIME } do
        {
            _time = END_TIME - ELAPSED_TIME;
            _finish_time_minutes = floor(_time / 60);
            _finish_time_seconds = (floor(_time)) - (60 * _finish_time_minutes);
			
if ((_finish_time_minutes == 80) && (_finish_time_seconds < 50))	then {

////////////////////////////////////////////////////SETUP SETUP SETUP//SETUP SETUP SETUP//SETUP SETUP SETUP//SETUP SETUP SETUP//SETUP SETUP SETUP
_repeat = 13;                             			//times to repeat//number of times to cycle complete code (pick new place to bomb)
_break = 1;                             			//time to break between attacks, in seconds (time between cycles)
_choice = 2;                              			//type of bombing 1 light, 2 medium, 3 heavy
_randomLyn = true;						  			//true if you want random locations (be sure to set static location otherwise!)
_loc = ["BalottaAirstrip",1.5,4829.9868,2450.1104];	//Set to static location format ["name",z,x,y]  //SKIP if using random locations
_city = "BalottaAirstrip";				  			//Set to string name of static location//allows for custom name in rpt no spaces
_useRandChoice = true;					  			//true if you want random choice of type of bomb per bomb
_useRandBomb = false;					  			//true if you want an extra random bomb
_numbeofBombs = 50;                       			//how many bombs are dropped assuming 1 per cycle
_rmodyn = true;                           			//true if you have rMod, false if you don't (choice of heli bomber) //mmmyum - it may work even without rmod as reported by users!
_preWaypoints = 0;                        			//add waypoints before arriving at location. //mmmyum testing now
	_spawnMarker = 'center';							//change to 'center' if you don't want to add your own marker
	_spawnRadius = 4000;							//radius to choose for prewaypoint (choose within x of _spawnMarker)
_sounddist = 5000;                        			//distance sounds are audible at
_ray = 500;                               			//ray of bombing
_spawnynAI = false;						  			//true if you want AIs to spawn (sometimes) //MUST SET UP AI CODE for your particular method of spawning AI
	_spawnnumAI = 7;						  		//number of times you want AIs to spawn MUST SET UP AI CODE
_debugYn = true;						  			//additional debug messages
////////////////////////////////////////////////////END SETUP//END SETUP//END SETUP//END SETUP//END SETUP//END SETUP//END SETUP//END SETUP

_xx = 4829.9868;
_y = 2450.1104;
_z = 1.5;
//Set
_z = _loc select 1;
_xx = _loc select 2;
_y = _loc select 3;
_coords = [_xx,_y,_z];
diag_log format ["RANDOM WORLDSPACE: Initializing defaults... %1 | %2 %3 %4| RANDOM ON: %5",_city,_xx,_y,_z,_randomLyn];


//BEGIN LOOP!          //change to While {true} do... for infinite loops                    
While {_repeat > 0} do {
_duration = _numbeofBombs;

//if option for random/static
if (_randomLyn) then {
_coords = [getMarkerPos "center",random 3300,random 360,false] call SHK_pos;

if (_debugYn) then {
diag_log format ["RANDOM WORLDSPACE: %1 | %2",_city,_coords];
};
sleep 1;
diag_log format ["RANDOM WORLDSPACE SELECTED: %1 | City: %2 | Coords: %3 , %4 | Try %5",_rndSel,_city,_xx,_y,_repeat];
}; //end if random locations //otherwise static

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//above  ---- the worldpace is selected, coordinates stored in _coords = [_xx,_y,_z]/////////////////////////////////////////////////////////
//below  ---- chopper is created, flies to waypoint _coords while sirens play, hangs around till bombs are done flies off and is deleted/////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//CREATE Marker///////////////

_bombzone = createMarker["bombzone", _coords];
_bombzone setMarkerShape "ELLIPSE";
"bombzone" setMarkerSize [500,500];
"bombzone" setMarkerColor "ColorRed";
"bombzone" setMarkerBrush "Grid";

//CREATE TARGET///////////////
_loc = createVehicle ["HeliHEmpty", _coords,[], 0, "NONE"];

_debugPosEs1 = getPosATL _loc;
_debugPosEs1 set [2, 0.1];
sleep 30;
_esp3 = createVehicle ["SH_105_HE",_debugPosEs1,[], 0, "NONE"];
_posEsp3 = position _esp3;
if (_debugYn) then {
diag_log format ["AIRRAID: DEBUG ESP3: %1 | debugPosEs1: %2",_posEsp3,_debugPosEs1];
};
///////////////////////////debug above
sleep 3;
//play long siren during bombing, one short siren

//start bombs loop
While {_duration > 0} do {

	if (_useRandChoice) then {
		_choice = floor(random 3);
	};
	_sound = createVehicle ["HeliHEmpty",position _loc,[], _ray, "NONE"];
	sleep 2;
	If (_choice == 0) then {
		_espl = createVehicle ["SH_105_HE",position _sound,[], 0, "NONE"];
	};
	If (_choice == 1) then {
		_espl = createVehicle ["Bo_FAB_250",position _sound,[], 0, "NONE"];
	};
	If (_choice == 2) then {
		_espl = createVehicle ["Bo_Mk82",position _sound,[], 0, "NONE"];
	};
	If (_choice == 3) then {
		_espl = createVehicle ["BO_GBU12_LGB",position _sound,[], 0, "NONE"];
	};
	_duration = _duration - 1;
	sleep (random 2);
	if (_useRandBomb) then {
		sleep 1;
		_esp2 = createVehicle ["SH_105_HE",position _sound,[], 0, "NONE"];
	};
	deletevehicle _sound;
	
}; // Close while loop. loop while _duration >1
///////////////////////////////////////////////////END SIRENS AND BOMBING, HELI LOWER TO GROUND, (SPAWN AIs), FLY AWAY//////////////////////////////////////////////////////////////
			
sleep 10;

sleep 0.1;
deletevehicle _loc;
sleep 0.1;
deleteMarker "bombzone";

diag_log format ["AIRRAID: END CYCLE: Going down for sleep: Repeat:%1 | Sleep:%2",_repeat,_break];
sleep _break;    
}; //close while loop. loop -  while _repeat > 1
exit

};  
};  
			

///////////////////////////////////////////TO DO
//
//bombs start to drop from chopper pos as it hits city borders 
///////////////////-- UP NEXT! see your rpt debug and report if it matches the bomber position message in the forum. 
//////////////////////////////also report if the heli seems to be relatively overtop of the town that should be bombed, but maybe still moving a bit. 
//crash site spawn if bomber destroyed
//AI parachutes?
//
//nuke options (this is still a ways off)