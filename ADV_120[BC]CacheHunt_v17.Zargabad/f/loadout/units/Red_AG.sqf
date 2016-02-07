removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

_uniforms = ["MNP_CombatUniform_Rebel_B","MNP_CombatUniform_Rebel_A","MNP_CombatUniform_RO_Rg","MNP_CombatUniform_RO2_Rg","MNP_CombatUniform_Militia_A","MNP_CombatUniform_Militia_B","MNP_CombatUniform_Militia_C"];
player forceAddUniform (_uniforms select (floor(random (count(_uniforms)))));
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
player addVest "MNP_Vest_Light_M81";
for "_i" from 1 to 4 do {player addItemToVest "rhs_mag_an_m8hc";};
for "_i" from 1 to 5 do {player addItemToVest "rhs_30Rnd_762x39mm";};
for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_m67";};
player addBackpack "MNP_B_WD_FP";
for "_i" from 1 to 6 do {player addItemToBackpack "rhs_30Rnd_762x39mm";};
for "_i" from 1 to 4 do {player addItemToBackpack "rhs_100Rnd_762x54mmR";};
player addHeadgear "MNP_Helmet_PAGST_M81";
 
player addWeapon "rhs_weap_akm";
removeAllPrimaryWeaponItems player;
player addWeapon "Binocular";
if (s_loadout_map == 0) then {
	player linkItem "ItemMap";
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";
if (s_loadout_radio == 0) then {
	player linkItem "ItemRadio";
};

missionNamespace setVariable ["bc_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.