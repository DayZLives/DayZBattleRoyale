@echo off
set number=1
cls
title Lazys DayZ Battle Royale Server %number% Starter
:brstart

timeout 1
"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql.exe" --user=dayz --password=dayz --database=battleroyale%number% --execute="delete from instance_deployable;"
timeout 1
"C:\Program Files\MySQL\MySQL Server 5.6\bin\mysql.exe" --user=dayz --password=dayz --database=battleroyale%number% --execute="delete from survivor;"
echo (%time%)DayZ Battle Royale Survivor, Deployable Data Wiped..
timeout 1

robocopy "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\@BattleRoyale\addons" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\@BattleRoyale%number%\addons"
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\Bans\Bans.txt" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\dayz_%number%.kulima\BattlEye\Bans.txt"
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\Hive\HiveEXT.dll" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\@BattleRoyale%number%\HiveEXT.dll"
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\Restarter\eXchangeArmATools.dll" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\@Arma2NETBR%number%\AddIns\eXchangeArmATools\eXchangeArmATools.dll"
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\Restarter\config%number%.cfg" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\@Arma2NETBR%number%\config.cfg"

set /a brmap=%random% %%5 
goto %brmap%

:0
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\ServerConfig\kulima_config_%number%.cfg" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\dayz_%number%.kulima\config_1234.cfg"
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\MPMissions\dayz_1.kulima.pbo" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\MPMissions\dayz_%number%.kulima.pbo"
timeout 1
echo (%time%)DayZ Battle Royale Kulima Server was started...
timeout 1
cd "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead"
start /wait /HIGH .\Expansion\beta\arma2oaserver.exe -ip=64.79.107.131 -port=2302 -mod=@Arma2NETBR%number%;@DayZBattleRoyale;@BattleRoyale%number%; -name=dayz_%number%.kulima -config=dayz_%number%.kulima\config_1234.cfg -cfg=dayz_%number%.kulima\basic.cfg -profiles=dayz_%number%.kulima cpuCount=8 -world=kulima -exThreads=7 -bandwidthAlg=2 -maxMem=2047
timeout 1
goto brstart

:1

copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\ServerConfig\isoladicapraia_config_%number%.cfg" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\dayz_%number%.isoladicapraia\config_1234.cfg"
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\MPMissions\dayz_1.isoladicapraia.pbo" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\MPMissions\dayz_%number%.isoladicapraia.pbo"
timeout 1
echo (%time%)DayZ Battle Royale Isola di Capraia Server was started...
timeout 1
cd "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead"
start /wait /HIGH .\Expansion\beta\arma2oaserver.exe -ip=64.79.107.131 -port=2302 -mod=@Arma2NETBR%number%;@DayZBattleRoyale;@BattleRoyale%number%; -name=dayz_%number%.isoladicapraia -config=dayz_%number%.isoladicapraia\config_1234.cfg -cfg=dayz_%number%.isoladicapraia\basic.cfg -profiles=dayz_%number%.isoladicapraia cpuCount=8 -world=isoladicapraia -exThreads=7 -bandwidthAlg=2 -maxMem=2047
timeout 1
goto brstart

:2

copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\ServerConfig\emita_config_%number%.cfg" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\dayz_%number%.emita\config_1234.cfg"
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\MPMissions\dayz_1.emita.pbo" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\MPMissions\dayz_%number%.emita.pbo"
timeout 1
echo (%time%)DayZ Battle Royale Emita Server was started...
timeout 1
cd "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead"
start /wait /HIGH .\Expansion\beta\arma2oaserver.exe -ip=64.79.107.131 -port=2302 -mod=@Arma2NETBR%number%;@DayZBattleRoyale;@BattleRoyale%number%; -name=dayz_%number%.emita -config=dayz_%number%.emita\config_1234.cfg -cfg=dayz_%number%.emita\basic.cfg -profiles=dayz_%number%.emita cpuCount=8 -world=emita -exThreads=7 -bandwidthAlg=2 -maxMem=2047
timeout 1
goto brstart

:3

copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\ServerConfig\queshkibrul_config_%number%.cfg" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\dayz_%number%.queshkibrul\config_1234.cfg"
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\MPMissions\dayz_1.queshkibrul.pbo" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\MPMissions\dayz_%number%.queshkibrul.pbo"
timeout 1
echo (%time%)DayZ Battle Royale Quesh Kibrul Server was started...
timeout 1
cd "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead"
start /wait /HIGH .\Expansion\beta\arma2oaserver.exe -ip=64.79.107.131 -port=2302 -mod=@Arma2NETBR%number%;@DayZBattleRoyale;@BattleRoyale%number%; -name=dayz_%number%.queshkibrul -config=dayz_%number%.queshkibrul\config_1234.cfg -cfg=dayz_%number%.queshkibrul\basic.cfg -profiles=dayz_%number%.queshkibrul cpuCount=8 -world=queshkibrul -exThreads=7 -bandwidthAlg=2 -maxMem=2047
timeout 1
goto brstart

:4

copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\ServerConfig\tigeria_config_%number%.cfg" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\dayz_%number%.tigeria\config_1234.cfg"
copy /y "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\BattleRoyaleUpdates\MPMissions\dayz_1.tigeria.pbo" "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead\MPMissions\dayz_%number%.tigeria.pbo"
timeout 1
echo (%time%)DayZ Battle Royale Tigeria Server was started...
timeout 1
cd "C:\Program Files (x86)\Steam\SteamApps\common\Arma 2 Operation Arrowhead"
start /wait /HIGH .\Expansion\beta\arma2oaserver.exe -ip=64.79.107.131 -port=2302 -mod=@Arma2NETBR%number%;@DayZBattleRoyale;@BattleRoyale%number%; -name=dayz_%number%.tigeria -config=dayz_%number%.tigeria\config_1234.cfg -cfg=dayz_%number%.tigeria\basic.cfg -profiles=dayz_%number%.tigeria cpuCount=8 -world=tigeria -exThreads=7 -bandwidthAlg=2 -maxMem=2047
timeout 1
goto brstart