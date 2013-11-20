private["_obj","_objectID","_objectUID"];
_obj = _this select 3;
canAbort = true;

player removeAction s_player_igniteTent;
s_player_igniteTent = -1;

player playActionNow "Medic";
sleep 7;

_objectID = _obj getVariable["ObjectID","0"];
_objectUID = _obj getVariable["ObjectUID","0"];

PVDZ_obj_Fire = [_obj,5,time,false,true];
publicVariable "PVDZ_obj_Fire";
_id = PVDZ_obj_Fire spawn BIS_Effects_Burn;

_obj setDamage 2;

PVDZ_obj_Delete = [_objectID,_objectUID];
publicVariableServer "PVDZ_obj_Delete";
canAbort = false;
if (isServer) then {
	PVDZ_obj_Delete call server_deleteObj;
};
sleep 45;
deleteVehicle _obj;