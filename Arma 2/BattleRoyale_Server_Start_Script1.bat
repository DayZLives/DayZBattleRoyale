@echo off
set number=1
set IP=95.156.251.70
set PORT=2302
cls
title Lazys DayZ Battle Royale Server %number% Starter
:brstart


"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql.exe" --user=root --password=royale --database=battleroyale --execute="delete from object_data;"
"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql.exe" --user=root --password=royale --database=battleroyale --execute="UPDATE character_data SET Inventory='[[],[]]';"
"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql.exe" --user=root --password=royale --database=battleroyale --execute="UPDATE character_data SET Backpack='["",[],[]]';"
"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql.exe" --user=root --password=royale --database=battleroyale --execute="UPDATE character_data SET Worldspace='[]';"
"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql.exe" --user=root --password=royale --database=battleroyale --execute="UPDATE character_data SET Model='"Survivor2_DZ"';"
"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql.exe" --user=root --password=royale --database=battleroyale --execute="UPDATE character_data SET Humanity='4500';"
"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql.exe" --user=root --password=royale --database=battleroyale --execute="UPDATE character_data SET currentState='[]';"
"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql.exe" --user=root --password=royale --database=battleroyale --execute="UPDATE character_data SET Medical='[]';"
echo (%time%)DayZ Battle Royale Charater Data Reset
timeout 1

robocopy "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\@BattleRoyale\addons" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\@BattleRoyale%number%\addons"
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\Hive\HiveEXT.dll" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\@BattleRoyale%number%\HiveEXT.dll"
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\Restarter\eXchangeArmATools.dll" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\@Arma2NETBR%number%\AddIns\eXchangeArmATools\eXchangeArmATools.dll"
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\Restarter\config%number%.cfg" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\@Arma2NETBR%number%\config.cfg"

set /a brmap=%random% %%4
goto %brmap%

:0
robocopy "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\Battleye" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\dayz_%number%.kulima\BattlEye"
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\ServerConfig\%number%\kulima_config_%number%.cfg" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\dayz_%number%.kulima\config_1234.cfg"
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\MPMissions\dayz_%number%.kulima.pbo" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\MPMissions\dayz_%number%.kulima.pbo"
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\Hive\HiveExt%number%.ini" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\dayz_%number%.kulima\HiveExt.ini"
timeout 1

cd "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\BEC"
start Bec.exe -f config%number%_kulima.cfg
echo (%time%)DayZ Battle Royale Kulima Server was started...
timeout 1
cd "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead"
start /wait /HIGH .\Expansion\beta\arma2oaserver.exe -ip=%IP% -port=%PORT% -mod=@Arma2NETBR%number%;@DayZBattleRoyale;@BattleRoyale%number%; -name=dayz_%number%.kulima -config=dayz_%number%.kulima\config_1234.cfg -cfg=dayz_%number%.kulima\basic.cfg -profiles=dayz_%number%.kulima cpuCount=8 -world=kulima -exThreads=1 -bandwidthAlg=2 -maxMem=2047
timeout 1
goto brstart

:1
robocopy "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\Battleye" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\dayz_%number%.isoladicapraia\BattlEye"
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\ServerConfig\%number%\isoladicapraia_config_%number%.cfg" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\dayz_%number%.isoladicapraia\config_1234.cfg"
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\MPMissions\dayz_%number%.isoladicapraia.pbo" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\MPMissions\dayz_%number%.isoladicapraia.pbo"
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\Hive\HiveExt%number%.ini" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\dayz_%number%.isoladicapraia\HiveExt.ini"
timeout 1

cd "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\BEC"
start Bec.exe -f config%number%_isola.cfg
echo (%time%)DayZ Battle Royale Isola di Capraia Server was started...
timeout 1
cd "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead"
start /wait /HIGH .\Expansion\beta\arma2oaserver.exe -ip=%IP% -port=%PORT% -mod=@Arma2NETBR%number%;@DayZBattleRoyale;@BattleRoyale%number%; -name=dayz_%number%.isoladicapraia -config=dayz_%number%.isoladicapraia\config_1234.cfg -cfg=dayz_%number%.isoladicapraia\basic.cfg -profiles=dayz_%number%.isoladicapraia cpuCount=8 -world=isoladicapraia -exThreads=1 -bandwidthAlg=2 -maxMem=2047
timeout 1
goto brstart

:2
robocopy "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\Battleye" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\dayz_%number%.emita\BattlEye"
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\ServerConfig\%number%\emita_config_%number%.cfg" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\dayz_%number%.emita\config_1234.cfg"
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\MPMissions\dayz_%number%.emita.pbo" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\MPMissions\dayz_%number%.emita.pbo"
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\Hive\HiveExt%number%.ini" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\dayz_%number%.emita\HiveExt.ini"
timeout 1

cd "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\BEC"
start Bec.exe -f config%number%_emita.cfg
echo (%time%)DayZ Battle Royale Emita Server was started...
timeout 1
cd "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead"
start /wait /HIGH .\Expansion\beta\arma2oaserver.exe -ip=%IP% -port=%PORT% -mod=@Arma2NETBR%number%;@DayZBattleRoyale;@BattleRoyale%number%; -name=dayz_%number%.emita -config=dayz_%number%.emita\config_1234.cfg -cfg=dayz_%number%.emita\basic.cfg -profiles=dayz_%number%.emita cpuCount=8 -world=emita -exThreads=1 -bandwidthAlg=2 -maxMem=2047
timeout 1
goto brstart

:3
robocopy "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\Battleye" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\dayz_%number%.queshkibrul\BattlEye"
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\ServerConfig\%number%\queshkibrul_config_%number%.cfg" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\dayz_%number%.queshkibrul\config_1234.cfg"
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\MPMissions\dayz_%number%.queshkibrul.pbo" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\MPMissions\dayz_%number%.queshkibrul.pbo"
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\Hive\HiveExt%number%.ini" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\dayz_%number%.queshkibrul\HiveExt.ini"
timeout 1

cd "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\BEC"
start Bec.exe -f config%number%_quesh.cfg
echo (%time%)DayZ Battle Royale Quesh Kibrul Server was started...
timeout 1
cd "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead"
start /wait /HIGH .\Expansion\beta\arma2oaserver.exe -ip=%IP% -port=%PORT% -mod=@Arma2NETBR%number%;@DayZBattleRoyale;@BattleRoyale%number%; -name=dayz_%number%.queshkibrul -config=dayz_%number%.queshkibrul\config_1234.cfg -cfg=dayz_%number%.queshkibrul\basic.cfg -profiles=dayz_%number%.queshkibrul cpuCount=8 -world=queshkibrul -exThreads=1 -bandwidthAlg=2 -maxMem=2047
timeout 1
goto brstart
