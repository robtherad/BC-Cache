// Add clothing
player forceAddUniform "U_O_CombatUniform_ocamo";
player addVest "V_PlateCarrier1_blk";
player addBackpack "B_TacticalPack_ocamo";
player addHeadgear "H_HelmetO_ocamo";

// Add gear
for "_i" from 1 to 8 do {player addItemToUniform "SmokeShell";};
for "_i" from 1 to 9 do {player addItemToVest "30Rnd_65x39_caseless_green";};
for "_i" from 1 to 4 do {player addItemToBackpack "30Rnd_65x39_caseless_green_mag_Tracer";};
for "_i" from 1 to 1 do {player addItemToBackpack "Medikit";};
for "_i" from 1 to 10 do {player addItemToBackpack "FirstAidKit";};
player addWeapon "arifle_Katiba_F";

// Add items
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