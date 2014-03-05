
_dog = _this select 0;
_target = _this select 1;

_sound = createSoundSource ["Sound_BadDog", getPos _dog, [], 0];
_sound attachTo [_dog, [0,0,0]];

while {(alive _dog) && (alive _target)} do
{
	_dog doMove getPos _target;
	If ((_dog distance _target < 2) && (vehicle _target == _target)) Then
	{
		_dog doTarget _target;
		_dog lookAt _target;

		_dog switchMove "CLAY_DogAttack";
		sleep 0.35; 
		_dog setVelocity [0, 0, 2.5];

		If (((boundingBox _target select 1) select 2) > 1) Then
		{
			_target setHit ["legs", 1];
			_target setDamage (damage _target + 0.2);
			_target playMove "AmovPpneMstpSrasWrflDnon";
		}
		Else
		{
			_target setHit ["hands", 1];
			_target setDamage (damage _target + 0.2);
		};
		sleep 1;

		while {(alive _dog) && (alive _target) && (_dog distance _target < 2)} do
		{
			_dog doTarget _target;
			_dog lookAt _target;

			If (random 10 < 3) Then
			{
				_dog switchMove "CLAY_DogAttack";
				sleep 0.35; 
				_dog setVelocity [0, 0, 2.5];
			};

			_target setDamage (damage _target + (0.05 + random 0.05));
			sleep 1;
		};
	};
	sleep 1;
};
deleteVehicle _sound;
