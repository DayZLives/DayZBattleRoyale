/* ********************************************************************************* */
/* *******************Developer : infiSTAR (infiSTAR23@gmail.com)******************* */
/* ********************Copr. ©2013 infiSTAR all rights reserved********************* */
/* *********************************www.infiSTAR.de********************************* */
/*  Key to open the menu  */ _OpenMenuKey = 0x3F;    /* google DIK_KeyCodes (0x3C is F2) */
/* ********************************************************************************* */
/*  Mod EPOCH ?           */ _MEH = true;   /* true or false */
/* ********************************************************************************* */
/*  LOW ADMIN HERE        */ _LowLevel_List =   ["0","0","0"]; //do not have a , at the end.
/*  NORMAL ADMIN HERE     */ _NormalLevel_List =["23398022","26376838","35596998","70750982","27821446","111976390"]; //do not have a , at the end.
/*  SUPER ADMIN HERE      */ _SuperLevel_List = ["71581894","155767302"]; //do not have a , at the end.
/*  BANNED PLAYER HERE    */ _BLOCKED =         ["0","0","0"]; //do not have a , at the end.
/* ********************************************************************************* */
/*  Top esc menu TXT      */ _TopOfESC = 'DayZBR'; //do not use ' or " in this text.
/*  Bottom esc menu TXT   */ _LowerTop = 'One dead, 42 to go!'; //do not use ' or " in this text.
/*  Bottom esc menu TXT2  */ _LowerBottom = 'dayzbattleroyale.com'; //do not use ' or " in this text.
/*  Color esc menu TXT    */ _EscColor = [0.68,0.03,0.17,1];
/* ********************************************************************************* */
/*  DebugMonitor TXT      */ _BottomDebug = 'infiSTAR.de'; //do not use ' or " in this text.
/*  DebugMonitor Key      */ _ODK =  0xCF;	/* google DIK_KeyCodes (0xCF is END) */
/*  Use DebugMonitor      */ _DMS = false;	/* true or false */	/* starts up with debugmonitor ON if true */
/*  DebugMonitor Action   */ _DMW = false;	/* true or false */	/* "Debug" option on mousewheel */
/*  DebugMonitor ITEM     */ _DBI = false;	/* item or false */	/* _DBI = 'your item choice'; */
/* ********************************************************************************* */
/*  Use AUTOBAN HACKER    */ _UAB =  true;   /* true or false */	/* recommended:  true */	/* we always used this. */
/*  Forbid VON Sidechat   */ _VON =  true;   /* true or false */	/* recommended: false */	/* talking on sidechat will put out a warning and kick if continue */
/*  Use vehicle check?    */ _UVC =  true;   /* true or false */	/* recommended: false */	/* using _ALLOWED_Vehicles and _FORBIDDEN_Vehicles lists */
/*  Vehicle WHITELIST     */ _UVW =  true;   /* true or false */	/* recommended: false */	/* if false - _ALLOWED_Vehicles won't not be used */
/* ********************************************************************************* */
/*  Use FileScan ?        */ _UFS =  true;   /* true or false */	/* recommended:  true */	/* spams the rpt but often finds hackers */
/*  Use cut-scene ?       */ _UCS =  true;   /* true or false */	/* recommended:  true */	/* dynamicText ~ often colored, animated or used in credits */
/*  Use SafeZones ?       */ _USZ =  true;   /* true or false */	/* recommended:  true */	/* if you have a zone where people get godmode/anti zombie aggro (most Epoch server do have this!) */
/*  HACKED BOX Check ?    */ _CHB =  true;   /* true or false */	/* recommended:  true */	/* some epoch player might want to turn this one off */
/*  Check CMDMenus ?      */ _CCM =  true;   /* true or false */	/* recommended:  true */	/* only disable this if you know what you are doing. */
/*  BLOCK ALL CMDMenus    */ _BCM =  true;   /* true or false */	/* recommended:  true */	/* we don't need commandingMenus. so have this true. */
/*  Check Actions ?       */ _CSA =  true;   /* true or false */	/* recommended:  true */
/* ********************************************************************************* */
/*  Player that have one of the items in _ForbiddenWeapons in their inventory will get punished!  */
/*  FORBIDDEN Weapons     */ _ForbiddenWeapons = ['RAILGUN','P00PGUN','LEAKTUBE'];
/* ********************************************************************************* */
/*  If _UVC = true; and _UVW = true; this check will start and delete all vehicles that are not in _ALLOWED_Vehicles  */
/*  ALLOWED  Vehicles     */ _ALLOWED_Vehicles =
[
 'BAF_Offroad_D','M1030_US_DES_EP1','MV22','MV22_DZ','hilux1_civil_2_covered',
 'Offroad_DSHKM_Gue','PBX','Old_bike_TK_CIV_EP1','datsun1_civil_3_open','UAZ_Unarmed_UN_EP1','HMMWV_DZ','smallboat_2',
 'Fishing_Boat','Skoda','SkodaGreen','HMMWV_DES_EP1','UAZ_CDF','Old_moto_TK_Civ_EP1',
 'LandRover_CZ_EP1','hilux1_civil_1_open','tractorOld','TT650_Gue','UralOpen_INS','TT650_TK_EP1',
 'VolhaLimo_TK_CIV_EP1','Volha_1_TK_CIV_EP1','Smallboat_1','ParachuteMediumEast','Misc_cargo_cont_net1','Lada1_TK_CIV_EP1'
];
/* ********************************************************************************* */
/*  If _UVC = true; this check will start and delete all vehicles that are in _FORBIDDEN_Vehicles  */
/*  FORBIDDEN Vehicles    */ _FORBIDDEN_Vehicles = ['A10','AH1Z','AH64D','T90','MI17','UH1H','UH1H2','AH6X','MH6J_DZ','UH1Y_DZ','UH60M_DZ','CH_47F_DZ','BAF_Merlin_DZ','MH6J2_DZ','Ka60_GL_DZ'];
/* ********************************************************************************* */
/*  ALLOWED CMDMenus are only used if you have _BCM = false; which I would not recommend.  */
/*  ALLOWED CMDMenus      */ _cMenu = 
[
	'','RscMainMenu','RscMoveHigh','#WATCH','#WATCH0',
	'RscWatchDir','RscDisplayClassSelecter','RscDisplayGenderSelect',
	'RscDisplaySpawnSelecter','RscWatchMoreDir','#GETIN','RscStatus',
	'RscCombatMode','RscFormations','RscTeam','RscSelectTeam','RscReply',
	'RscCallSupport','#ACTION','#CUSTOM_RADIO','RscRadio','RscGroupRootMenu'
];
/* ********************************************************************************* */
/*  ALLOWED Actions are only used if you have _CSA =  true;  */
/*  ALLOWED Actions      */ _dayzActions =
"([
	dayz_myCursorTarget,s_player_craftZombieBait,wardrobe,s_player_butcher_human,s_player_makeBomb,s_player_zombieShield,s_player_upgrademoto,
	s_player_smeltRecipes,null,churchie_check,churchie_defuse,churchie_rig_veh,player_Cannibalism,s_player_fillfuel210,s_player_knockout,s_player_upgradegyro,ActionMenu,
	manatee_craft_menu,manatee_craft_menu_wea,manatee_craft_menu_sur,manatee_craft_menu_ind,s_player_craftZombieBaitBomb,horror_traders,s_player_takeOwnership,s_siphon,s_player_suicide,
	silver_myCursorTarget,stow_vehicle,menu_Worker2,neutral,menu_RU_Citizen1,menu_RU_Citizen4,menu_TK_CIV_Takistani04_EP1,menu_RU_Villager3,menu_RU_Functionary1,menu_Doctor,
	menu_Dr_Hladik_EP1,menu_Profiteer4,menu_Worker3,menu_Pilot_EP1,menu_RU_Citizen3,menu_CIV_EuroMan02_EP1,menu_Rita_Ensler_EP1,menu_RU_WorkWoman5,menu_RU_WorkWoman1,
	menu_Woodlander1,menu_Woodlander3,menu_Rocker4,menu_CIV_EuroMan01_EP1,Tow_settings_action_heliporter,Tow_settings_action_heliport_larguer,
	Tow_settings_action_deplacer_objet,Tow_settings_action_relacher_objet,Tow_settings_action_selectionner_objet_charge,Tow_settings_action_charger_selection,
	Tow_settings_action_charger_deplace,Tow_settings_action_selectionner_objet_remorque,Tow_settings_action_remorquer_selection,Tow_settings_action_remorquer_deplace,
	Tow_settings_action_detacher,Tow_settings_action_contenu_vehicule,Tow_settings_dlg_CV_titre,Tow_settings_dlg_CV_btn_decharger,Tow_settings_dlg_CV_btn_fermer,
	_heliporteur,s_player_makePLBomb,s_player_stats,s_player_deploybike,s_player_packbike,s_player_deploygyro,s_player_upgradebike,nul,
	s_player_equip_carry,s_player_showname,s_player_showname1,s_player_smeltItems,
	s_player_debug,s_player_calldog,s_player_speeddog,s_player_movedog,
	s_player_followdog,s_player_warndog,s_player_barkdog,s_player_trackdog,s_player_staydog,
	s_player_waterdog,s_player_feeddog,s_player_tamedog,s_player_repair_crtl,s_player_towing,
	s_player_fillgen,s_player_maint_build,s_player_fuelauto2,s_player_fuelauto,s_player_information,
	s_player_upgrade_build,s_player_packvault,s_player_unlockvault,s_player_checkGear,
	s_player_lockUnlock_crtl,s_player_deleteBuild,s_player_pzombiesfeed,s_player_pzombiesattack,
	s_player_pzombiesvision,s_player_callzombies,s_player_removeflare,s_player_fishing_veh,
	s_player_forceSave,s_player_fillfuel20,s_player_fillfuel5,s_player_lockvault,s_player_dragbody,
	s_player_packFdp,s_player_otkdv,s_player_isCruse,s_player_cnbb,bis_fnc_halo_action,
	s_player_rest,s_player_flipvehiclelight,s_player_flipvehicleheavy,s_player_1bupd,
	s_halo_action,s_player_smelt_scrapmetal,s_player_grabflare,s_player_fishing,
	s_player_smelt_engineparts,s_player_smelt_fueltank,s_player_smelt_windscreenglass,
	s_player_smelt_mainrotoraryparts,s_player_smelt_wheel,s_player_smelt_jerrycan,s_player_siphonfuel,
	s_player_flipveh,s_player_fillfuel,s_player_dropflare,s_player_butcher,s_player_cook,
	s_player_boil,s_player_fireout,s_player_packtent,s_player_sleep,s_player_studybody,
	NORRN_dropAction,s_player_selfBloodbag,s_clothes,s_player_holderPickup,s_player_gather,
	s_player_recipeMenu,s_player_deleteCamoNet,s_player_netCodeObject,s_player_codeRemoveNet,
	s_player_enterCode,s_player_codeObject,s_player_codeRemove,s_player_disarmBomb,
	unpackRavenAct,disassembleRavenAct,launchRavenAct,strobeRavenResetAct,strobeRavenTestAct,
	batteryLevelCheckRavenAct,batteryRechargeRavenAct,mavBaseStationActionName_00,mavBaseStationActionName_001,
	mavBaseStationActionName_01,mavBaseStationActionName_02,mavBaseStationActionName_03,mavBaseStationActionName_04,
	s_player_dance,s_player_igniteTent,s_player_clothes,
	STR_R3F_LOG_action_heliporter,STR_R3F_LOG_action_heliport_larguer,
	STR_R3F_LOG_action_relacher_objet,STR_R3F_LOG_action_deplacer_objet,STR_R3F_LOG_action_remorquer_deplace,
	STR_R3F_LOG_action_selectionner_objet_remorque,STR_R3F_LOG_action_detacher,STR_R3F_LOG_action_charger_deplace,
	STR_R3F_LOG_action_selectionner_objet_charge,STR_R3F_LOG_action_remorquer_selection,STR_R3F_LOG_action_charger_selection,
	STR_R3F_LOG_action_contenu_vehicule,STR_R3F_ARTY_action_ouvrir_dlg_SM
] + s_player_removeActions + s_player_repairActions + r_player_actions + r_player_actions2 + s_player_parts + s_player_combi + s_player_lockunlock)";
/* ********************************************************************************* */
/*  YOU CAN SETUP THE THREE(3) DIFFRENT ADMIN MENUS HERE  */
_ADMIN_GET_RIGHTS = {
// add_EXAMPLE    = 	[SuperAdmin,NormalAdmin,LowAdmin];
add_VehicleSpawnN =	[true,false,false];	// Vehicle Spawn
add_VehicleSpawnH = 	[true,false,false];	// Vehicle Spawn (Saves to Database)
add_BuildingsObjs = 	[true,false,false];	// Building & Object Spawn
add_WeaponsItems  =	[true,false,false];	// Weapon Spawn
add_Magazines     =	[true,false,false];	// Magazine Spawn
add_Playermorph   =	[true,false,false];	// Player Morphing

// add_EXAMPLE    = 	[SuperAdmin,NormalAdmin,LowAdmin];
add_SpawnBox      =	[true,false,false];	// Spawn Box
add_SpawnBoxEpoch =	[true,false,false];	// Spawn EpochBox

// add_EXAMPLE    = 	[SuperAdmin,NormalAdmin,LowAdmin];
add_ViewHackerLog =	[true,false,true];	// View Hackerlog
add_ViewSurveiLog =	[true,false,true];	// View Surveillancelog
add_ViewPlayerLog =	[true,false,false];	// View Playerlog
add_ViewTempBaLog =	[true,false,true];	// View TempBanlog
add_VieAdminLog   =	[true,false,false];	// View Adminlog
add_WeatherLordM  =	[true,false,false];	// WeatherLord Menu
add_TimeLordMenu  =	[true,false,false];	// TimeLord Menu

// add_EXAMPLE    = 	[SuperAdmin,NormalAdmin,LowAdmin];
add_TPplayerTome  = 	[true,false,false];	// Teleport Player To Me
add_TPmeTOplayer  = 	[true,false,false];	// Teleport Me To Player
add_ActiveMapTP   = 	[true,true,false];	// Activate Map Click to TP
add_ToggleTPdir   = 	[true,false,false];	// Toggle Keybind to Teleport in view direction
add_DisableAnnoun = 	[true,true,true];	// Disable Admin Announcements
add_FRCAM         = 	[true,true,false]; // FreeRoam Cam (RightClick to exit)
add_MapIcons      = 	[true,false,false];	// Map Icons
add_ESPIcons      = 	[true,true,false];	// ESP Icons

add_Loadoutmen    =  [true,false,false];	// Loadouts

// add_EXAMPLE    = 	[SuperAdmin,NormalAdmin,LowAdmin];
add_VehicleBoost  = 	[true,false,false];	// Vehicle Boost
add_CarGod        = 	[true,false,false];	// Car God
add_InfiniteAmmo  = 	[true,false,false];	// Infinite Ammo
add_FastFire      = 	[true,false,false];	// FastFire
add_LowerTerrain  = 	[true,false,false];	// Lower Terrain
add_GodMode       = 	[true,true,false];	// Godmode
add_NoZedAggro    = 	[true,true,false];	// No Zed Aggro
add_ZedShield     = 	[true,false,false];	// Zombieshield

// add_EXAMPLE    = 	[SuperAdmin,NormalAdmin,LowAdmin];
add_Stealth       = 	[true,true,false];	// Stealth
add_Debug         = 	[true,true,false];	// Debug
add_AdminScroll   = 	[true,true,false];	// Admin Scroll Menu
add_EpoDeathBoaLo = 	[true,false,true];	// EpochDeathBoard
add_ForceDisconn  = 	[true,false,true];	// Force Disconnect

// add_EXAMPLE    = 	[SuperAdmin,NormalAdmin,LowAdmin];
add_PlayerMarker  = 	[true,false,false];	// Player Marker
add_VehicleMarker = 	[true,false,false];	// Vehicle Marker
add_CorpseMarker  = 	[true,false,false];	// Corpse Marker
add_WreckMarker   = 	[true,false,false];	// Wreck Marker
add_TentMarker    = 	[true,false,false];	// Tent Marker
add_VaultMarker   = 	[true,false,false];	// Vault Marker

// add_EXAMPLE    = 	[SuperAdmin,NormalAdmin,LowAdmin];
add_MassMessage   = 	[true,false,true];	// Mass Message
add_ClearBanList  = 	[true,false,true];	// Clear Ban List
add_FixServersFPS = 	[true,false,true];	// Fix Servers FPS
add_DeleteBoxes   = 	[true,false,true];	// Delete Boxes
add_BypassANTITP  = 	[true,false,true];	// Bypass AntiTeleport (should not be needed)

// add_EXAMPLE    = 	[SuperAdmin,NormalAdmin,LowAdmin];
add_HealTarget    = 	[true,true,false];	// Heal Target
add_RepairVehicle = 	[true,true,false];	// Repair Vehicle
add_Humanity      = 	[true,false,false];	// Change Humanity Target
add_GiveAmmoTar   = 	[true,false,false];	// Give Ammo Target
add_joinveht      = 	[true,false,false];	// Join Target Vehicle
add_moveinveht    = 	[true,false,false];	// Move Target in my Vehicle
add_ejectveht     = 	[true,false,false];	// Eject Target from Vehicle

// add_EXAMPLE    = 	[SuperAdmin,NormalAdmin,LowAdmin];
add_BreakLegs     = 	[true,false,false];	// Break Legs Target
add_RemoveGear    = 	[true,false,false];	// Remove Gear Target
add_SlapTarget    = 	[true,false,false];	// Slap Target
add_KnockouTarget = 	[true,false,false];	// Knockout Target
add_SuicideTarget = 	[true,false,false];	// Suicide Target
add_KillTarget    = 	[true,false,false];	// Kill Target
add_ForceDiscoTar = 	[true,false,true];	// Force Disconnect Target
add_KickTarget    = 	[true,false,true];	// Kick Target
add_BanTarget     = 	[true,true,false];	// Ban Target
add_DrugTarget    = 	[true,false,false];	// Drug Target

// add_EXAMPLE    = 	[SuperAdmin,NormalAdmin,LowAdmin];
add_animate1      = 	[true,false,true];	// Keybind: Open/Unlock Door/Vehicle CursorTarget
add_animate2      = 	[true,false,true];	// Keybind: Close/Lock Door/Vehicle CursorTarget
add_genkey        = 	[true,false,true];	// Keybind: Generate Key CursorTarget
add_showid        = 	[true,false,true];	// Keybind: Show Lock Code CursorTarget
add_save          = 	[true,false,true];	// Keybind: Save CursorTarget
add_delete        = 	[true,false,true];	// Keybind: Delete CursorTarget
};
/* ********************************************************************************* */
/* *******************Developer : infiSTAR (infiSTAR23@gmail.com)******************* */
/* ********************Copr. ©2013 infiSTAR all rights reserved********************* */
/* *********************************www.infiSTAR.de********************************* */