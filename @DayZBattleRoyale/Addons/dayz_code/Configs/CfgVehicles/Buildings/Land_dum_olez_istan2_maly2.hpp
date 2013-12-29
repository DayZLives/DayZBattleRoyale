
class Land_dum_olez_istan2_maly2: House {
scope = 1;
	model = "z\addons\br_assets\models\chow_dum_olez_istan2_maly.p3d";
	animated = 1;
	  class AnimationSources
  {
   class Door1
   {
    source = "user";
    animPeriod = 1;
    initPhase = 0;
   };
   class Door2
   {
    source = "user";
    animPeriod = 1;
    initPhase = 0;
   };
  };
  class UserActions
  {
   class OpenDoor
   {
    displayName = "Open Door";
    position = "Door1_Button";
    radius = 3;
    onlyForPlayer = 0;
    condition = "this animationPhase ""Door1"" < 0.5";
    statement = "this animate [""Door1"", 1]";
   };
   class CloseDoor: OpenDoor
   {
    displayName = "Close Door";
    condition = "this animationPhase ""Door1"" >= 0.5";
    statement = "this animate [""Door1"", 0]";
   };
   class OpenDoor2
   {
    displayName = "Open Door";
    position = "Door2_Button";
    radius = 2;
    onlyForPlayer = 0;
    condition = "this animationPhase ""Door2"" < 0.5";
    statement = "this animate [""Door2"", 1]";
   };
   class CloseDoor2: OpenDoor2
   {
    displayName = "Close Door";
    condition = "this animationPhase ""Door2"" >= 0.5";
    statement = "this animate [""Door2"", 0]";
   };
   
  };
};

