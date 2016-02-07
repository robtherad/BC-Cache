// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// MAKE SURE THE PLAYER INITIALIZES PROPERLY

if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

// ====================================================================================

// BRIEFING: ADMIN
// The following block of code executes only if the player is the current host
// it automatically includes a file which contains the appropriate briefing data.

if (serverCommandAvailable "#kick") then {
	#include "f\briefing\f_briefing_admin.sqf"
};

//Custom briefing below
player createDiarySubject ["bcRob","[BC] Mission Notes"];
if (side player == west) then {
	player createDiaryRecord ["bcRob", ["BLUFOR Notes", "
	This section contains recommended approaches for BLUFOR to take to try to win the mission. Feel free to use or not use as much of this advice as you want, it's only here to give you some basic ideas. This section is only viewable by members of the BLUFOR side and the OPFOR cannot see it.<br/><br/><br/>
	
	
	=== Recommended Air Asset Use ===<br/>
	The biggest threat to your air assets while they are flying are the 3 enemy pickup trucks with HMGs mounted as well as the enemy MMG teams.<br/><br/><br/>
	
	CH47 - Use it to quickly ferry large amounts of men into an unexpected position. Remember, you can safely fly outside of the infantry AO and the eastern and western edges of the infantry AO have their line of sight blocked by large mountains. Don't be afraid to fly around those mountains and fly back into the infantry AO from the north. The enemy will still probably hear and see you but they will have much less time to react than if you flew over their positions on the way to your LZ.<br/><br/>
	
	MH9 - It may not seem that useful since it can only hold 6 men at a time but later in the mission when you know almost exactly where the caches are it might be useful to quickly redeploy a fireteam to take out an undefended cache. Before that, it is useful as a scout. You can either use it solo, pair it with your AH9, pair it with your APCs to scout out threats ahead of time, or do whatever else you want to do with it. Remember, it's not well armored so you will need to fly fast and I recommend you fly high in order to put more distance between yourself and the enemy HMGs.<br/><br/>
	
	AH9 - Fly high and fast and keep yourself alive. When you see an opportunity, dive in quick and put some rounds down then get the hell out of there. There's no need to linger around at low altitude or low speed if you are not actively engaging a target. If you want to try to bait the OPFOR into revealing their locations try to organize with the MH9 pilot and have HIM fly low and slow near the suspected enemies while you watch to see where they are. Remember, you are the only aerial asset that can also engage enemy targets. Try to protect yourself and conserve your ammo. Even just the idea that you are still lurking around should prevent the enemy from utilizing their vehicles to quickly redeploy. If it doesn't then you will have a nice truck full of guys to blow up.<br/><br/><br/>
	
	
	=== Recommended Ground Asset Use ===<br/>
	The biggest threat to your M113s are the enemy RPGs followed closely by enemy explosive devices.<br/><br/>
	
	The enemy's RPGs can only be ranged out to 200m and your APC crewmen have limited situational awareness when they are buttoned up. Try to keep your APCs in areas where they cannot be sneaked up on by OPFOR. Remember that if you are near a cache location they KNOW you are coming there. They may have planted some explosive satchels in the area or they may have hidden some men in the bushes with RPGs. You may be able to turn this into an advantage for you though. Have a unit approach a suspected cache location very obviously (APC lights on, helicopters above, guns firing, etc.) while another unit makes an approach from a different direction a bit more stealthily and you might take them by surprise. Also, don't forget that the APC commander/gunner can deploy a large field of smoke in front of the APC (default 'C' key) if it or it's infantry needs to withdraw. <br/><br/>
	
	Keep in mind what I said above about APC crews having limited vision when they are turned in. You will likely want to use the APCs to move the infantry close to the area you want them to attack and then have the infantry screen for the APCs.
	"]];
};
if (side player == east) then {
	player createDiaryRecord ["bcRob", ["OPFOR Notes", "
	This section contains recommended approaches for OPFOR to take to try to win the mission.  This section is only viewable by members of the OPFOR side and the BLUFOR cannot see it.<br/><br/>
	
	Figure out your defensive plan and begin moving your men out as quickly as possible. You don't need to have all your squad leaders in front of you to brief them, use your long range radio. Remember that as soon as the safestart ends the BLUFOR will probably begin flying over the AO trying to scout out your positions so you will want your squads already in place and hiding where they need to be. Also, moving vehicles will be pretty easy to spot from the air and will be prime targets for the enemy AH9.<br/><br/>
	
	If you use your vehicles to move out be careful where you leave them. You might want to assign somebody to drive a transport vehicle a few hundred meters away from the positions you are actually occupying so that you can mislead the enemy.<br/><br/>
	
	Remember that if you have your squad's fireteams split up they won't be able to communicate between each other very well. Squad leaders should try to stay in between their two fireteams so they can act as a radio relay if reception is bad or non-existent. Fireteams should be able to receive clearly from any long range radio but they won't be able to respond unless the person they are responding to is within their transmit range.<br/><br/>
	
	You (probably) have fewer men than the BLUFOR force so it may be a good idea to attempt an ambush on them as they head north out of their starting area. You have a few spare RPGs in each cache so don't be afraid to use a few early and then send units to go resupply from the caches.<br/><br/>
	
	To prevent the enemy from having complete air superiority it might be a good idea to concentrate your technicals in one area that you really don't want the enemy to be able to fly over. If the enemy AH9 tries to make an attack run on one technical the other two will have a good chance of shooting it down. Same goes for the other BLUFOR helicopters. It's much harder to dodge fire from 3 separate locations all around you than it is to dodge fire from one location.
	"]];
};
player createDiaryRecord ["bcRob", ["Victory Conditions", "OPFOR can win by having at least one of their caches still alive when the mission ends OR by eliminating the BLUFOR force.<br/><br/>BLUFOR can win by destroying all the caches before the mission ends OR by eliminating the entire OPFOR force."]];
player createDiaryRecord ["bcRob", ["Misc", "- OPFOR: Cache locations and your starting location will not be marked until a few seconds after the mission progresses past the briefing screen.<br/><br/>- OPFOR: Feel free to move anywhere in the AO north of Phase Line Subway during the safe start phase. BLUFOR must stay within their marked area.<br/><br/>- OPFOR: You are not able to move South of Phase Line Subway at any point during the mission. If you try, you will be killed.<br/><br/>- Caches can ONLY be destroyed by satchel charges. When a cache is destroyed it won't disappear for a few seconds but as long as the message saying it has been destroyed pops up in the bottom left corner of your screen and the map marker changes to say destroyed you are good to go.<br/><br/>- BLUFOR: Only Pilots can fly helicopters and only Crewmen can drive/gun APCs. If you didn't slot any of these roles you will not be able to use the assets.<br/><br/>- OPFOR cannot take control of or enter any BLUFOR vehicles. BLUFOR can take control of OPFOR assets although that is up to their commander.<br/><br/>- BLUFOR: Your air assets are able to leave the AO and enter the grayed out area on the map. If you disembark an air asset while outside of the non-shaded area you will be quickly killed.<br/><br/>"]];
player createDiaryRecord ["bcRob", ["Assets", "BLUFOR:<br/>  1x CH47 - No Armaments (Holds 24 + 2 Pilots)<br/>  1x MH9 - No Armaments (Holds 6 + 2 Pilots)<br/>  1x AH9 - 2000rnd Miniguns (Holds 2 Pilots)<br/>  5x M113 APCs - 400rnd M2 HMG .50s (Holds 11 + 2 Crew)<br/><br/>All BLUFOR assets can be slowly repaired and refuelled by bringing them back to the starting area. Also, the CH47 should be able to sling load the M113s.<br/><br/><br/>OPFOR:<br/>  3x Pickup Trucks - 400rnd M2 HMG .50s (Holds 3)<br/>  4x Ural Trucks - No Armaments (Holds 15)"]];
player createDiaryRecord ["bcRob", ["Equipment", "There's strong interference in this area so expect radios to have drastically reduced ranges. Both teams will need to make use of Long Range radios as much as possible for clear communications.<br/><br/><br/>BLUFOR are wearing US Army UCP uniforms and using US equipment. Each member also has GPS and some may come equipped with (1x) optics. Long range radios are present at the Fireteam level and up. BLUFOR has extra ammunition and supplies in the inventory's of their vehicles.<br/><br/>OPFOR are wearing various different outfits with M81 woodland helmets, vests and backpacks. OPFOR are using Russian made equipment. They will not have access to any GPS or optics. There will also only be radios at the Squad level and up. OPFOR can find extra RPGs, ammunition, and supplies at each of their ammo caches."]];
player createDiaryRecord ["bcRob", ["Mission", "BLUFOR must search for and destroy the SIX (6) OPFOR weapons caches located in the AO.<br/><br/>The BLUFOR start with no information on the locations of these weapon caches. About 1/4th of the way through the mission the BLUFOR team will begin to receive inaccurate intelligence reports on the location of the caches. As the mission progresses, the intelligence reports will begin to get more and more accurate until the final report occurs 10 minutes before the mission reaches it's time limit.<br/><br/>Intel reports will be shown as large red circles on the map. These circles are off center and are of different sizes depending on how accurate the intel is.<br/><br/>If a cache is destroyed it will be marked on the map for both the OPFOR and BLUFOR forces as destroyed."]];