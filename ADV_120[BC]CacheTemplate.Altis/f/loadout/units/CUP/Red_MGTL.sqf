// Add clothing
player forceAddUniform "CUP_U_O_CHDKZ_Kam_02";
player addVest "CUP_V_BAF_Osprey_Mk2_DPM_Scout";
player addBackpack "CUP_B_CivPack_WDL";
player addHeadgear "CUP_H_SLA_Helmet";

// Add gear
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 5 do {player addItemToVest "CUP_1Rnd_HE_GP25_M";};
for "_i" from 1 to 7 do {player addItemToBackpack "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M";};
player addWeapon "CUP_arifle_AK107_GL";
for "_i" from 1 to 4 do {player addItemToVest "CUP_1Rnd_SMOKE_GP25_M";};
for "_i" from 1 to 4 do {player addItemToVest "CUP_IlumFlareWhite_GP25_M";};
for "_i" from 1 to 6 do {player addItemToBackpack "CUP_30Rnd_545x39_AK_M";};
for "_i" from 1 to 2 do {player addItemToBackpack "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M";};
player addWeapon "Binocular";

// Add Items
if ((phx_loadout_radio isEqualTo 0) or (phx_loadout_radio isEqualTo 1)) then {
    player linkItem "ItemRadio";
};
if ((phx_loadout_map isEqualTo 0) or (phx_loadout_map isEqualTo 1)) then {
    player linkItem "ItemMap";
    if ((phx_loadout_gps isEqualTo 0) or (phx_loadout_gps isEqualTo 1)) then {player linkItem "ItemGPS";};
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";

missionNamespace setVariable ["phx_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
