#include "CfgLoot.hpp"

class CfgBuildingLoot {
	class Default {
		zombieChance = 0.2;
		minRoaming = 0;
		maxRoaming = 2;
		zombieClass[] = {"zZombie_Base","z_hunter","z_teacher","z_suit1","z_suit2","z_worker1","z_worker2","z_worker3","z_villager1","z_villager2","z_villager3"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {};
		hangPos[] = {};
		vehPos[] = {};
	};
	class Master {
		weapons[] = {"SMAW","Javelin","G36C","Stinger"};
	};
	class Church: Default {
		zombieChance = 0.3;
		minRoaming = 1;
		maxRoaming = 3;
		zombieClass[] = {"z_priest","z_priest","z_priest"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"ItemBandage","magazine",0.08},
			{"","food",0.12},
			{"","medical",0.05}
		};
	};
	class Residential: Default {
		zombieChance = 0.5;
		maxRoaming = 4;
		zombieClass[] = {"zZombie_Base","z_hunter","z_teacher","z_villager1","z_villager2","z_villager3"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"ItemSodaMdew","magazine",0.02},
			{"ItemSodaCoke","magazine",0.05},
			{"ItemSodaPepsi","magazine",0.04},
			{"ItemBandage","magazine",0.08},
			{"FoodCanBakedBeans","magazine",0.05},
			{"ItemWatch","generic",0.05},
			{"Makarov","weapon",0.04},
			{"Colt1911","weapon",0.04},
			{"ItemKnife","generic",0.07},
			{"ItemMatchbox","generic",0.06},
			{"LeeEnfield","weapon",0.03},
			{"revolver_EP1","weapon",0.04},
			{"DZ_Patrol_Pack_EP1","object",0.08}, //8
			{"DZ_Assault_Pack_EP1","object",0.04}, // 12
			{"DZ_British_ACU","object",0.05}, // 18
			{"DZ_Czech_Vest_Puch","object",0.05}, // 12-0
			{"DZ_ALICE_Pack_EP1","object",0.08}, // 16
			{"DZ_TK_Assault_Pack_EP1","object",0.5}, // 16
			{"Winchester1866","weapon",0.03},
			{"MeleeBaseBallBat","weapon",0.05},
			{"MeleeBaseBallBatNails","weapon",0.05},
			{"MeleeBaseBallBatBarbed","weapon",0.05},
			{"Crossbow_DZ","weapon",0.01},
			{"Binocular","weapon",0.06},
			{"PartWoodPile","magazine",0.03},
			{"Skin_TKCivil1_DZ","magazine",0.04},
			{"Skin_TKCivil2_DZ","magazine",0.05},
			{"Skin_Camo1_DZ","magazine",0.02},
			{"Skin_Soldier1_DZ","magazine",0.01},
			{"Skin_Officer1_DZ","magazine",0.03},
			{"Skin_Sniper1_DZ","magazine",0.01},
			{"Skin_Sniper2_DZ","magazine",0.01},
			{"Skin_TKSoldier1_DZ","magazine",0.02},
			{"WeaponHolder_ItemCrowbar","object",0.08},
			{"MR43","weapon",0.03},
			{"WeaponHolder_ItemFuelcan","object",0.03},
			//{"","craft",0.10},
			{"","food",0.20},
			//Unleashed
			{"kpfs_glock17","weapon",0.03},
			{"KPFS_P38","weapon",0.03},
			{"p226sf","weapon",0.03},
			{"KPFS_8Rnd_9x19_P1","magazine",0.04},
			{"17Rnd_9x19_glock17","magazine",0.04},
			{"15Rnd_9x19_LUGER","magazine",0.04},
			{"KPFS_8Rnd_762x25_TT33","magazine",0.04},
			//Unleashed end
			{"Chainsaw","weapon",0.01},
			{"CSGAS","magazine",0.4},
			{"","military",0.10},
			{"","generic",0.60}
		};
	};

		class Estate: Default {
		zombieChance = 0.4;
		maxRoaming = 4;
		zombieClass[] = {"zZombie_Base","z_hunter","z_teacher","z_villager1","z_villager2","z_villager3"};
		lootChance = 1;
		lootPos[] = {};		
		itemType[] =	{
			
			{"ItemWire","magazine",0.01},
			{"ItemTankTrap","magazine",0.04},
			{"ItemSodaMdew","magazine",0.01},
			{"ItemWatch","generic",0.05},
			{"ItemCompass","generic",0.05},
			{"Makarov","weapon",0.04},
			{"Colt1911","weapon",0.04},
			
			//Epoch Chainsaw
			{"Chainsaw","weapon",0.02},
			{"CSGAS","magazine",0.04},
			
			{"ItemBandage","magazine",0.08},
			//Unleashed
			{"kpfs_glock17","weapon",0.03},
			{"KPFS_P38","weapon",0.03},
			{"p226sf","weapon",0.03},
			{"KPFS_8Rnd_9x19_P1","magazine",0.04},
			{"17Rnd_9x19_glock17","magazine",0.04},
			{"15Rnd_9x19_LUGER","magazine",0.04},
			{"KPFS_KarS","weapon",0.03},
			{"KPFS_10Rnd_762x39_SKS","magazine",0.03},
			{"Skin_TKCivil1_DZ","magazine",0.04},
			{"Skin_TKCivil2_DZ","magazine",0.05},
			{"Skin_Camo1_DZ","magazine",0.02},
			{"Skin_Soldier1_DZ","magazine",0.01},
			{"Skin_Officer1_DZ","magazine",0.03},
			{"Skin_Sniper1_DZ","magazine",0.01},
			{"Skin_Sniper2_DZ","magazine",0.01},
			{"Skin_TKSoldier1_DZ","magazine",0.02},
			//Unleashed end
			
			{"ItemKnife","generic",0.07},
			{"ItemMatchbox","generic",0.06},
			{"LeeEnfield","weapon",0.03},
			{"revolver_EP1","weapon",0.04},
			{"DZ_ALICE_Pack_EP1","object",0.01}, // 16
			{"DZ_TK_Assault_Pack_EP1","object",0.02}, // 16
			{"Winchester1866","weapon",0.03},
			{"MeleeBaseBallBat","weapon",0.05},
			{"MeleeBaseBallBatNails","weapon",0.05},
			{"MeleeBaseBallBatBarbed","weapon",0.05},
			{"Crossbow_DZ","weapon",0.01},
			{"Binocular","weapon",0.06},
			{"PartWoodPile","magazine",0.06},
			{"Skin_Camo1_DZ","magazine",0.01},
			{"WeaponHolder_ItemCrowbar","object",0.08},
			{"MR43","weapon",0.03},
			{"ItemBookBible","magazine",0.02},
			{"","food",0.40},
			{"","military",0.15}
		};			
	};
	class Office: Residential {
		maxRoaming = 3;
		lootChance = 0.2;

		zombieClass[] = {"z_suit1","z_suit2"};
	};

	class Industrial: Default { //254
		zombieChance = 0.4;
		zombieClass[] = {"z_worker1","z_worker2","z_worker3"};
		maxRoaming = 2;
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"WeaponHolder_PartGeneric","object",0.07},
			{"WeaponHolder_PartWheel","object",0.05},
			{"ItemBandage","magazine",0.08},
			{"WeaponHolder_PartFueltank","object",0.03},
			{"WeaponHolder_PartEngine","object",0.03},
			{"WeaponHolder_PartGlass","object",0.04},
			{"WeaponHolder_PartVRotor","object",0.02},
			{"WeaponHolder_ItemJerrycan","object",0.04},
			{"WeaponHolder_ItemHatchet","object",0.05},
			{"WeaponHolder_ItemFuelcan","object",0.03},
			{"ItemKnife","military",0.03},
			{"ItemToolbox","weapon",0.06},
			{"ItemWire","magazine",0.01},
			{"ItemTankTrap","magazine",0.04},
            {"Skin_TKWorker1_DZ","magazine",0.01},
            {"Skin_TKWorker2_DZ","magazine",0.01},
			//{"","craft",0.10},
			{"","military",0.10},
			{"","generic",0.60}
		};
	};
	class InfectedCamps: Default { //5
		lootPos[] = {};
		lootType[] = {
			{"WeaponHolder_PartGeneric","object",0.04},
			{"WeaponHolder_PartWheel","object",0.02},
			{"WeaponHolder_PartFueltank","object",0.02},
			{"WeaponHolder_PartEngine","object",0.02},
			{"WeaponHolder_ItemFuelcan","object",0.03},
			{"ItemWire","magazine",0.01},
			{"ItemTankTrap","magazine",0.04},
			{"ItemSodaMdew","magazine",0.01},
			
			{"ItemWatch","generic",0.05},
			{"ItemCompass","generic",0.05},
			{"Makarov","weapon",0.04},
			{"Colt1911","weapon",0.04},
			{"Chainsaw","weapon",0.05},
			{"CSGAS","magazine",0.02},
			{"","food",0.40},
			//Unleashed
			{"kpfs_glock17","weapon",0.03},
			{"KPFS_P38","weapon",0.03},
			{"p226sf","weapon",0.03},
			{"KPFS_8Rnd_9x19_P1","magazine",0.04},
			{"17Rnd_9x19_glock17","magazine",0.04},
			{"15Rnd_9x19_LUGER","magazine",0.04},
			{"KPFS_10Rnd_762x39_SKS","magazine",0.03},
			{"Skin_Camo1_DZ","magazine",0.01},
			{"Skin_Soldier1_DZ","magazine",0.01},
			{"Skin_Officer1_DZ","magazine",0.01},
			{"Skin_Sniper1_DZ","magazine",0.01},
			{"Skin_Sniper2_DZ","magazine",0.01},
			{"Skin_TKSoldier1_DZ","magazine",0.01},
			//Unleashed end
			{"KPFS_KarS","weapon",0.03},
			{"KPFS_M1_Carbine","weapon",0.03},
			{"KPFS_M1_Garand","weapon",0.03},
			{"KPFS_M1_Thompson","weapon",0.03},
			{"KPFS_M1_Garand_M84","weapon",0.03},
			{"kpfs_8Rnd_765x17","magazine",0.02},
			{"KPFS_5Rnd_762x54_Mosin","magazine",0.02},
			{"KPFS_15Rnd_cal30_Carbine","magazine",0.02},
			{"KPFS_8Rnd_cal30_60_Gar","magazine",0.02},
			{"KPFS_30Rnd_45ACP_Thompson","magazine",0.02},
			{"KPFS_MP44","weapon",0.03},
			{"KPFS_P220","weapon",0.02},
			{"KPFS_P225","weapon",0.02},
			{"KPFS_P226","weapon",0.02},
			{"KPfs_glock17","weapon",0.03},
			{"KPFS_P88","weapon",0.03},
			{"KPFS_P99QA","weapon",0.01},
			{"KPFS_HKP30","weapon",0.01},
			{"KPFS_P2000","weapon",0.01},
			{"KPFS_MP5A3","weapon",0.03},
			{"KPFS_P1","weapon",0.03},
			{"KPFS_P12","weapon",0.03},
			{"KPfs_g36a1","weapon",0.03},
			{"KPfs_g36a2","weapon",0.01},
			{"KPfs_g36a4","weapon",0.01},
			{"KPFS_Makarov","weapon",0.03},
			{"KPFS_MPi_KM_72","weapon",0.02},
			{"KPFS_MPi_KMS_72","weapon",0.01},
			{"KPFS_MPi_AK_74","weapon",0.05},
			{"KPFS_MPi_AKS_74","weapon",0.02},
			{"KPFS_MPi_AKS_74K","weapon",0.02},
			{"KPFS_MPi_KMKIX","weapon",0.03},
			{"DZ_British_ACU","object",0.05}, // 18
			{"ItemBandage","magazine",0.08},
			{"ItemKnife","generic",0.07},
			{"ItemMatchbox","generic",0.06},
			{"LeeEnfield","weapon",0.03},
			{"revolver_EP1","weapon",0.04},
			{"DZ_ALICE_Pack_EP1","object",0.01}, // 16
			{"DZ_TK_Assault_Pack_EP1","object",0.02}, // 16
			{"Winchester1866","weapon",0.03},
			{"MeleeBaseBallBat","weapon",0.05},
			{"MeleeBaseBallBatNails","weapon",0.05},
			{"MeleeBaseBallBatBarbed","weapon",0.05},
			{"Crossbow_DZ","weapon",0.01},
			{"Binocular","weapon",0.06},
			{"PartWoodPile","magazine",0.03},
			{"Skin_Camo1_DZ","magazine",0.01},
			{"WeaponHolder_ItemCrowbar","object",0.08},
			{"MR43","weapon",0.03},
			{"ItemBookBible","magazine",0.02},
			{"WeaponHolder_ItemFuelcan","object",0.03},
			//
			/*
			{"Blueprint_NailedBaseballBat","weapon",0.01},
			{"Blueprint_BaseBallBatBarbed","weapon",0.01},
			{"Blueprint_M9SD","weapon",0.01},
			{"Blueprint_M4A1_AIM","weapon",0.01},
			{"Blueprint_MAKAROVSD","weapon",0.01},
			{"Blueprint_bizonSD","weapon",0.01},
			{"Blueprint_SVD_CAMO","weapon",0.01},
			{"Blueprint_M4A1_Aim_CAMO","weapon",0.01},
			{"Blueprint_M4A1_HWS_GL_CAMO","weapon",0.01},
			{"Blueprint_G36C_camo","weapon",0.01},
			{"Blueprint_G36A_camo","weapon",0.01},
			{"Blueprint_G36K_camo","weapon",0.01},
			{"Blueprint_Bandage","weapon",0.01},
			{"Blueprint_Compass","weapon",0.01},
			//
			*/
			//{"","craft",0.10},
			{"","military",0.10},
			{"","generic",0.60}
		};
	};
	class Farm: Default {
		zombieChance = 0.5;
		maxRoaming = 3;
		zombieClass[] = {"zZombie_Base","z_hunter","z_hunter","z_hunter","z_villager1","z_villager2","z_villager3"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] =	{
			{"WeaponHolder_ItemJerrycan","object",0.03},
			{"huntingrifle","weapon",0.02},
			{"LeeEnfield","weapon",0.03},
			{"Winchester1866","weapon",0.03},
			{"Crossbow_DZ","weapon",0.03},
			{"PartWoodPile","magazine",0.08},
			{"WeaponHolder_ItemHatchet","object",0.05},
			{"MR43","weapon",0.01},
			{"MeleeMachete","weapon",0.04},
			{"MeleeBaseBallBat","weapon",0.05},
			{"MeleeBaseBallBatNails","weapon",0.05},
			{"MeleeBaseBallBatBarbed","weapon",0.05},
			//{"","craft",0.10},
			{"DZ_British_ACU","object",0.05}, // 18
			//Unleashed
			{"KPFS_MPi_KM_72","weapon",0.02},
			{"KPFS_MPi_AK_74","weapon",0.02},
			{"KPFS_KarS","weapon",0.02},
			{"KPFS_10Rnd_762x39_SKS","magazine",0.03},
			//Unleashed end
			{"Chainsaw","weapon",0.05},
			{"CSGAS","magazine",0.09},
			{"ItemBandage","magazine",0.08},
			{"","military",0.10},
			{"","generic",0.60}
		};
	};
	class Supermarket: Default {
		lootChance = 0.4;
		minRoaming = 2;
		maxRoaming = 6;
		zombieChance = 1;
		zombieClass[] = {"zZombie_Base","zZombie_Base","z_teacher","z_suit1","z_suit2"};
		lootType[] = {
			{"ItemWatch","generic",0.05},
			{"Makarov","weapon",0.02},
			{"Colt1911","weapon",0.02},
			{"ItemFlashlight","generic",0.05},
			{"ItemKnife","generic",0.02},
			{"ItemMatchbox","generic",0.05},
			{"LeeEnfield","weapon",0.01},
			{"revolver_EP1","weapon",0.01},
			{"DZ_Patrol_Pack_EP1","object",0.05}, //12
			{"DZ_Assault_Pack_EP1","object",0.04}, // 12
			{"DZ_Czech_Vest_Puch","object",0.03}, // 12-0
			{"DZ_ALICE_Pack_EP1","object",0.02}, // 16
			{"DZ_TK_Assault_Pack_EP1","object",0.02}, // 16
			{"Winchester1866","weapon",0.03},
			{"Crossbow_DZ","weapon",0.01},
			{"Binocular","weapon",0.03},
			{"PartWoodPile","magazine",0.04},
			{"MR43","weapon", 0.01},
			{"","food",0.17},
			//{"","craft",0.10},
			{"DZ_British_ACU","object",0.05}, // 18
			{"ItemBandage","magazine",0.08},
			//Unleashed
			{"kpfs_glock17","weapon",0.03},
			{"KPFS_P38","weapon",0.03},
			{"KPFS_8Rnd_9x19_P1","magazine",0.04},
			{"17Rnd_9x19_glock17","magazine",0.04},
			{"15Rnd_9x19_LUGER","magazine",0.04},
			{"p226sf","weapon",0.03},
			{"KPFS_KarS","weapon",0.02},
			{"KPFS_10Rnd_762x39_SKS","magazine",0.03},
			{"DZ_GunBag_EP1","object",0.01},
			//Unleashed end
			{"","military",0.03},
			{"","generic",0.60}
		};
	};
	class HeliCrash: Default {
		zombieChance = 0.4;
		maxRoaming = 2;
		zombieClass[] = {"z_soldier_pilot"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"KPFS_8Rnd_762x25_TT33","magazine",0.04},
			{"KPFS_TT33","weapon",0.05},
			{"sg550_sniper","weapon",0.03},
			{"sg550_commando_hensoldt","weapon",0.03},
			{"sg551_lg97","weapon",0.05},
			{"sg551_acog","weapon",0.03},
			{"sg551_acog_lg97","weapon",0.03},
			{"sg551_commando_acog","weapon",0.01},
			{"sg552sd_reflex","weapon",0.05},
			{"sg552_commando_mg","weapon",0.05},
			{"sg552_commando_mg_eotech","weapon",0.05},
			{"sg552_commando_sd","weapon",0.03},
			{"sg552_mp_aimpoint_sd","weapon",0.03},
			{"sg552lb_commando_reflex","weapon",0.05},
			{"sg552lb_commando_acog","weapon",0.03},
			{"sg552lb","weapon",0.05},
			{"sg552lb_acog","weapon",0.03},
			{"sg552lb_aimpoint","weapon",0.05},
			{"p226_sd","weapon",0.05},
			{"p226sf","weapon",0.05},
			{"p226sf_sd","weapon",0.05},
			{"hecate2","weapon",0.02},
			//{"trg42","weapon",0.05},
			//{"trg42_t8m","weapon",0.05},
			//{"trg42_camo","weapon",0.05},
			//{"trg42_t8m_camo","weapon",0.05},
			{"KPFS_M1_Thompson","weapon",0.03},
			{"KPFS_M1_Garand_M84","weapon",0.03},
			{"kpfs_8Rnd_765x17","magazine",0.02},
			{"KPFS_30Rnd_45ACP_Thompson","magazine",0.02},
			{"LEN_L119A1_Acog_PF_W","weapon",0.03},
			{"LEN_L119A1_Acog_PF_SD_W","weapon",0.03},
			{"LEN_L119A1_Acog_CQB_SD_W","weapon",0.02},
			{"LEN_L119A1_Acog_CQB_SD_HG_W","weapon",0.01},
			{"LEN_L119A1_Acog_UGL_PF_W","weapon",0.02},
			{"LEN_L119A1_Acog_PF_SD","weapon",0.03},
			{"LEN_L119A1_Acog_CQB_SD","weapon",0.02},
			{"LEN_L119A1_Acog_CQB_SD_HG","weapon",0.01},
			{"LEN_L119A1_Acog_UGL_PF","weapon",0.02},
			{"LEN_L119A1_EOT_CQB_SD_W","weapon",0.02},
			{"LEN_L119A1_EOT_CQB_SD","weapon",0.02},
			{"LEN_L119A1_EOT_PF","weapon",0.03},
			{"LEN_L119A1_EOT_PF_SD","weapon",0.02},
			{"LEN_L119A1_EOT_UGL_PF","weapon",0.03},
			{"LEN_L119A1_Elcan_PF","weapon",0.02},
			{"LEN_L119A1_Elcan_PF_SD","weapon",0.02},
			{"LEN_L119A1_Elcan_UGL_PF","weapon",0.02},
			{"sg550_lg97_aimpoint","weapon",0.05},
			{"sg550_lg97_aimpoint_camo","weapon",0.05},
			{"sg551_commando_lg97_aim","weapon",0.05},
			{"sg551_commando_lg97_aim_camo","weapon",0.05},
			{"sg551_commando_lg97_acog","weapon",0.02},
			//{"sapr_hensoldt","weapon",0.05},
			//{"sapr_hensoldt_sd","weapon",0.02},
			//{"sapr_aimpoint","weapon",0.05},
			//{"sapr_aimpoint_sd","weapon",0.05},
			{"M249_DZ","weapon",0.04},
			{"MedBox0","object",0.05},
			{"AmmoBoxSmall_556","object",0.05},
			{"AmmoBoxSmall_762","object",0.05},
            {"Skin_Camo1_DZ","magazine",0.03},
            {"Skin_Soldier1_DZ","magazine",0.03},
            {"Skin_Officer1_DZ","magazine",0.03},
            {"Skin_Sniper1_DZ","magazine",0.01},
            {"Skin_Sniper2_DZ","magazine",0.01},
            {"Skin_TKSoldier1_DZ","magazine",0.01},
			{"SCAR_L_CQC_CCO_SD","weapon",0.02},
			{"SCAR_L_CQC","weapon",0.02},    
			{"SCAR_L_CQC_Holo","weapon",0.02}, 
			{"SCAR_L_CQC_EGLM_Holo","weapon",0.02},
			{"SCAR_L_STD_EGLM_RCO","weapon",0.02},
			{"SCAR_L_STD_HOLO","weapon",0.02},
			{"SCAR_L_STD_Mk4CQT","weapon",0.02},
			{"SCAR_H_CQC_CCO","weapon",0.02},
			{"SCAR_H_CQC_CCO_SD","weapon",0.02},
			{"SCAR_H_STD_EGLM_Spect","weapon",0.02},
			{"SCAR_H_LNG_Sniper","weapon",0.01},
			{"20Rnd_762x51_B_SCAR","magazine",0.02},
			{"20Rnd_762x51_SB_SCAR","magazine",0.02},
			{"Chainsaw","weapon",0.03},
			{"CSGAS","magazine",0.02},	
			{"ItemBandage","magazine",0.06},
			//Unleashed
			{"KPFS_MP44","weapon",0.03},
			{"KPFS_P99QA","weapon",0.03},
			{"KPFS_MP2","weapon",0.03},
			{"kpfs_g3a2","weapon",0.02},
			{"sg550_lg97_aimpoint_camo","weapon",0.02},
			{"KPFS_16Rnd_9x19_para","magazine",0.03},
			{"KPFS_30Rnd_762x43_STG44","magazine",0.03},
			{"KPFS_32Rnd_MP2","magazine",0.03},
			{"30Rnd_56x45_GP90","magazine",0.03},
			{"DZ_GunBag_EP1","object",0.03},
			{"DZ_LargeGunBag_EP1","object",0.02},
			//Unleashed end			
			//{"G36_C_SD_camo","weapon",0.01},
			{"G36A_camo","weapon",0.03},
			{"G36K_camo","weapon",0.03},
			{"100Rnd_762x54_PK","magazine",0.05},
			{"","military",0.80},
			{"","medical",0.60}
		};
	};	
	class HeliCrashWEST: Default {
		zombieChance = 0.4;
		maxRoaming = 2;
		zombieClass[] = {"z_soldier_pilot"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"FN_FAL","weapon",0.04},
			{"M249_DZ","weapon",0.04},
			{"BAF_L85A2_RIS_Holo","weapon",0.03},
			{"MedBox0","object",0.05},
			{"NVGoggles","weapon",0.01},
			{"AmmoBoxSmall_556","object",0.05},
            {"Skin_Sniper1_DZ","magazine",0.08},
            {"Skin_Sniper2_DZ","magazine",0.04},
            {"Skin_TKSoldier1_DZ","magazine",0.07},
			{"G36C","weapon",0.03},
			{"G36C_camo","weapon",0.03},
			
			//Unleashed
			{"KPFS_MP44","weapon",0.03},
			{"KPFS_P99QA","weapon",0.03},
			{"KPFS_MP2","weapon",0.03},
			{"kpfs_g3a2","weapon",0.02},
			{"sg550_lg97_aimpoint_camo","weapon",0.02},
			{"KPFS_16Rnd_9x19_para","magazine",0.03},
			{"KPFS_30Rnd_762x43_STG44","magazine",0.03},
			{"KPFS_32Rnd_MP2","magazine",0.03},
			{"30Rnd_56x45_GP90","magazine",0.03},
			{"DZ_GunBag_EP1","object",0.01},
			{"DZ_LargeGunBag_EP1","object",0.02},
			//Unleashed end
			
			//{"G36_C_SD_camo","weapon",0.01},
			{"G36A_camo","weapon",0.03},
			{"G36K_camo","weapon",0.03},
			{"","military",1.00},
			{"","medical",0.5}
		};
	};
	class HeliCrashEAST: Default {
		zombieChance = 0.5;
		maxRoaming = 8;
		zombieClass[] = {"z_soldier_pilot"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
		
			{"AK_47_M","weapon",0.03}, 
			{"AKS_74_U","weapon",0.03}, 
			{"M14_EP1","weapon",0.02},
			{"bizon_silenced","weapon",0.04},
			{"RPK_74","weapon",0.02}, 
			{"Binocular","weapon",0.01},
			{"ItemKnife","militaryEAST",0.03},
			{"","militaryEAST",0.10}, 
			
			//Unleashed
			{"KPFS_MP44","weapon",0.03},
			{"KPFS_P99QA","weapon",0.03},
			{"KPFS_MP2","weapon",0.03},
			{"kpfs_g3a2","weapon",0.02},
			{"sg550_lg97_aimpoint_camo","weapon",0.02},
			{"KPFS_16Rnd_9x19_para","magazine",0.03},
			{"KPFS_30Rnd_762x43_STG44","magazine",0.03},
			{"KPFS_32Rnd_MP2","magazine",0.03},
			{"30Rnd_56x45_GP90","magazine",0.03},
			{"DZ_GunBag_EP1","object",0.01},
			{"DZ_LargeGunBag_EP1","object",0.01},
			//Unleashed end
			
			{"ItemCompass","militaryEAST",0.04},
			{"AmmoBoxSmall_762","object",0.3},
			{"WeaponHolder_PartVRotor","object",0.02},
			{"100Rnd_762x54_PK","magazine",0.01},
			{"","military",1.00},
			{"","medical",0.5}
		};
	};
	class Hospital: Default {
		zombieChance = 0.4;
		minRoaming = 2;
		maxRoaming = 6;
		zombieClass[] = {"z_doctor","z_doctor","z_doctor"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"","hospital",0.5},
			{"MedBox0","object",0.03}
		};
	};
	class Military: Default {
		zombieChance = 0.3;
		maxRoaming = 6;
		zombieClass[] = {"z_soldier","z_soldier_heavy","z_policeman"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"20Rnd_56x45_GP90","magazine",0.02},
			{"30Rnd_56x45_GP90","magazine",0.02},
			{"30Rnd_56x45SD_GP90","magazine",0.02},
			{"100Rnd_56x45_GP90","magazine",0.02},
			{"200Rnd_56x45_GP90","magazine",0.02},
			{"120Rnd_75x55_GP11","magazine",0.02},
			{"20Rnd_762x55_SWISS_P_AP","magazine",0.02},
			{"7Rnd_127x99_HE","magazine",0.02},
			{"7Rnd_127x99_AP","magazine",0.02},
			{"9Rnd_9x19_LUGER","magazine",0.02},
			{"15Rnd_9x19_LUGER","magazine",0.02},
			{"15Rnd_9x19sd_LUGER","magazine",0.02},
			{"30Rnd_9x19_LUGER","magazine",0.02},
			{"30Rnd_9x19sd_LUGER","magazine",0.02},
			//{"GrenadeHandTimedWest","magazine",0.02},
			{"G_40mm_HE","magazine",0.02},
			//{"HandGrenade_dm41","magazine",0.02},
			{"KPFS_8Rnd_9x19_P1","magazine",0.02},
			{"KPFS_30Rnd_762x43_STG44","magazine",0.02},
			{"20Rnd_762x51_FNFAL","magazine",0.02},
			{"30Rnd_762x39_AK47","magazine",0.02},
			{"KPFS_120Rnd_MG1","magazine",0.02},
			{"KPFS_100Rnd_762x39_RPD","magazine",0.02},
			{"KPFS_10Rnd_762x39_SKS","magazine",0.02},
			{"KPFS_PZF60_Heat","magazine",0.02},
			{"KPFS_8Rnd_762x25_TT33","magazine",0.02},
			{"KPFS_12Rnd_45ACP_P12","magazine",0.02},
			{"30Rnd_556x45_G36","magazine",0.02},
			{"30Rnd_556x45_Stanag","magazine",0.02},
			{"SCAR_L_CQC","weapon",0.02},    
			{"SCAR_L_CQC_Holo","weapon",0.02}, 
			{"SCAR_L_CQC_EGLM_Holo","weapon",0.02},
			{"SCAR_L_STD_HOLO","weapon",0.02},
			{"SCAR_L_STD_Mk4CQT","weapon",0.02},
			{"20Rnd_762x51_B_SCAR","magazine",0.02},
			{"20Rnd_762x51_SB_SCAR","magazine",0.02},
			{"KPFS_32Rnd_MP2","magazine",0.02},
			{"8Rnd_9x18_Makarov","magazine",0.02},
			{"30Rnd_545x39_AK","magazine",0.02},
			{"KPFS_25Rnd_pm","magazine",0.02},
			{"KPFS_10Rnd_PSL","magazine",0.02},
			{"Chainsaw","weapon",0.01},
			{"CSGAS","magazine",0.04},	
			 
						   
			//magazines            
			{"sg550","weapon",0.03},
			{"sg550_kern","weapon",0.01},
			{"sg551","weapon",0.01},
			{"sg551_lg97","weapon",0.01},
			{"sg552","weapon",0.03},

			{"sg552_mp_aimpoint","weapon",0.02},
			{"sg552_mp_aimpoint_sd","weapon",0.01},
			{"sg552lb","weapon",0.03},
			{"sg552lb_commando_reflex","weapon",0.03},
			{"sg552lb_commando_acog","weapon",0.01},
			{"sg552lb_aimpoint","weapon",0.03},
			{"sg552lb_acog","weapon",0.01},
			//{"sapr_hensoldt","weapon",0.03},
			//{"sapr_aimpoint","weapon",0.03},
			{"p220","weapon",0.03},
			{"p226","weapon",0.03},

			{"p226sf","weapon",0.03},

			{"KPFS_Sauer_38h","weapon",0.03},
			{"KPFS_Mauser_Hsc","weapon",0.03},
			{"KPFS_Walther_PP","weapon",0.03},
			{"KPFS_Mosin_Nagant","weapon",0.03},
			{"KPFS_PPSh","weapon",0.03},
			{"KPFS_M1_Carbine","weapon",0.03},
			{"KPFS_M1_Garand","weapon",0.03},
			{"KPFS_M1_Thompson","weapon",0.03},
			{"KPFS_M1_Garand_M84","weapon",0.03},
			{"kpfs_8Rnd_765x17","magazine",0.02},
			{"KPFS_5Rnd_762x54_Mosin","magazine",0.02},
			{"KPFS_15Rnd_cal30_Carbine","magazine",0.02},
			{"KPFS_8Rnd_cal30_60_Gar","magazine",0.02},
			{"KPFS_30Rnd_45ACP_Thompson","magazine",0.02},

			{"LEN_L119A1_EOT_CQB_D","weapon",0.03},
			{"LEN_L119A1_EOT_CQB_W","weapon",0.03},
			{"LEN_L119A1_EOT_CQB","weapon",0.03},

			{"MP5K","weapon",0.03},
			{"MP5A5n","weapon",0.03},
			{"MP5A5_REFLEX","weapon",0.03},
			{"MP5A5_AIMPOINT","weapon",0.03},
			{"MP5A5_ACOG","weapon",0.01},
			{"MP5SD6","weapon",0.03},
			{"MP5SD6_REFLEX","weapon",0.03},
			{"MP5SD6_AIMPOINT","weapon",0.03},
			{"MP5SD6_ACOG","weapon",0.01},
			{"KPFS_P38","weapon",0.02},
			{"KPFS_TT33","weapon",0.01},
			{"KPFS_MP2","weapon",0.03},
			{"KPFS_KarS","weapon",0.02},
			{"KPFS_MP44","weapon",0.03},
			{"KPFS_P220","weapon",0.02},
			{"KPFS_P225","weapon",0.02},
			{"KPFS_P226","weapon",0.02},
			{"KPfs_glock17","weapon",0.03},
			{"KPFS_P88","weapon",0.03},
			{"KPFS_P99QA","weapon",0.01},
			{"KPFS_HKP30","weapon",0.01},
			{"KPFS_P2000","weapon",0.03},
			{"KPFS_MP5A3","weapon",0.03},
			{"KPFS_P1","weapon",0.03},
			{"KPFS_P12","weapon",0.03},
			{"KPfs_g36a1","weapon",0.03},
			{"KPfs_g36a2","weapon",0.03},
			{"KPfs_g36a4","weapon",0.03},
			{"KPfs_g36k","weapon",0.03},
			{"KPfs_g36ksk","weapon",0.03},
			{"KPFS_Makarov","weapon",0.03},
			{"KPFS_MPi_KM_72","weapon",0.03},
			{"KPFS_MPi_KMS_72","weapon",0.03},
			{"KPFS_MPi_AK_74","weapon",0.03},
			{"KPFS_MPi_AKS_74","weapon",0.03},
			{"KPFS_MPi_AKS_74K","weapon",0.03},
			{"KPFS_MPi_KMKIX","weapon",0.03},
			{"KPFS_PM63","weapon",0.03},
			{"KPFS_PSL","weapon",0.03},
			{"KPFS_KarS","weapon",0.03},
			{"KPFS_8Rnd_762x25_TT33","magazine",0.04},
			{"M9","weapon",0.05},
			{"M16A2","weapon",0.05},
			{"M16A2GL","weapon",0.02},
			{"AK_74","weapon",0.06},
			{"M4A1_Aim","weapon",0.03},
			{"AKS_74_kobra","weapon",0.06},
			{"AKS_74_U","weapon",0.04},
			{"AK_47_M","weapon",0.04},
			{"M1014","weapon",0.06},
			{"M4A1","weapon",0.04},
			
			{"ItemBandage","magazine",0.05},
			//Unleashed
			{"KPFS_G1","weapon",0.03},
			{"KPFS_G36A2","weapon",0.03},
			{"KPFS_MPi_KM_72","weapon",0.03},
			{"KPFS_MPi_AK_74","weapon",0.02},
			{"20Rnd_762x51_FNFAL","magazine",0.03},
			{"DZ_GunBag_EP1","object",0.04},
            {"Skin_Camo1_DZ","magazine",0.03},
            {"Skin_Soldier1_DZ","magazine",0.03},
            {"Skin_Officer1_DZ","magazine",0.03},
            {"Skin_Sniper1_DZ","magazine",0.01},
            {"Skin_Sniper2_DZ","magazine",0.01},
            {"Skin_TKSoldier1_DZ","magazine",0.01},
			//Unleashed end
			
			{"UZI_EP1","weapon",0.05},
			{"Remington870_lamp","weapon",0.05},
			{"glock17_EP1","weapon",0.08},
			{"MP5A5","weapon",0.04},
			{"MP5SD","weapon",0.01},
			{"M4A3_CCO_EP1","weapon",0.02},
			{"Binocular","weapon",0.05},
			{"ItemFlashlightRed","military",0.06},
			{"ItemKnife","military",0.06},
			{"DZ_British_ACU","object",0.05}, // 18
			{"DZ_CivilBackpack_EP1","object",0.03}, // 24			
			{"ItemEtool","weapon",0.03},
			{"ItemSandbag","magazine",0.04},
			//{"","craft",0.10},
			{"","military",0.70},
			{"","food",0.20}
		};
	};
	class MilitarySpecial: Default {
		zombieChance = 0.8;
		minRoaming = 2;
		maxRoaming = 6;
		zombieClass[] = {"z_soldier_heavy"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
		{"20Rnd_56x45_GP90","magazine",0.02},
			{"30Rnd_56x45_GP90","magazine",0.02},
			{"30Rnd_56x45SD_GP90","magazine",0.02},
			{"100Rnd_56x45_GP90","magazine",0.02},
			{"200Rnd_56x45_GP90","magazine",0.02},
			{"120Rnd_75x55_GP11","magazine",0.02},
			{"20Rnd_762x55_SWISS_P_AP","magazine",0.02},
			{"20Rnd_762x55_SWISS_P_SD","magazine",0.02},
			{"10Rnd_86x70_LAPUA","magazine",0.02},
			{"10Rnd_86x70SD_LAPUA","magazine",0.02},
			{"7Rnd_127x99_HE","magazine",0.02},
			{"7Rnd_127x99_AP","magazine",0.02},
			{"9Rnd_9x19_LUGER","magazine",0.02},
			{"15Rnd_9x19_LUGER","magazine",0.02},
			{"15Rnd_9x19sd_LUGER","magazine",0.02},
			{"30Rnd_9x19_LUGER","magazine",0.02},
			{"30Rnd_9x19sd_LUGER","magazine",0.02},
			//{"GrenadeHandTimedWest","magazine",0.02},
			{"G_40mm_HE","magazine",0.02},
			//{"Mine_DM11","magazine",0.02},
			//{"HandGrenade_dm41","magazine",0.02},
			{"KPFS_8Rnd_9x19_P1","magazine",0.02},
			{"KPFS_30Rnd_762x43_STG44","magazine",0.02},
			{"20Rnd_762x51_FNFAL","magazine",0.02},
			{"KPFS_32Rnd_MP2","magazine",0.02},
			{"20Rnd_762x51_DMR","magazine",0.01},
			{"30Rnd_762x39_AK47","magazine",0.02},
			{"KPFS_120Rnd_MG1","magazine",0.02},
			{"KPFS_100Rnd_762x39_RPD","magazine",0.02},
			{"KPFS_10Rnd_762x39_SKS","magazine",0.02},
			{"KPFS_PZF60_Heat","magazine",0.02},
			{"KPFS_8Rnd_762x25_TT33","magazine",0.02},
			{"KPFS_12Rnd_45ACP_P12","magazine",0.02},
			{"KPFS_12Rnd_45ACP_P12SD","magazine",0.02},
			{"30Rnd_556x45_G36","magazine",0.02},
			{"30Rnd_556x45_Stanag","magazine",0.02},
			{"KPFS_120Rnd_MG1","magazine",0.02},
			{"KPFS_32Rnd_MP2","magazine",0.02},
			{"30Rnd_9x19_MP5","magazine",0.02},
			{"30Rnd_9x19_MP5SD","magazine",0.02},
			{"8Rnd_9x18_Makarov","magazine",0.02},
			{"KPFS_30Rnd_762x43_STG44","magazine",0.02},
			{"30Rnd_545x39_AK","magazine",0.02},
			{"KPFS_25Rnd_pm","magazine",0.02},
			{"KPFS_10Rnd_PSL","magazine",0.02},
			{"KPFS_100Rnd_762x39_RPD","magazine",0.02},
			{"KPFS_10Rnd_762x39_SKS","magazine",0.02},
			{"SCAR_L_CQC_CCO_SD","weapon",0.02},
			{"SCAR_L_STD_EGLM_RCO","weapon",0.02},
			{"SCAR_L_STD_Mk4CQT","weapon",0.02},
			{"SCAR_H_CQC_CCO","weapon",0.03},
			{"SCAR_H_CQC_CCO_SD","weapon",0.02},
			{"SCAR_H_LNG_Sniper","weapon",0.01},
			{"20Rnd_762x51_B_SCAR","magazine",0.02},
			{"20Rnd_762x51_SB_SCAR","magazine",0.02},
			{"ItemBandage","magazine",0.05},
			{"Chainsaw","weapon",0.03},
			{"CSGAS","magazine",0.02},	   
			//magazines            
			{"sg550","weapon",0.03},
			{"sg550_kern","weapon",0.03},
			{"sg550_lg97","weapon",0.03},
			{"sg550_lg97_aimpoint","weapon",0.03},
			{"sg550_lg97_aimpoint_camo","weapon",0.03},
			{"sg550_sniper","weapon",0.01},
			{"sg551","weapon",0.03},
			{"sg551_lg97","weapon",0.03},
			{"sg551_acog","weapon",0.01},
			{"sg551_acog_lg97","weapon",0.01},
			{"sg551_COMMANDO_LG97_AIM_CAMO","weapon",0.03},
			{"sg551_commando_aim","weapon",0.03},
			{"sg551_commando_lg97_aim","weapon",0.03},
			{"sg552","weapon",0.03},
			{"sg552_reflex","weapon",0.03},
			{"sg552sd_reflex","weapon",0.01},
			{"sg552_commando","weapon",0.03},
			{"sg552_commando_sd","weapon",0.01},
			{"sg552_commando_mg","weapon",0.01},
			{"sg552_commando_mg_eotech","weapon",0.03},
			{"sg552_mp_aimpoint","weapon",0.03},
			{"sg552_mp_aimpoint_sd","weapon",0.01},
			{"sg552lb","weapon",0.03},
			{"sg552lb_commando_reflex","weapon",0.03},
			{"sg552lb_aimpoint","weapon",0.03},
			{"sg552lb_acog","weapon",0.01},
			//{"sapr_hensoldt","weapon",0.03},
			//{"sapr_hensoldt_sd","weapon",0.01},
			//{"sapr_aimpoint","weapon",0.03},
			//{"sapr_aimpoint_sd","weapon",0.01},
			//{"trg42","weapon",0.03},
			//{"trg42_t8m","weapon",0.03},
			//{"trg42_camo","weapon",0.03},
			//{"trg42_t8m_camo","weapon",0.03},
			{"KPFS_Sauer_38h","weapon",0.03},
			{"KPFS_Mauser_Hsc","weapon",0.03},
			{"KPFS_Walther_PP","weapon",0.03},
			{"KPFS_Mosin_Nagant","weapon",0.03},
			{"KPFS_Mosin_Nagant_PU","weapon",0.03},
			{"KPFS_PPSh","weapon",0.03},
			{"KPFS_M1_Carbine","weapon",0.03},
			{"KPFS_M1_Garand","weapon",0.03},
			{"KPFS_M1_Thompson","weapon",0.03},
			{"KPFS_M1_Garand_M84","weapon",0.03},
			{"kpfs_8Rnd_765x17","magazine",0.02},
			{"KPFS_5Rnd_762x54_Mosin","magazine",0.02},
			{"KPFS_15Rnd_cal30_Carbine","magazine",0.02},
			{"KPFS_8Rnd_cal30_60_Gar","magazine",0.02},
			{"KPFS_30Rnd_45ACP_Thompson","magazine",0.02},
			{"LEN_L119A1_Acog","weapon",0.02},
			{"LEN_L119A1_Acog_HG_W","weapon",0.02},
			{"LEN_L119A1_Acog_CQB_W","weapon",0.02},
			{"LEN_L119A1_Acog_PF_W","weapon",0.03},
			{"LEN_L119A1_Acog_PF_SD_W","weapon",0.03},
			{"LEN_L119A1_Acog_CQB_SD_W","weapon",0.02},
			{"LEN_L119A1_Acog_CQB_SD_HG_W","weapon",0.01},
			{"LEN_L119A1_Acog_UGL_W","weapon",0.02},
			{"LEN_L119A1_Acog_UGL_PF_W","weapon",0.02},
			{"LEN_L119A1_Acog_HG_W","weapon",0.02},
			{"LEN_L119A1_Acog_CQB","weapon",0.02},
			{"LEN_L119A1_Acog_PF","weapon",0.03},
			{"LEN_L119A1_Acog_PF_SD","weapon",0.03},
			{"LEN_L119A1_Acog_CQB_SD","weapon",0.02},
			{"LEN_L119A1_Acog_CQB_SD_HG","weapon",0.01},
			{"LEN_L119A1_Acog_UGL","weapon",0.02},
			{"LEN_L119A1_Acog_UGL_PF","weapon",0.02},
			{"LEN_L119A1_EOT_CQB_W","weapon",0.03},
			{"LEN_L119A1_EOT_CQB_SD_W","weapon",0.02},
			{"LEN_L119A1_EOT_CQB","weapon",0.03},
			{"LEN_L119A1_EOT_CQB_SD","weapon",0.02},
			{"LEN_L119A1_EOT_PF","weapon",0.03},
			{"LEN_L119A1_EOT_PF_SD","weapon",0.02},
			{"LEN_L119A1_EOT_UGL_PF","weapon",0.03},
			{"LEN_L119A1_Elcan_PF","weapon",0.02},
			{"LEN_L119A1_Elcan_PF_SD","weapon",0.02},
			{"LEN_L119A1_Elcan_UGL_PF","weapon",0.02},
			{"p226","weapon",0.03},
			{"p226_sd","weapon",0.03},
			{"p226sf","weapon",0.03},
			{"p226sf_sd","weapon",0.03},
			{"MP5K","weapon",0.03},
			{"MP5A5n","weapon",0.03},
			{"MP5A5_REFLEX","weapon",0.03},
			{"MP5A5_AIMPOINT","weapon",0.03},
			{"MP5A5_ACOG","weapon",0.01},
			{"MP5SD6","weapon",0.03},
			{"MP5SD6_REFLEX","weapon",0.03},
			{"MP5SD6_AIMPOINT","weapon",0.03},
			{"MP5SD6_ACOG","weapon",0.01},
			{"KPFS_P38","weapon",0.03},
			{"KPFS_P38k","weapon",0.03},
			{"KPFS_TT33","weapon",0.01},
			{"KPFS_MG1","weapon",0.01},
			{"KPFS_MP2","weapon",0.01},
			{"KPFS_KarS","weapon",0.03},
			{"KPFS_MP44","weapon",0.01},
			{"KPFS_PZF60","weapon",0.03},
			{"KPFS_HK4","weapon",0.01},
			{"KPFS_P5","weapon",0.01},
			{"KPFS_HKP7","weapon",0.01},
			{"KPFS_P220","weapon",0.03},
			{"KPFS_P225","weapon",0.02},
			{"KPFS_P226","weapon",0.02},
			{"KPfs_glock17","weapon",0.03},
			{"KPFS_P88","weapon",0.03},
			{"KPFS_P99QA","weapon",0.03},
			{"KPFS_HKP30","weapon",0.01},
			{"KPFS_P2000","weapon",0.01},
			{"KPFS_MP5A3SD","weapon",0.01},
			{"KPFS_MP5A3","weapon",0.03},
			{"KPFS_P1","weapon",0.03},
			{"KPFS_P8","weapon",0.03},
			{"KPFS_P12","weapon",0.01},
			{"KPFS_P12SD","weapon",0.03},
			{"KPfs_G3a3","weapon",0.03},
			{"KPfs_g3a2","weapon",0.01},
			{"KPfs_g3a4","weapon",0.03},
			{"KPfs_g3a3zf","weapon",0.02},
			//{"KPfs_hk32","weapon",0.03},
			{"KPfs_g36a1","weapon",0.03},
			{"KPfs_g36a2","weapon",0.03},
			{"KPfs_g36a4","weapon",0.01},
			{"KPfs_g36k","weapon",0.02},
			{"KPfs_g36ksk","weapon",0.03},
			{"KPFS_HK416_Aim","weapon",0.03},
			{"KPFS_MG3","weapon",0.01},
			{"KPFS_MP2A1","weapon",0.03},
			{"KPFS_Makarov","weapon",0.03},
			{"KPFS_MPi_KM_72","weapon",0.03},
			{"KPFS_MPi_KMS_72","weapon",0.03},
			{"KPFS_MPi_AK_74","weapon",0.03},
			{"KPFS_MPi_AKS_74","weapon",0.03},
			{"KPFS_MPi_AKS_74K","weapon",0.03},
			{"KPFS_MPi_KMKIX","weapon",0.03},
			{"KPFS_PM63","weapon",0.01},
			{"KPFS_PSL","weapon",0.01},
			{"KPFS_KarS","weapon",0.03},
			{"KPFS_8Rnd_762x25_TT33","magazine",0.04},
			{"KPFS_TT33","weapon",0.05},
			{"M16A2","weapon",0.05},
			{"M16A2GL","weapon",0.05},
			{"M249_DZ","weapon",0.01},
			{"M9SD","weapon",0.02},
			{"MakarovSD","weapon",0.01},
			{"AK_74","weapon",0.05},
			{"M4A1_Aim","weapon",0.02},
			{"AKS_74_kobra","weapon",0.05},
			{"AKS_74_U","weapon",0.05},
			{"AK_47_M","weapon",0.05},
			{"M24","weapon",0.01},
			{"SVD_CAMO","weapon",0.01},
			{"M1014","weapon",0.05},
			
			//Unleashed
			{"KPFS_G1","weapon",0.03},
			{"KPFS_G36A2","weapon",0.03},
			{"KPFS_MPi_KM_72","weapon",0.04},
			{"KPFS_MPi_AK_74","weapon",0.04},
			{"kpfs_g3a2","weapon",0.04},
			{"sg550_lg97_aimpoint_camo","weapon",0.02},
			{"KPFS_MP44","weapon",0.04},
			{"KPFS_P99QA","weapon",0.04},
			{"KPFS_MP2","weapon",0.04},
			{"KPFS_16Rnd_9x19_para","magazine",0.04},
			{"KPFS_30Rnd_762x43_STG44","magazine",0.04},
			{"KPFS_32Rnd_MP2","magazine",0.01},
			{"20Rnd_762x51_FNFAL","magazine",0.03},
			{"DZ_GunBag_EP1","object",0.03},
			{"DZ_LargeGunBag_EP1","object",0.02},
            {"Skin_Camo1_DZ","magazine",0.02},
            {"Skin_Soldier1_DZ","magazine",0.02},
            {"Skin_Officer1_DZ","magazine",0.02},
            {"Skin_Sniper1_DZ","magazine",0.01},
            {"Skin_Sniper2_DZ","magazine",0.01},
            {"Skin_TKSoldier1_DZ","magazine",0.03},
			//Unleashed end
			
			{"M4A1","weapon",0.05},
			{"M14_EP1","weapon",0.03},
			{"UZI_EP1","weapon",0.08},
			{"Remington870_lamp","weapon",0.06},
			{"glock17_EP1","weapon",0.07},
			{"M240_DZ","weapon",0.01},
			{"M4A1_AIM_SD_camo","weapon",0.03},
			{"M16A4_ACG","weapon",0.05},
			{"M4A1_HWS_GL_camo","weapon",0.02},
			{"M4A3_CCO_EP1","weapon",0.03},
			{"AmmoBoxSmall_556","object",0.04},
			{"AmmoBoxSmall_762","object",0.02},
			{"Binocular","weapon",0.03},
			{"ItemKnife","military",0.05},
			{"Binocular_Vector","military",0.02},
			{"DZ_CivilBackpack_EP1","object",0.02}, // 24
			{"DZ_Backpack_EP1","object",0.01}, // 24		
			//{"Body","object",0.2},
			{"PipeBomb","magazine",0.01},
			{"Sa58V_RCO_EP1","weapon",0.04},
			{"Sa58V_CCO_EP1","weapon",0.04},
			//{"G36_C_SD_camo","weapon",0.01},
			{"M40A3","weapon",0.02},
			{"100Rnd_762x54_PK","magazine",0.01},
			{"Sa58P_EP1","weapon",0.02},
			{"Sa58V_EP1","weapon",0.02},
			//{"","craft",0.10},
			{"","military",0.70},
			{"","generic",0.30}
			//{"","attachments",0.10},
		};
	};
	class Hunting: Default {
		zombieChance = 0.6;
		minRoaming = 1;
		maxRoaming = 3;
		zombieClass[] = {"z_hunter","z_hunter","z_hunter"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"ItemMap","weapon",0.06},
			{"ItemFlashlight","generic",0.06},
			{"ItemKnife","generic",0.05},
			{"ItemMatchbox","generic",0.07},
			{"Crossbow_DZ","weapon",0.04},
			{"","military",0.05},
			{"MeleeMachete","weapon",0.04},
			{"huntingrifle","weapon",0.05},
			{"M14_EP1","weapon",0.02},
			{"CSGAS","magazine",0.02},
			{"ItemBandage","magazine",0.08},
			//Unleashed
			{"KPFS_M1_Carbine","weapon",0.03},
			{"KPFS_M1_Garand","weapon",0.03},
			{"KPFS_M1_Thompson","weapon",0.03},
			{"KPFS_M1_Garand_M84","weapon",0.03},
			{"kpfs_8Rnd_765x17","magazine",0.02},
			{"KPFS_5Rnd_762x54_Mosin","magazine",0.02},
			{"KPFS_15Rnd_cal30_Carbine","magazine",0.02},
			{"KPFS_8Rnd_cal30_60_Gar","magazine",0.02},
			{"KPFS_30Rnd_45ACP_Thompson","magazine",0.02},
			{"KPFS_G1","weapon",0.03},
			{"KPFS_G36A2","weapon",0.03},
			{"KPFS_MPi_KM_72","weapon",0.03},
			{"KPFS_MPi_AK_74","weapon",0.02},
			{"20Rnd_762x51_FNFAL","magazine",0.03},
			{"Skin_Camo1_DZ","magazine",0.01},
			{"Skin_Soldier1_DZ","magazine",0.01},
			//Unleashed end
			{"","food",0.07},
			{"M16A2","weapon",0.03},
			{"AK_74","weapon",0.03},
			{"M24","weapon",0.03},
			{"M1014","weapon",0.03},
			{"","hunter",0.10},
			//{"","craft",0.10},
			{"","military",0.15},
			//{"","attachments",0.15},
			{"","generic",0.50}
		};
	};
#include "CfgBuildingPos.hpp"
};
