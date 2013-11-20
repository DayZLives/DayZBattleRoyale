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

			{"DZ_Assault_Pack_EP1","object",0.15},
			{"DZ_ALICE_Pack_EP1","object",0.14},
			{"DZ_TK_Assault_Pack_EP1","object",0.14},


			{"","generic",0.19},
			{"","military",0.05}
		};
	};
	class Residential: Default {
		zombieChance = 0.4;
		maxRoaming = 2;
		zombieClass[] = {"zZombie_Base","z_hunter","z_teacher","z_villager1","z_villager2","z_villager3"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"ItemSodaMdew","magazine",0.01},
			{"ItemWatch","generic",0.12},
			{"ItemCompass","generic",0.06},
			{"ItemMap","weapon",0.04},
			{"RH_mk22","weapon",0.09},
			{"RH_m1911old","weapon",0.06},
			{"ItemFlashlight","generic",0.03},
			{"ItemKnife","generic",0.08},
			{"ItemMatchbox","generic",0.06},
			{"LeeEnfield","weapon",0.06},
			{"DZ_Assault_Pack_EP1","object",0.05},
			{"DZ_ALICE_Pack_EP1","object",0.04},
			{"DZ_TK_Assault_Pack_EP1","object",0.04},
			{"Winchester1866","weapon",0.02},
			{"Crossbow_DZ","weapon",0.01},
			{"Binocular","weapon",0.06},
			{"WeaponHolder_ItemCrowbar","object",0.08},
			{"MR43","weapon",0.02},
			{"RH_browninghp","weapon",0.05},
			{"RH_mk22sd","weapon",0.01},
			{"gms_k98","weapon",0.02},
			{"DDOPP_X26","weapon",0.02},
			{"DDOPP_X26_b","weapon",0.01},

			{"Skin_Camo14_DZ","magazine",0.01},
			{"Skin_Camo15_DZ","magazine",0.01},
			{"Skin_Camo16_DZ","magazine",0.01},
			{"Skin_Camo17_DZ","magazine",0.01},
			{"Skin_Camo19_DZ","magazine",0.01},

			{"","military",0.10},
			{"","generic",0.30}
		};
	};
	class Office: Residential {
		maxRoaming = 2;
		lootChance = 1;
		zombieClass[] = {"z_suit1","z_suit2"};
	};
	class Industrial: Default { //254
		zombieChance = 0.4;
		zombieClass[] = {"z_worker1","z_worker2","z_worker3"};
		maxRoaming = 2;
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"WeaponHolder_PartGeneric","object",0.04},
			{"WeaponHolder_PartWheel","object",0.05},
			{"WeaponHolder_PartFueltank","object",0.04},
			{"WeaponHolder_PartEngine","object",0.04},
			{"WeaponHolder_PartGlass","object",0.03},
			{"WeaponHolder_PartVRotor","object",0.01},
			{"WeaponHolder_ItemJerrycan","object",0.04},
			{"WeaponHolder_ItemHatchet","object",0.11},
			{"ItemKnife","military",0.07},
			{"ItemToolbox","weapon",0.06},
			{"ItemTankTrap","magazine",0.04},
			{"ItemSandbag","magazine",0.03},
			{"Skin_Camo18_DZ","magazine",0.01},
			{"","military",0.04},
			{"","generic",0.35}
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
			{"ItemTankTrap","magazine",0.04},
			{"ItemSodaMdew","magazine",0.01},
			{"ItemWatch","generic",0.05},
			{"ItemCompass","generic",0.05},
			{"RH_mk22","weapon",0.04},
			{"RH_m1911old","weapon",0.04},
			{"ItemKnife","generic",0.07},
			{"ItemMatchbox","generic",0.06},
			{"LeeEnfield","weapon",0.03},
			{"revolver_EP1","weapon",0.04},
			{"DZ_ALICE_Pack_EP1","object",0.03},
			{"DZ_TK_Assault_Pack_EP1","object",0.03},
			{"Winchester1866","weapon",0.03},
			{"Crossbow_DZ","weapon",0.01},
			{"Binocular","weapon",0.06},
			{"Skin_Camo1_DZ","magazine",0.01},
			{"WeaponHolder_ItemCrowbar","object",0.08},
			{"MR43","weapon",0.03},
			{"WeaponHolder_ItemFuelcan","object",0.03},
			{"","military",0.40},
			{"","generic",0.20}
		};
	};
	class Farm: Default {
		zombieChance = 0.4;
		maxRoaming = 2;
		zombieClass[] = {"zZombie_Base","z_hunter","z_hunter","z_hunter","z_villager1","z_villager2","z_villager3"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"WeaponHolder_ItemJerrycan","object",0.06},
			{"huntingrifle","weapon",0.01},
			{"LeeEnfield","weapon",0.04},
			{"Winchester1866","weapon",0.03},
			{"Crossbow_DZ","weapon",0.03},
			{"WeaponHolder_ItemHatchet","object",0.17},
			{"MR43","weapon",0.06},
			{"TrapBear","magazine",0.01},
			{"Skin_Camo3_DZ","magazine",0.01},
			{"Skin_Camo2_DZ","magazine",0.01},
			{"RH_anac","weapon",0.01},
			{"RH_p38","weapon",0.04},
			{"RH_6Rnd_44_Mag","magazine",0.02},
			{"RH_8Rnd_9x19_p38","magazine",0.04},
			{"gms_k98","weapon",0.04},
			{"gms_k98_rg","weapon",0.02},
			{"gms_k98_mag","magazine",0.08},
			{"panzergrenade","magazine",0.01},
			{"VIL_SKS","weapon",0.04},
			{"VIL_10Rnd_762x39_SKS","magazine",0.08},
			{"","military",0.02},
			{"","generic",0.40}
		};
	};
	class Supermarket: Default {
		lootChance = 0.4;
		minRoaming = 2;
		maxRoaming = 5;
		zombieChance = 1;
		zombieClass[] = {"zZombie_Base","zZombie_Base","z_teacher","z_suit1","z_suit2"};
		lootType[] = {
			{"ItemWatch","generic",0.10},
			{"ItemCompass","generic",0.01},
			{"ItemMap","weapon",0.05},
			{"RH_mk22","weapon",0.02},
			{"RH_m1911old","weapon",0.02},
			{"ItemFlashlight","generic",0.02},
			{"ItemKnife","generic",0.02},
			{"ItemMatchbox","generic",0.05},
			{"LeeEnfield","weapon",0.01},
			{"DZ_ALICE_Pack_EP1","object",0.07}, 
			{"DZ_Assault_Pack_EP1","object",0.06},
			{"Winchester1866","weapon",0.01},
			{"Crossbow_DZ","weapon",0.01},
			{"Binocular","weapon",0.05},
			{"MR43","weapon",0.01},
			{"RH_browninghp","weapon",0.02},
			{"RH_mk22sd","weapon",0.01},
			{"Skin_Camo4_DZ","magazine",0.01},
			{"Skin_Camo5_DZ","magazine",0.01},
			{"","food",0.14},
			{"","generic",0.35}
		};
	};
	class HeliCrash: Default {
		zombieChance = 1;
		minRoaming = 10;
		maxRoaming = 15;
		zombieClass[] = {"z_soldier_pilot","z_soldier_heavy"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"FN_FAL","weapon",0.02},
			{"Mk_48_DZ","weapon",0.03},
			{"DMR","weapon",0.06},
			{"MedBox0","object",0.10},
			{"AmmoBoxSmall_556","object",0.07},
			{"AmmoBoxSmall_762","object",0.07},
			{"Camo20_DZ","magazine",0.08},
			{"Skin_Sniper1_DZ","magazine",0.05},
			{"G36C_camo","weapon",0.02},
			{"G36_C_SD_camo","weapon",0.01},
			{"G36A_camo","weapon",0.02},	
			{"SCAR_H_LNG_Sniper","weapon",0.05},	
			{"VSS_vintorez","weapon",0.01},
			{"M40A3","weapon",0.03},
			{"Pecheneg","weapon",0.02},
			{"PK","weapon",0.02},
			{"SCAR_L_CQC_CCO_SD","weapon",0.03},
			{"20Rnd_762x51_FNFAL","magazine",0.03},
			{"SCAR_L_STD_Mk4CQT","weapon",0.02},
			{"BAF_L85A2_UGL_ACOG","weapon",0.05},
			{"SVD_NSPU_EP1","weapon",0.02},
			{"Skin_Sniper2_DZ","magazine",0.05},
			{"Camo22_DZ","magazine",0.02},
			{"M136","weapon",0.01},
			{"M136","magazine",0.01},
			{"20rnd_762x51_B_SCAR","magazine",0.02},
			{"10Rnd_9x39_SP5_VSS","magazine",0.01},
			{"RH_Deaglemzb","weapon",0.05},
			{"RH_deaglem","weapon",0.05},
			{"RH_deagle","weapon",0.05},
			{"RH_bull","weapon",0.05},
			{"FHQ_MSR_DESERT","weapon",0.03},
			{"FHQ_XM2010_DESERT","weapon",0.06},
			{"FHQ_ACR_WDL_HAMR_SD","weapon",0.03},
			{"FHQ_ACR_TAN_RCO_SD","weapon",0.04},
			{"KSVK","weapon",0.03},
			{"5Rnd_127x108_KSVK","magazine",0.03},
			{"VIL_M24B","weapon",0.02},
			{"VIL_M110","weapon",0.02},
			{"VIL_SR25","weapon",0.02},
			{"VIL_SVD_P21","weapon",0.01},
			{"VIL_SVU","weapon",0.02},
			{"VIL_HK417s","weapon",0.02},
			{"Binocular_Vector","military",0.03},
			{"AKS_74_NSPU","weapon",0.05},
			{"FHQ_RSASS_TAN","weapon",0.03},
			{"FHQ_RSASS_SD_TAN","weapon",0.01},
			{"FHQ_rem_20Rnd_762x51_PMAG_T_SD","magazine",0.01},
			{"FHQ_rem_20Rnd_762x51_PMAG_T","magazine",0.01},
			{"Skin_Sniper3_DZ","magazine",0.01},
			{"Skin_Sniper4_DZ","magazine",0.01},
			{"Skin_Sniper5_DZ","magazine",0.01},
			{"Skin_Sniper6_DZ","magazine",0.01},
			{"","military",0.30}
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
			{"Mk_48_DZ","weapon",0.03},
			{"M249_DZ","weapon",0.04},
			{"BAF_L85A2_RIS_Holo","weapon",0.03},
			{"NVGoggles","weapon",0.01},
			{"AmmoBoxSmall_556","object",0.03},
			{"Skin_Sniper1_DZ","magazine",0.05},
			{"G36C","weapon",0.03},
			{"G36C_camo","weapon",0.03},
			{"G36A_camo","weapon",0.03},
			{"G36K_camo","weapon",0.03},
			{"BAF_L110A1_Aim","weapon",0.03},
			{"BAF_LRR_scoped","weapon",0.03},
			{"M4SPR","weapon",0.05},
			{"FHQ_ACR_TAN_RCO","weapon",0.02},
			{"FHQ_ACR_WDL_HWS_GL","weapon",0.01},
			{"SCAR_H_STD_EGLM_Spect","weapon",0.02},
			{"SCAR_H_CQC_CCO","weapon",0.03},

			{"SCAR_H_LNG_Sniper","weapon",0.02},
			{"DZ_Backpack_EP1","object",0.03},
			{"Camo25_DZ","magazine",0.05},
			{"Skin_Sniper3_DZ","magazine",0.01},
			{"AmmoBoxSmall_762","object",0.07},
			{"AmmoBoxSmall_680x43","object",0.07},
			{"RH_acrbglacog","weapon",0.04},
			{"RH_acrbglaim","weapon",0.04},
			{"","military",0.85}
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
			{"DMR_DZ","weapon",0.04},
			{"RPK_74","weapon",0.02}, 
			{"Binocular","weapon",0.01},
			{"ItemKnife","militaryEAST",0.03},
			{"","militaryEAST",0.10}, 
			{"ItemCompass","militaryEAST",0.04},
			{"AmmoBoxSmall_762","object",0.3},
			{"100Rnd_762x54_PK","magazine",0.02},
			{"NVGoggles","weapon",0.01},
			{"Skin_Sniper3_DZ","magazine",0.02},
			{"Camo26_DZ","magazine",0.05},
			{"Camo27_DZ","magazine",0.05},
			{"KSVK","weapon",0.01},
			{"vil_SVDK","weapon",0.02},
			{"","military",0.55}
		};
	};
	class HeliCrash_No50s: Default {
		zombieChance = 1;
		minRoaming = 10;
		maxRoaming = 15;
		zombieClass[] = {"z_soldier_pilot","z_soldier_heavy"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"FN_FAL","weapon",0.02},
			{"bizon_silenced","weapon",0.05},
			{"M14_EP1","weapon",0.05},
			{"FN_FAL_ANPVS4","weapon",0.02},
			{"Mk_48_DZ","weapon",0.03},
			{"M249_DZ","weapon",0.05},
			{"BAF_L85A2_RIS_SUSAT","weapon",0.01},
			{"DMR","weapon",0.06},
			{"MedBox0","object",0.10},
			{"AmmoBoxSmall_556","object",0.10},
			{"AmmoBoxSmall_762","object",0.10},
			{"NVGoggles","weapon",0.01},
			{"Skin_Sniper1_DZ","magazine",0.05},
			{"G36C","weapon",0.03},
			{"G36C_camo","weapon",0.02},
			{"G36_C_SD_camo","weapon",0.01},
			{"G36A_camo","weapon",0.02},
			{"G36K_camo","weapon",0.02},
			{"100Rnd_762x54_PK","magazine",0.01},
			{"BAF_L110A1_Aim","weapon",0.03},
			{"BAF_LRR_scoped","weapon",0.03},
			{"M4SPR","weapon",0.05},
			{"FHQ_ACR_TAN_RCO","weapon",0.02},
			{"FHQ_ACR_WDL_HWS_GL","weapon",0.01},
			{"SCAR_H_STD_EGLM_Spect","weapon",0.02},
			{"SCAR_H_CQC_CCO","weapon",0.03},

			{"SCAR_H_LNG_Sniper","weapon",0.02},
			{"DZ_Backpack_EP1","object",0.03},
			{"Skin_Sniper3_DZ","magazine",0.01},
			{"Skin_Camo18_DZ","magazine",0.01},
			{"Skin_Camo21_DZ","magazine",0.01},
			{"Skin_Camo23_DZ","magazine",0.01},
			{"RH_acrbglacog","weapon",0.04},
			{"RH_acrbglaim","weapon",0.04},
			{"","military",0.55}
		};
	};
	class Hospital: Default {
		zombieChance = 0.4;
		minRoaming = 4;
		maxRoaming = 7;
		zombieClass[] = {"z_doctor","z_doctor","z_doctor"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"","hospital",0.90},
			{"MedBox0","object",0.20}
		};
	};
	class Military: Default {
		zombieChance = 0.4;
		maxRoaming = 5;
		zombieClass[] = {"z_soldier","z_soldier_heavy","z_policeman"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"M9","weapon",0.05},
			{"M16A2","weapon",0.05},
			{"M16A2GL","weapon",0.02},
			{"M9SD","weapon",0.01},
			{"MakarovSD","weapon",0.01},
			{"AK_74","weapon",0.06},
			{"M4A1_Aim","weapon",0.03},
			{"AKS_74_kobra","weapon",0.06},
			{"AKS_74_U","weapon",0.04},
			{"AK_47_M","weapon",0.04},
			{"M24","weapon",0.01},
			{"M1014","weapon",0.06},
			{"DMR_DZ","weapon",0.01},
			{"M4A1","weapon",0.04},
			{"M14_EP1","weapon",0.03},
			{"UZI_EP1","weapon",0.05},
			{"Remington870_lamp","weapon",0.05},
			{"glock17_EP1","weapon",0.08},
			{"MP5A5","weapon",0.04},
			{"MP5SD","weapon",0.01},
			{"M4A3_CCO_EP1","weapon",0.02},
			{"Binocular","weapon",0.05},
			{"ItemFlashlightRed","military",0.06},
			{"ItemKnife","military",0.06},
			{"ItemGPS","weapon",0.01},
			{"ItemMap","military",0.03},
			{"DZ_British_ACU","object",0.06},
			{"DZ_CivilBackpack_EP1","object",0.03},	
			{"ItemEtool","weapon",0.03},
			{"ItemSandbag","magazine",0.04},
			{"RH_ctar21m","object",0.02},
			{"RH_ctar21mgl","object",0.02},
			{"RH_masaim","object",0.02},
			{"","military",0.70},
			{"","generic",0.06}
		};
	};
	class Firestation: Default {
		zombieChance = 0.4;
		maxRoaming = 5;
		zombieClass[] = {"z_soldier","z_soldier_heavy","z_policeman"};
		lootChance = 0.9;
		lootPos[] = {};
		lootType[] = {
			{"RH_m9","weapon",0.01},
			{"M16A2","weapon",0.07},
			{"M16A2GL","weapon",0.01},
			{"RH_m9csd","weapon",0.02},
			{"AK_74","weapon",0.15},
			{"AKS_74_U","weapon",0.08},
			{"M1014","weapon",0.15},
			{"M4A1","weapon",0.07},
			{"UZI_EP1","weapon",0.08},
			{"Remington870_lamp","weapon",0.19},
			{"Winchester1866","weapon",0.18},
			{"LeeEnfield","weapon",0.17},
			{"RH_g17","weapon",0.10},
			{"MP5A5","weapon",0.15},
			{"MP5SD","weapon",0.16},
			{"Binocular","weapon",0.06},
			{"ItemFlashlightRed","military",0.10},
			{"ItemKnife","military",0.10},
			{"ItemGPS","weapon",0.01},
			{"ItemMap","military",0.05},
			{"DZ_ALICE_Pack_EP1","object",0.12}, 
			{"DZ_TK_Assault_Pack_EP1","object",0.11}, 
			{"DZ_British_ACU","object",0.06}, 
			{"ItemEtool","weapon",0.05},
			{"ItemSandbag","magazine",0.01},
			{"Sa58P_EP1","weapon",0.08},
			{"Sa58V_EP1","weapon",0.07},
			{"UZI_SD_EP1","weapon",0.01},
			{"RH_uspm","weapon",0.04},
			{"RH_m1911sd","weapon",0.04},
			{"RH_uspsd","weapon",0.02},
			{"RH_p226","weapon",0.05},
			{"RH_muzi","weapon",0.02},
			{"RH_tec9","weapon",0.01},
			{"RH_vz61","weapon",0.02},
			{"RH_m14","weapon",0.09},
			{"Skin_Camo5_DZ","magazine",0.02},
			{"Skin_Camo4_DZ","magazine",0.02},
			{"VIL_AMD","weapon",0.13},
			{"VIL_AEK_23","weapon",0.12},
			{"RH_ctar21","weapon",0.10},
			{"RH_mas","weapon",0.10},

			{"Skin_Camo24_DZ","magazine",0.01},
			{"Skin_Camo23_DZ","magazine",0.01},
			{"Skin_Camo12_DZ","magazine",0.01},
			{"Skin_Camo13_DZ","magazine",0.02}
		};
	};
	class MilitarySpecial: Default {
		zombieChance = 0.4;
		minRoaming = 5;
		maxRoaming = 8;
		zombieClass[] = {"z_soldier_heavy"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"M16A2","weapon",0.08},
			{"M16A2GL","weapon",0.05},
			{"M249_DZ","weapon",0.01},
			{"RH_m9csd","weapon",0.02},
			{"AK_74","weapon",0.10},
			{"M4A1_Aim","weapon",0.02},
			{"AKS_74_kobra","weapon",0.10},
			{"AKS_74_U","weapon",0.10},
			{"AK_47_M","weapon",0.10},
			{"M24","weapon",0.01},
			{"SVD_CAMO","weapon",0.01},
			{"DMR","weapon",0.02},
			{"M4A1","weapon",0.10},
			{"RH_m14aim","weapon",0.03},
			{"UZI_EP1","weapon",0.20},
			{"RH_g17","weapon",0.20},
			{"M240_DZ","weapon",0.01},
			{"M4A1_AIM_SD_camo","weapon",0.04},
			{"M16A4_ACG","weapon",0.05},
			{"M4A1_HWS_GL_camo","weapon",0.02},
			{"Mk_48_DZ","weapon",0.01},
			{"M4A3_CCO_EP1","weapon",0.08},
			{"AmmoBoxSmall_556","object",0.04},
			{"AmmoBoxSmall_762","object",0.02},
			{"AmmoBoxSmall_680x43","object",0.02},
			{"Binocular","weapon",0.10},
			{"ItemFlashlightRed","military",0.05},
			{"ItemKnife","military",0.15},
			{"ItemGPS","weapon",0.01},
			{"ItemMap","military",0.03},
			{"DZ_British_ACU","object",0.04},
			{"DZ_CivilBackpack_EP1","object",0.02},
			{"DZ_Backpack_EP1","object",0.03},
			{"PipeBomb","magazine",0.01},
			{"Sa58V_RCO_EP1","weapon",0.01},
			{"Sa58V_CCO_EP1","weapon",0.01},
			{"G36C_camo","weapon",0.01},
			{"VIL_M40A3","weapon",0.01},
			{"UZI_SD_EP1","weapon",0.03},
			{"SCAR_L_STD_HOLO","weapon",0.02},
			{"BAF_L85A2_RIS_Holo","weapon",0.02},
			{"BAF_L85A2_UGL_Holo","weapon",0.02},
			{"SCAR_L_CQC_CCO_SD","weapon",0.01},
			{"Saiga12K","weapon",0.08},
			{"20Rnd_762x51_FNFAL","magazine",0.01},
			{"VIL_M24B","weapon",0.01},






			{"Skin_Camo22_DZ","magazine",0.02},
			{"Skin_Sniper2_DZ","magazine",0.01},



			{"20rnd_762x51_B_SCAR","magazine",0.03},
			{"10Rnd_9x39_SP5_VSS","magazine",0.01},
			{"RH_uspm","weapon",0.08},
			{"RH_m1911sd","weapon",0.04},
			{"RH_uspsd","weapon",0.02},
			{"RH_p226","weapon",0.05},
			{"RH_muzi","weapon",0.02},
			{"RH_tec9","weapon",0.01},
			{"RH_vz61","weapon",0.03},
			{"RH_python","weapon",0.02},
			{"RH_m14","weapon",0.04},
			{"G36C","weapon",0.03},
			{"ItemSandbag","magazine",0.01},
			{"FHQ_ACR_BLK_CCO","weapon",0.04},
			{"FHQ_ACR_BLK_CCO_SD","weapon",0.01},
			{"FHQ_ACR_TAN_CCO","weapon",0.03},
			{"FHQ_ACR_WDL_IRN","weapon",0.02},
			{"FHQ_ACR_BLK_RCO_SD","weapon",0.01},
			{"FHQ_ACR_TAN_HWS_SD","weapon",0.01},
			{"FHQ_ACR_WDL_G33","weapon",0.04},
			{"FHQ_ACR_TAN_RCO","weapon",0.02},
			{"FHQ_ACR_WDL_HWS_GL","weapon",0.01},
			{"FHQ_rem_30Rnd_680x43_ACR","magazine",0.04},
			{"FHQ_rem_20Rnd_680x43_ACR","magazine",0.04},
			{"FHQ_rem_20Rnd_680x43_ACR_T_SD","magazine",0.02},
			{"FHQ_rem_30Rnd_680x43_ACR_T_SD","magazine",0.03},
			{"VIL_SR25","weapon",0.01},
			{"VIL_M110","weapon",0.01},
			{"VIL_HK33","weapon",0.01},
			{"VIL_Galil","weapon",0.02},
			{"VIL_Galil_arm","weapon",0.01},
			{"VIL_HK416_Eot","weapon",0.04},
			{"VIL_HK416_Aim","weapon",0.03},
			{"VIL_HK416_EDR","weapon",0.04},
			{"VIL_30Rnd_556x45_HK","magazine",0.02},
			{"VIL_35Rnd_556x45_G","magazine",0.02},
			{"VIL_Mg3","weapon",0.02},
			{"VIL_FnMag","weapon",0.02},
			{"skaVIL_M60","weapon",0.01},
			{"VIL_SVD_P21","weapon",0.01},
			{"VIL_SVU","weapon",0.01},
			{"Skin_Camo18_DZ","magazine",0.02},
			{"Skin_Camo20_DZ","magazine",0.02},
			{"Skin_Camo21_DZ","magazine",0.02},
			{"Skin_Camo22_DZ","magazine",0.02},
			{"RH_m1stacog","weapon",0.02},
			{"5Rnd_127x108_KSVK","magazine",0.01},
			{"KSVK","weapon",0.01},
			{"Binocular_Vector","military",0.01},
			{"FN_FAL_ANPVS4","weapon",0.01},
			{"FHQ_ACR_WDL_HAMR_SD","weapon",0.03},
			{"FHQ_rem_20Rnd_762x51_PMAG_T","magazine",0.03},
			{"FHQ_RSASS_TAN","weapon",0.01},
			{"SCAR_H_STD_EGLM_Spect","weapon",0.02},
			{"SCAR_H_CQC_CCO","weapon",0.03},

			{"SCAR_H_LNG_Sniper","weapon",0.01},
			{"M4SPR","weapon",0.04},
			{"RH_acrbglacog","weapon",0.04},
			{"RH_acrbglaim","weapon",0.04},



			{"","medical",0.10},
			{"","generic",0.05},
			{"","military",0.90}
		};
	};
	class MilitarCrash: Default {
		zombieChance = 1;
		minRoaming = 10;
		maxRoaming = 15;
		zombieClass[] = {"z_soldier_pilot","z_soldier_heavy"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"FN_FAL","weapon",0.05},
			{"DMR","weapon",0.04},
			{"MedBox0","object",0.03},
			{"AmmoBoxSmall_556","object",0.05},
			{"AmmoBoxSmall_762","object",0.05},
			{"AmmoBoxSmall_680x43","object",0.05},
			{"Skin_Sniper3_DZ","magazine",0.08},
			{"Skin_Sniper1_DZ","magazine",0.05},
			{"G36C","weapon",0.03},
			{"G36C_camo","weapon",0.02},
			{"G36_C_SD_camo","weapon",0.05},
			{"G36A_camo","weapon",0.05},
			{"SCAR_L_CQC_CCO_SD","weapon",0.04},
			{"ItemGPS","weapon",0.03},
			{"DZ_Backpack_EP1","object",0.03},
			{"RH_m9csd","weapon",0.02},
			{"PK","weapon",0.03},
			{"BAF_L85A2_UGL_ACOG","weapon",0.05},
			{"VIL_M24B","weapon",0.02},
			{"VIL_M40A3","weapon",0.02},
			{"Skin_Sniper5_DZ","magazine",0.08},
			{"Skin_Sniper2_DZ","magazine",0.05},
			{"RH_Deaglemzb","weapon",0.03},
			{"RH_deaglem","weapon",0.03},
			{"RH_deagle","weapon",0.03},
			{"RH_bull","weapon",0.05},
			{"VIL_SR25","weapon",0.03},
			{"VIL_M110","weapon",0.04},
			{"VIL_Galil","weapon",0.04},
			{"VIL_Galil_arm","weapon",0.04},
			{"VIL_HK416_EDR","weapon",0.04},
			{"VIL_SVD_P21","weapon",0.03},
			{"VIL_SVU","weapon",0.03},
			{"Skin_Camo9_DZ","magazine",0.02},
			{"RH_m1stacog","weapon",0.02},
			{"5Rnd_127x108_KSVK","magazine",0.02},
			{"KSVK","weapon",0.02},
			{"SCAR_H_LNG_Sniper","weapon",0.02},	
			{"VSS_vintorez","weapon",0.02},
			{"Binocular_Vector","military",0.03},
			{"AKS_74_NSPU","weapon",0.04},
			{"FHQ_MSR_DESERT","weapon",0.03},
			{"FHQ_RSASS_TAN","weapon",0.05},
			{"FHQ_XM2010_DESERT","weapon",0.05},
			{"SCAR_H_STD_EGLM_Spect","weapon",0.06},
			{"SCAR_H_CQC_CCO","weapon",0.08},

			{"SCAR_H_LNG_Sniper","weapon",0.03},

			{"","military",0.90}
		};
	};
	class Hunting: Default {
		zombieChance = 0.6;
		minRoaming = 1;
		maxRoaming = 2;
		zombieClass[] = {"z_hunter","z_hunter","z_hunter"};
		lootChance = 1;
		lootPos[] = {};
		lootType[] = {
			{"ItemMap","weapon",0.04},
			{"ItemKnife","generic",0.04},
			{"ItemMatchbox","generic",0.03},
			{"M24","weapon",0.01},
			{"SVD_CAMO","weapon",0.01},
			{"M4SPR","weapon",0.02},
			{"huntingrifle","weapon",0.07},
			{"","hunter",0.30},
			{"","military",0.40}

		};
	};
	class CivilCrash: Default {
		zombieChance = 1;
		minRoaming = 10;
		maxRoaming = 15;
		zombieClass[] = {"z_soldier_pilot","z_soldier_heavy"};
		lootChance = 1;
		lootPos[] = {};
		itemType[] = {
			{"Binocular","weapon",0.12},
			{"ItemKnife","military",0.12},
			{"ItemGPS","weapon",0.04},
			{"ItemEtool","weapon",0.12},					
			{"RH_m9","weapon",0.12},
			{"Sa58V_CCO_EP1","weapon",0.04},
			{"G36_C_SD_camo","weapon",0.05},
			{"DZP_Medicalbox","object",0.24},
			{"DZ_Assault_Pack_EP1","object",0.12},
			{"DZ_Patrol_Pack_EP1","object",0.12},
			{"DZ_Backpack_EP1","object",0.06},
			{"Skin_Sniper1_DZ","magazine",0.03},
			{"ItemMap","military",0.10},
			{"ItemMatchbox","generic",0.15},
			{"DZ_ALICE_Pack_EP1","object",0.05}, 
			{"DZ_British_ACU","object",0.03},
			{"DZ_CivilBackpack_EP1","object",0.02},
			{"UZI_SD_EP1","weapon",0.02},
			{"Skin_Sniper5_DZ","magazine",0.01},
			{"Skin_Sniper2_DZ","magazine",0.01},
			{"Skin_Camo17_DZ","magazine",0.01},
			{"Skin_Camo16_DZ","magazine",0.01},
			{"Skin_Camo15_DZ","magazine",0.01},
			{"Skin_Camo14_DZ","magazine",0.01},
			{"","military",0.92},
			{"","hospital",0.48}
		};
	};
#include "CfgBuildingPos.hpp"
};