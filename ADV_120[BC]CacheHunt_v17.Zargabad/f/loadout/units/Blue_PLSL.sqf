removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "rhs_uniform_cu_ucp";
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "rhs_mag_an_m8hc";};
player addVest "rhsusf_iotv_ucp_Squadleader";
for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_m67";};
for "_i" from 1 to 5 do {player addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
for "_i" from 1 to 4 do {player addItemToVest "rhs_mag_m18_red";};

player addWeapon "rhs_weap_m4a1_carryhandle";
if ((random 100) > 66) then {player addPrimaryWeaponItem "rhsusf_acc_eotech_552";};
player addPrimaryWeaponItem "rhsusf_acc_anpeq15_light";

if (s_loadout_radio != 3) then {
	player addBackpack "tf_rt1523g_big_bwmod_tropen";
	player linkItem "ItemRadio";
} else {
	player addBackpack "rhsusf_assault_eagleaiii_ucp";
	for "_i" from 1 to 6 do {player addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
};

player addHeadgear "rhsusf_ach_helmet_ucp";
for "_i" from 1 to 4 do {player addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
//Add Flares
for "_i" from 1 to 3 do {player addItemToBackpack "rhs_weap_rsp30_white";};
player addWeapon "rhs_weap_rsp30_white";
//End Flares
player addWeapon "Binocular";
if (s_loadout_map != 3) then {
	player linkItem "ItemMap";
	player linkItem "ItemGPS";
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";

missionNamespace setVariable ["bc_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.