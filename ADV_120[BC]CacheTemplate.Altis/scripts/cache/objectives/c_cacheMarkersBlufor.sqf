/*
Activated by s_cacheMarkersBlufor.sqf

Argument format:
[ [_markName, _xPos, _yPos, _size], ... ];

*/
if ((faction player)== "OPF_F") exitWith {};
if (!isNil "f_cam_VirtualCreated") exitWith {};
if (isServer) exitWith {};
#include "obj_settings.sqf";

_passedArray = _this select 0;
//Create the markers for later updating
if (isNil "phx_bluCacheMarkersCreated") then {
	{
		//hint format["%1",_passedArray];
		_markerArray = _x;
	
		//Unpack variables
		_markerName = _markerArray select 0;
		_xPos = _markerArray select 1;
		_yPos = _markerArray select 2;
		_size = _markerArray select 3;
		
		//Create markers
		_markerStr = createMarkerLocal [_markerName,[_xPos,_yPos]];
		_markerName setMarkerShapeLocal "ELLIPSE";
		_markerName setMarkerSizeLocal [_size, _size];
		_markerName setMarkerBrushLocal "Grid";
		_markerName setMarkerColorLocal "ColorOPFOR";
	} forEach _passedArray;
	phx_bluCacheMarkersCreated = true;
};

//Update markers - Only if they are still alive
{
	//hint format["%1",_passedArray];
	_markerArray = _x;
	
	//Unpack variables
	_markerName = _markerArray select 0;
	_xPos = _markerArray select 1;
	_yPos = _markerArray select 2;
	_size = _markerArray select 3;
    diag_log "Size of Marker:";
	diag_log _size;
	//Update marker location
	_markerName setMarkerPos [_xPos,_yPos];
	_markerName setMarkerSize [_size, _size];
} forEach _passedArray;

// Hide rough markers for dead caches
{
    _markerName = str(_x) + "MarkBlu";
    _markerName setMarkerAlphaLocal 0;
} forEach phx_deadCacheArray;
titleText ["Your map has been updated with intel on cache locations.","PLAIN DOWN"];