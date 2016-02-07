// F3 Set Group IDs
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// This script has been modified from it's original form.
// ====================================================================================

// OPEN THE ARRAY CONTAING ALL GROUPS
// Do not comment or delete this line!
_groups = [

// ====================================================================================
// Automatically assigns intelligible names to groups
// format: [group,groupID,BC_LongName]


// BLUFOR
["Blue_HQ","HQ","Headquarters",2],
["Blue_P1","P","Pilots",2],
["Blue_HQV","HQV","HQ Vehicle Crew",1],

["Blue_AV","AV","Alpha Vehicle Crew",0],
["Blue_A","A","Alpha Squad",1],
["Blue_A1","A1","Alpha One",0],
["Blue_A2","A2","Alpha Two",0],

["Blue_BV","BV","Bravo Vehicle Crew",0],
["Blue_B","B","Bravo Squad",1],
["Blue_B1","B1","Bravo One",0],
["Blue_B2","B2","Bravo Two",0],

["Blue_CV","CV","Charlie Vehicle Crew"],
["Blue_C","C","Charlie Squad",1],
["Blue_C1","C1","Charlie One",0],
["Blue_C2","C2","Charlie Two",0],

["Blue_DV","DV","Delta Vehicle Crew"],
["Blue_D","D","Delta Squad",1],
["Blue_D1","D1","Delta One",0],
["Blue_D2","D2","Delta Two",0],


// REDFOR
["Red_HQ","HQ","Headquarters",2],

["Red_E","E","Echo Squad",1],
["Red_E1","E1","Echo One",0],
["Red_E2","E2","Echo Two",0],

["Red_F","F","Foxtrot Squad",1],
["Red_F1","F1","Foxtrot One",0],
["Red_F2","F2","Foxtrot Two",0],

["Red_G","G","Golf Squad",1],
["Red_G1","G1","Golf One",0],
["Red_G2","G2","Golf Two",0],

["Red_H","H","Hotel Squad",1],
["Red_H1","H1","Hotel One",0],
["Red_H2","H2","Hotel Two",0],
["Red_H3","H3","Hotel Three",0],
["Red_H4","H4","Hotel Four",0]

// Always make sure there's no comma after the last entry!

// ====================================================================================

// END OF THE ARRAY CONTAING ALL GROUPS
// Do not comment or delete this line!
];

// ====================================================================================

// SET THE GROUP IDS

private ["_grp"];
{
    // Check first if the group exists
    _grp = missionNamespace getVariable[(_x select 0),grpNull];
    if(!isNull _grp) then {
        _grp setGroupId [(_x select 1),"GroupColor0"];
		_grp setVariable ["BC_LongName",_x select 2];
    };
} forEach _groups;