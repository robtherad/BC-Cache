/*
Activated by s_cacheMarkersBlufor.sqf

Argument format:
[ [_markName, _xPos, _yPos, _size], ... ];

*/
if ((faction player)== "OPF_F") exitWith {};
if (!isNil "f_cam_VirtualCreated") exitWith {};

#include "obj_settings.sqf";

_passedArray = _this select 0;
//Create the markers for later updating
if (isNil "bluCacheMarkersCreated") then {
	{
		//hint format["%1",_passedArray];
		_markerArray = _passedArray select (_forEachIndex);
	
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
	} forEach _cacheArray;
	bluCacheMarkersCreated = true;
};

//Update markers
{
	//hint format["%1",_passedArray];
	_markerArray = _passedArray select (_forEachIndex);
	
	//Unpack variables
	_markerName = _markerArray select 0;
	_xPos = _markerArray select 1;
	_yPos = _markerArray select 2;
	_size = _markerArray select 3;
	
	//Update marker location
	_markerName setMarkerPos [_xPos,_yPos];
	_markerName setMarkerSizeLocal [_size, _size];
} forEach _cacheArray;

titleText ["Your map has been updated with intel on cache locations.","PLAIN DOWN"];