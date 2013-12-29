class CfgVehicles {
	class AllVehicles;
	class Air : AllVehicles
	{
		class NewTurret;
		class ViewPilot;
		class AnimationSources;
	};
	class Helicopter : Air
	{
		class HitPoints;
		class Turrets
        {
            class MainTurret: NewTurret
            {
                class Turrets;
				class ViewOptics;
            };
        };
	};


	//External Class
	class SkodaBase;
	class ATV_Base_EP1;
	class Motorcycle;
	class RubberBoat;
	class UAZ_Unarmed_Base;
	class HMMWV_Base;
	class AH6_Base_EP1;
	class An2_Base_EP1;
	class TT650_Base;
	class V3S_Base;
	class SUV_Base_EP1;
	class Ship;
	//class Bag_Base_EP1;
	//class Bag_Base_BAF;
	class House {
		class DestructionEffects;
	};
	class SpawnableWreck : House {};
	class Strategic;
	class NonStrategic;
	class Land_Fire;
	class Animal;
	class Pastor;

	#include "CfgVehicles\RepairParts.hpp" //names for all reapir parts. Needs moving to hitpoints
	//ZEDS
	#include "CfgVehicles\Zeds\Zeds.hpp" //old type zeds
	#include "CfgVehicles\Zeds\ViralZeds.hpp" //Viral type zeds
	#include "CfgVehicles\Zeds\WildZeds.hpp" //Viral type zeds
	//Survivor Skins
	#include "CfgVehicles\Skins.hpp"
	//Bags
	#include "CfgVehicles\Bags.hpp"
	//DZAnimal and DZ_Fin
	#include "CfgVehicles\Animal.hpp"

	//Includes all DayZ Vehilces
	//Car's
	#include "CfgVehicles\Car\HMMWV.hpp"
	#include "CfgVehicles\Car\CAR_HATCHBACK.hpp"
	#include "CfgVehicles\Car\UAZ_CDF.hpp"
	#include "CfgVehicles\Car\CAR_SEDAN.hpp"
	#include "CfgVehicles\Car\V3S_Civ.hpp"
	#include "CfgVehicles\Car\SUV_DZ.hpp"
	#include "CfgVehicles\Owc\SUV_Armored_DZ.hpp"
	#include "CfgVehicles\Owc\HMMWV_Armored_DZ.hpp"
	#include "CfgVehicles\Owc\HMMWV_M2_DZ.hpp"
	#include "CfgVehicles\Owc\MTVR_DZ.hpp"
	#include "CfgVehicles\Owc\Ural_CDF_DZ.hpp"
	#include "CfgVehicles\Owc\HMMWV_MK19_DZ.hpp"
	//Helicopter's
	#include "CfgVehicles\Helicopter\MI17.hpp"
	#include "CfgVehicles\Helicopter\UH1H.hpp"
	#include "CfgVehicles\Helicopter\UH1H2.hpp"
	#include "CfgVehicles\Helicopter\AH6X.hpp"
	#include "CfgVehicles\Helicopter\MH6J_DZ.hpp"
	#include "CfgVehicles\Helicopter\UH1Y_DZ.hpp"
	#include "CfgVehicles\Helicopter\UH60M_DZ.hpp"
	#include "CfgVehicles\Helicopter\MV22_DZ.hpp"
	#include "CfgVehicles\Helicopter\CH_47F_DZ.hpp"
	#include "CfgVehicles\Helicopter\BAF_Merlin_DZ.hpp"
	#include "CfgVehicles\Helicopter\GyroC_DZ.hpp"
	#include "CfgVehicles\Helicopter\MH6J2_DZ.hpp"
	#include "CfgVehicles\Helicopter\Ka60_GL_DZ.hpp"

	//Wreck's
	#include "CfgVehicles\Helicopter\MI8Wreck.hpp"
	#include "CfgVehicles\Helicopter\UH1Wreck.hpp"
	#include "CfgVehicles\Helicopter\UH60Wreck.hpp"
	//Plane's
	#include "CfgVehicles\Plane\AN2_DZ.hpp"
	//#include "CfgVehicles\Plane\Camel_DZ.hpp"
	//Bikes
	#include "CfgVehicles\Bikes\ATV_US_EP1.hpp"
	#include "CfgVehicles\Bikes\ATV_CZ_EP1.hpp"
	#include "CfgVehicles\Bikes\TT650_Ins.hpp"
	#include "CfgVehicles\Bikes\TT650_Civ.hpp"
	#include "CfgVehicles\Bikes\M1030.hpp"
	//Boat
	#include "CfgVehicles\Boat\PBX.hpp"
	#include "CfgVehicles\Boat\Fishing_Boat.hpp"

	//Includes all Building Stuff
	// This parent class is made to make referring to these objects easier later with allMissionObjects
	#include "CfgVehicles\Buildings\HouseDZ.hpp"
	//Fire
	#include "CfgVehicles\Buildings\Land_Fire.hpp"
	//Buildings
	#include "CfgVehicles\Buildings\Land_Budova4_in.hpp"
	#include "CfgVehicles\Buildings\Land_dum_istan3_pumpa.hpp"
	#include "CfgVehicles\Buildings\Land_dum_olez_istan2_maly2.hpp"
	#include "CfgVehicles\Buildings\Land_A_Crane_02b.hpp"
	#include "CfgVehicles\Buildings\Land_A_FuelStation_Feed.hpp"
	#include "CfgVehicles\Buildings\Land_A_TVTower_Mid.hpp"
	#include "CfgVehicles\Buildings\Land_A_TVTower_Top.hpp"
	#include "CfgVehicles\Buildings\Land_Farm_WTower.hpp"
	#include "CfgVehicles\Buildings\Land_HouseB_Tenement.hpp"
	#include "CfgVehicles\Buildings\Land_Ind_MalyKomin.hpp"
	#include "CfgVehicles\Buildings\Land_komin.hpp"
	#include "CfgVehicles\Buildings\Land_majak.hpp"
	#include "CfgVehicles\Buildings\Land_Mil_ControlTower.hpp"
	#include "CfgVehicles\Buildings\Land_NAV_Lighthouse.hpp"
	#include "CfgVehicles\Buildings\Land_NavigLight.hpp"
	#include "CfgVehicles\Buildings\Land_Rail_Semafor.hpp"
	#include "CfgVehicles\Buildings\Land_Rail_Zavora.hpp"
	#include "CfgVehicles\Buildings\Land_runway_edgelight.hpp"
	#include "CfgVehicles\Buildings\Land_Stoplight.hpp"
	#include "CfgVehicles\Buildings\Land_telek1.hpp"
	#include "CfgVehicles\Buildings\Land_VASICore.hpp"
	#include "CfgVehicles\Buildings\Land_Vysilac_FM.hpp"

	//camo
	#include "CfgVehicles\CamoNetting.hpp"


	//WeaponHolder
	#include "CfgVehicles\WeaponHolder.hpp"

	//itemBox's
	#include "CfgVehicles\CardboardBox.hpp"

	//Tents,storage
	#include "CfgVehicles\Storage.hpp"
	
	// Traps
	#include "CfgVehicles\Traps.hpp"

	//Antihack
	#include "CfgVehicles\antihack_logic.hpp"
	#include "CfgVehicles\antihack_plants.hpp"
	
	//WorldPlants
	class Building;
	class Plant_Base: Building {
		scope = 2;
		displayname = "Plant Sphere 100cm";
		favouritezones = "(meadow) * (forest) * (1 - houses) * (1 - sea)";
	};
	class Dayz_Plant1: Plant_Base {
		displayname = $STR_ITEM_NAME_comfrey;
		output = "equip_comfreyleafs";
		outamount = "1";
		favouritezones = "(meadow) * (forest) * (1 - houses) * (1 - sea)";
		model = "z\addons\dayz_communityassets\models\comfrey_up_mid.p3d";
	};
	class Dayz_Plant2: Plant_Base {
		displayname = $STR_ITEM_NAME_comfrey;
		output = "equip_comfreyleafs";
		outamount = "1";
		favouritezones = "(meadow) * (forest) * (1 - houses) * (1 - sea)";
		model = "z\addons\dayz_communityassets\models\comfrey_up_small.p3d";
	};
	class Dayz_Plant3: Plant_Base {
		displayname = $STR_ITEM_NAME_comfrey;
		output = "equip_comfreyleafs";
		outamount = "1";
		favouritezones = "(meadow) * (forest) * (1 - houses) * (1 - sea)";
		model = "z\addons\dayz_communityassets\models\comfrey_up.p3d";
	};

	class BuiltItems;
	class Wire_cat1 : BuiltItems {
		displayName = $STR_BUILT_WIRE1;
	};
	
	class Wire_cat2 : Wire_cat1 {
		displayName = $STR_BUILT_WIRE2;
	};
	
	class Hedgehog_DZ : BuiltItems {
		displayName = $STR_BUILT_HEDGEHOG;
	};
	
	class Sandbag1_DZ : BuiltItems {
		displayName = $STR_BUILT_SANDBAG;
	}; 
};
class CfgNonAIVehicles {
	#include "CfgVehicles\StreetLamps.hpp"
};
