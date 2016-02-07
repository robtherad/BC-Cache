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
for "_i" from 1 to 5 do {player addItemToVest "rhs_30Rnd_545x39_AK_green";};
for "_i" from 1 to 4 do {player addItemToVest "rhs_mag_m18_green";};
for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_m67";};

if ((s_loadout_radio == 0) or (s_loadout_radio == 1)) then {
	player addBackpack "MNP_B_WD_FP";
	for "_i" from 1 to 3 do {player addItemToBackpack "rhs_100Rnd_762x54mmR";};
	player linkItem "ItemRadio";
} else {
	player addBackpack "MNP_B_WD_FP";
	for "_i" from 1 to 3 do {player addItemToBackpack "rhs_100Rnd_762x54mmR";};
};

player addHeadgear "MNP_Helmet_PAGST_M81";
 
player addWeapon "rhs_weap_ak74m";
removeAllPrimaryWeaponItems player;
for "_i" from 1 to 4 do {player addItemToVest "rhs_30Rnd_545x39_AK";};
//Add Flares
for "_i" from 1 to 3 do {player addItemToBackpack "rhs_weap_rsp30_white";};
player addWeapon "rhs_weap_rsp30_white";
//End Flares
player addWeapon "Binocular";
if ((s_loadout_map == 0) or (s_loadout_map == 1)) then {
	player linkItem "ItemMap";
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";

missionNamespace setVariable ["bc_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.