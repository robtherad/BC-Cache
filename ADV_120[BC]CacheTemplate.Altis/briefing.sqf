// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// MAKE SURE THE PLAYER INITIALIZES PROPERLY

if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

// ====================================================================================
// Create Phalanx Diary Entry
PHX_Diary = player createDiarySubject ["PHX_Diary", "[PHX] Misc Info"];
player createDiaryRecord ["PHX_Diary", ["Bug Reports", "  This mission uses the Phalanx Mission Template. If you notice any bugs please contact robtherad via discord or send an email to robtherad@gmail.com with as much information as you can. Please include the mission name and version."]];

// ====================================================================================
// BRIEFING: ADMIN
// The following block of code executes only if the player is the current host
// it automatically includes a file which contains the appropriate briefing data.

if (isMultiplayer) then {
    if (serverCommandAvailable "#kick") then {
        #include "f\briefing\f_briefing_admin.sqf"
    };
} else {
    #include "f\briefing\f_briefing_admin.sqf"
};
// ====================================================================================

player createDiaryRecord ["diary", ["Misc Info", " BLUFOR are wearing Army UCP camo. OPFOR are wearing M81 woodland helmets, vests, and backpacks with a mix of different uniforms.<br/><br/> BLUFOR players have a chance to spawn with various unmagnified weapon optics.<br/><br/> All BLUFOR players have GPS while nobody on OPFOR has GPS.<br/><br/> Feel free to use any items that happen to be present in vehicles or weapons caches.<br/><br/> At their spawn, BLUFOR have three crates with ammunition which can be sling loaded by any of the helicopters and transported into the AO.<br/><br/> The CH47 can slingload an M113.
"]];
player createDiaryRecord ["diary", ["Assets", "Teams are unable to use each other's assets. For BLUFOR, only crewmen can operate APCs and only pilots can operate helicopters.<br /><br />

BLUFOR<br />
- 4x M113 w/ M2 HMG - Holds 11 + 2 crew<br />
- 1x HMMV (unarmed) - Holds 4<br />
- 1x MH9 (unarmed) - Holds 6 + 2 pilots<br />
- 1x AH9 (miniguns only) - Holds 2 pilots<br />
- 1x CH47 (unarmed) - Holds 25 + 4 pilots<br /><br />
BLUFOR can repair and refuel their vehicles by moving them within the circle of their starting zone. Helicopters must be on the ground to be repaired and refuelled.
<br /><br /><br />
OPFOR<br />
- 4x URAL Trucks - Holds 15<br />
- 2x UAZ w/ DShKM - Holds 3<br />
"]];
player createDiaryRecord ["diary", ["Important Info", " Both teams have a random starting location. BLUFOR start somewhere outside the large red area marked 'OPFOR AO Limit' while OPFOR start somewhere inside it. BLUFOR are able to go anywhere on the map, even into the grayed out areas. OPFOR must stay inside the marked area or they will be killed.<br /><br /> During Safestart OPFOR are allowed to move freely within the marked area so that they can prepare their defence. BLUFOR must stay in their starting area until after safestart has ended.<br /><br /> Caches can be destroyed ONLY by using satchel charges.<br /><br /> It is very important that OPFOR make good use of their ability to move throughout the AO during safestart. Trucks filled with men make great, easy targets for for the BLUFOR's AH9. Remember, you can always brief over the radio.
"]];
player createDiaryRecord ["diary", ["Mission", " OPFOR have FIVE weapons caches in the marked area. To be victorious, BLUFOR have to search for and destroy ALL FIVE before the mission concludes OR they have to eliminate the entire OPFOR force.<br /><br /> At the start of the mission, the BLUFOR forces do not have any knowledge of where the cache locations are. About a quarter of a way through the mission's time limit BLUFOR will begin getting vague intel reports on the locations of the caches represented as red circles on their maps.<br /><br /> As the mission progresses further the intel will slowly begin to get more accurate until the final intel report 10 minutes before the mission ends. The final intel report will give the BLUFOR players a 100 meter radius within which they will need to search for each cache.
"]];
