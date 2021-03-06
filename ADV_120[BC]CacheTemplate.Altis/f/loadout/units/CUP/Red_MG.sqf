// Add clothing
player forceAddUniform "CUP_U_O_CHDKZ_Kam_02";
player addVest "CUP_V_BAF_Osprey_Mk2_DPM_Scout";
player addBackpack "CUP_B_CivPack_WDL";
player addHeadgear "CUP_H_SLA_Helmet";

// Add gear
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 3 do {player addItemToBackpack "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M";};
player addWeapon "CUP_lmg_PKM";

// Add Items
if (phx_loadout_map isEqualTo 0) then {
    player linkItem "ItemMap";
    if (phx_loadout_gps isEqualTo 0) then {player linkItem "ItemGPS";};
};
player linkItem "ItemCompass";
player linkItem "ItemWatch";
if (phx_loadout_radio isEqualTo 0) then {
    player linkItem "ItemRadio";
};

missionNamespace setVariable ["phx_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
