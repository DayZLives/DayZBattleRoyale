class CfgWeapons {
	class Default {
		canlock = 0;
	};
	class ItemCore;
	class Crossbow;
	class Rifle;
	
class Mode_SemiAuto 
{
	multiplier = 1;
	burst = 1;
	dispersion = 0.000200;
	sound[] = {
			"", 10, 1
	};
	soundBegin[] = {
			"sound", 1
	};
	soundEnd[] = { };
	soundLoop[] = { };
	soundContinuous = 0;
	soundBurst = 1;
	reloadTime = 0.100000;
	ffCount = 1;
	ffMagnitude = 0.500000;
	ffFrequency = 11;
	flash = "gunfire";
	flashSize = 0.100000;
	recoil = "Empty";
	recoilProne = "Empty";
	autoFire = 0;
	aiRateOfFire = 0.500000;
	aiRateOfFireDistance = 500;
	useAction = 0;
	useActionTitle = "";
	showToPlayer = 1;
	minRange = 30;
	minRangeProbab = 0.250000;
	midRange = 300;
	midRangeProbab = 0.580000;
	maxRange = 600;
	maxRangeProbab = 0.040000;
	artilleryDispersion = 1;
	artilleryCharge = 1;
	displayName = "Semi";
};

class Mode_FullAuto : Mode_SemiAuto
{
	dispersion = 0.000500;
	sound[] = {
			"", 10, 1
	};
	soundEnd[] = {
			"sound", 1
	};
	soundContinuous = 0;
	reloadTime = 0.080000;
	autoFire = 1;
	minRange = 1;
	minRangeProbab = 0.200000;
	midRange = 30;
	midRangeProbab = 0.580000;
	maxRange = 80;
	maxRangeProbab = 0.040000;
	displayName = "Full";
};
	class ChainSaw : Rifle
	{
		scope = 2;
		emptySound[] = {
				"", 10, 1
		};
		soundBullet[] = {
				"emptySound", 1
		};
		model = "\z\addons\br_assets\chainsaw\models\chainsaw.p3d";
		picture = "\z\addons\br_assets\chainsaw\pictures\equip_chainsaw_CA.paa";
		displayName = "Chainsaw";
		cursor = "";
		cursoraim = "\ca\Weapons\Data\clear_empty";
		modes[] = {
				"manual"
		};
		handAnim[] = {
				"OFP2_ManSkeleton", "\z\addons\br_assets\chainsaw\anim\saw_idle.rtm"
		};

		class manual : Mode_FullAuto
		{
			recoil = "recoil_auto_machinegun_10outof10";
			recoilProne = "recoil_auto_machinegun_prone_10outof10";
			dispersion = 0.200000;
			begin1[] = {
					"\z\addons\br_assets\chainsaw\sounds\running2.ogg", 1.778280, 1, 1000
			};
			soundBegin[] = {
					"begin1", 1
			};
			distanceZoomMin = 50;
			distanceZoomMax = 50;
			canDrop = 0;
			UiPicture = "\CA\weapons\data\Ico\i_regular_CA.paa";
			optics = 1;
			modelOptics = "-";
			burst = 1;
			multiplier = 1;
			soundContinuous = 0;
			soundBurst = 0;
			useAction = 0;
			useActionTitle = "";
			minRange = 0.500000;
			minRangeProbab = 0.800000;
			midRange = 1;
			midRangeProbab = 1.500000;
			maxRange = 2;
			maxRangeProbab = 2.500000;
			showToPlayer = 1;
			reloadTime = 0.120000;
			displayName = "Gas";
		};
		aiDispersionCoefY = 21;
		aiDispersionCoefX = 21;
		dexterity = 0.510000;
		reloadMagazineSound[] = {
				"\z\addons\br_assets\chainsaw\sounds\start-attempt.ogg", 0.100000, 1, 20
		};
		drySound[] = {
				"\z\addons\br_assets\chainsaw\sounds\start-attempt.ogg", 0.010000, 1, 10
		};
		magazines[] = {
				"CSGAS"
		};

		class Library 
		{
			libTextDesc = "Hermlite Chainsaw";
		};
		descriptionShort = "Hermlite Chainsaw";
	};

	class ChainSawB : ChainSaw
	{
		model = "\z\addons\br_assets\chainsaw\models\chainsaw_B.p3d";
		picture = "\z\addons\br_assets\chainsaw\pictures\equip_chainsawB_CA.paa";
		descriptionShort = "Hermlite Chainsaw (Blue)";
	};

	class ChainSawG : ChainSaw
	{
		model = "\z\addons\br_assets\chainsaw\models\chainsaw_G.p3d";
		picture = "\z\addons\br_assets\chainsaw\pictures\equip_chainsawG_CA.paa";
		descriptionShort = "Hermlite Chainsaw (Green)";
	};

	class ChainSawP : ChainSaw
	{
		model = "\z\addons\br_assets\chainsaw\models\chainsaw_P.p3d";
		picture = "\z\addons\br_assets\chainsaw\pictures\equip_chainsawP_CA.paa";
		descriptionShort = "Hermlite Chainsaw (Pink)";
	};

	class ChainSawR : ChainSaw
	{
		model = "\z\addons\br_assets\chainsaw\models\chainsaw_R.p3d";
		picture = "\z\addons\br_assets\chainsaw\pictures\equip_chainsawR_CA.paa";
		descriptionShort = "Hermlite Chainsaw (Red)";
	};
	class MeleeWeapon : Rifle {
		canDrop = true;
	};
	class PistolCore;	// External class reference
	class Pistol;	// External class reference
	class GrenadeLauncher;  // External class reference
	//class M107_DZ;	// External class reference
	//class BAF_AS50_scoped;	// External class reference
	class DMR;	// External class reference
		
	#include "CfgWeapons\Melee\MeleeMachete.hpp"
	#include "CfgWeapons\Melee\ItemMachete.hpp"
	#include "CfgWeapons\Melee\MeleeHatchet.hpp"
	#include "CfgWeapons\Melee\ItemHatchet.hpp"
	#include "CfgWeapons\Melee\MeleeCrowbar.hpp"
	#include "CfgWeapons\Melee\ItemCrowbar.hpp"
	#include "CfgWeapons\Melee\Crossbow.hpp"
	#include "CfgWeapons\Melee\MeleeBaseBallBat.hpp"
	#include "CfgWeapons\Melee\MeleeBaseBallBatBarbed.hpp"
	#include "CfgWeapons\Melee\MeleeBaseBallBatNails.hpp"
	
	#include "CfgWeapons\Item\ItemWatch.hpp"
	#include "CfgWeapons\Item\ItemMap.hpp"
	#include "CfgWeapons\Item\ItemMap_Debug.hpp"
	#include "CfgWeapons\Item\ItemCompass.hpp"
	#include "CfgWeapons\Item\Flashlight.hpp"
	#include "CfgWeapons\Item\Flare.hpp"
	#include "CfgWeapons\Item\ItemEtool.hpp"
	#include "CfgWeapons\Item\ItemShovel.hpp"
	
	//Sniper Rifle
	//#include "CfgWeapons\Weapon\Sniper\AS50.hpp"
	//#include "CfgWeapons\Weapon\Sniper\M107.hpp"
	
	#include "CfgWeapons\Weapon\Sniper\DMR_DZ.hpp"
//	#include "CfgWeapons\Weapon\Sniper\DMR_DZ2.hpp"
//	#include "CfgWeapons\Weapon\Sniper\DMR_DZ3.hpp"
	
	//crafting
	#include "CfgCrafting\CfgCrafting.hpp"
	
	// Fishing pole melee
	#include "CfgWeapons\DZE\MeleeFishingPole.hpp"
	// Fishing pole toolbelt and loot item
	#include "CfgWeapons\DZE\ItemFishingPole.hpp"

};