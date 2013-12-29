startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

dayZ_instance = 1;
dayz_antihack = 0;
dayz_REsec = 0;
dayz_spawnselection = 0;

initialized = false;
dayzHiveRequest = [];
dayz_previousID = 0;
END_TIME = 4500;

#include "\z\addons\dayz_code\system\mission\init.sqf"