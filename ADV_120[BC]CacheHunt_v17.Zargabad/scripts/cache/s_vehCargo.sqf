_vehArray = [];
_heliArray = [];
if (!isNil "apc1") then {_vehArray pushBack apc1;};
if (!isNil "apc2") then {_vehArray pushBack apc2;};
if (!isNil "apc3") then {_vehArray pushBack apc3;};
if (!isNil "apc4") then {_vehArray pushBack apc4;};
if (!isNil "apc5") then {_vehArray pushBack apc5;};
if (!isNil "mh9") then {_heliArray pushBack mh9;};
if (!isNil "ch47") then {_heliArray pushBack ch47;};
if (!isNil "ah9") then {_heliArray pushBack ah9;};

{	
	//Remove items from vehicles
	clearWeaponCargoGlobal _x;
	clearMagazineCargoGlobal _x;
	clearBackpackCargoGlobal _x;
	clearItemCargoGlobal _x;
	_x addWeaponCargoGlobal ["rhs_weap_rsp30_white",20];
	_x addItemCargoGlobal ["FirstAidKit", 30];
	_x addItemCargoGlobal ["rhs_mag_an_m8hc", 20];
	_x addMagazineCargoGlobal ["rhsusf_100Rnd_556x45_soft_pouch", 10];
	_x addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 5];
	_x addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 20];
	_x addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", 40];
} forEach _vehArray;

{	
	//Remove items from vehicles
	clearWeaponCargoGlobal _x;
	clearMagazineCargoGlobal _x;
	clearBackpackCargoGlobal _x;
	clearItemCargoGlobal _x;
	
	_x addItemCargoGlobal ["FirstAidKit", 12];
	_x addItemCargoGlobal ["rhs_mag_an_m8hc", 10];
	_x addItemCargoGlobal ["rhs_mag_m18_red", 10];
	_x addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 12];
} forEach _heliArray;