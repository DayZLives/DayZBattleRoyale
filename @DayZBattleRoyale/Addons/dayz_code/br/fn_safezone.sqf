//Mod by Zane
private ["_Basis"];
_Basis = _this select 0; //Basisname
while {true} do
{
    waitUntil {vehicle player in list _Basis};
    titleText ["God mode ON.", "PLAIN DOWN", 3];
    sleep 2;
    player setUnitRecoilCoefficient 0;
    fnc_usec_damageHandler = {};
    fnc_usec_unconscious  = {};
    player allowDamage false;
    waitUntil {!(vehicle player in list _Basis)};
    titleText ["God mode OFF.", "PLAIN DOWN", 3];
    sleep 2;
    player setUnitRecoilCoefficient 1;
    fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
    fnc_usec_unconscious = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";
    player allowDamage true;
}; 