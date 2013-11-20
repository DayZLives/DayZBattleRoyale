class MH6J2_DZ: AH6_Base_EP1
{
	scope = 2;
	side = 2;
	crew = "";
	enablemanualfire = 0;
	typicalCargo[] = {};
	displayname = "MH-6J2 Little Bird";
	displaynameshort = "MH6J2_DZ";
	hiddenselections[] = {"camo1", "camo2"};
	transportsoldier = 5;
	hiddenselectionstextures[] = {"ca\air_e\ah6j\data\ah6_merge1_co.paa", "ca\air_e\ah6j\data\default_co.paa"};
	icon = "\ca\air_e\data\UI\Icon_mh6j_CA.paa";
	model = "\ca\air_e\ah6j\mh6j";
	picture = "\ca\air_e\data\UI\Picture_mh6j_CA.paa";
	radartype = 0;
	class TransportMagazines{};
	class TransportWeapons{};
	weapons[] = {"TwinM134", "CMFlareLauncher"};
	magazines[] = {"4000Rnd_762x51_M134", "60Rnd_CMFlareMagazine"};
	commanderCanSee = 2+16+32;
	gunnerCanSee = 2+16+32;
	driverCanSee = 2+16+32;
	transportMaxWeapons = 3;
	transportMaxMagazines = 20;
	transportmaxbackpacks = 1;
	class Turrets {};
};