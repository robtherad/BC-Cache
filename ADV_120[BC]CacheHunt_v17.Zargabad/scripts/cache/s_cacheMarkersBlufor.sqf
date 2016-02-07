_cacheArray = [cacheAlphaCrate,cacheBravoCrate,cacheCharlieCrate,cacheDeltaCrate,cacheEchoCrate,cacheFoxCrate];

_missionSafeTime = ["f_param_mission_timer",15] call BIS_fnc_getParamValue;
_missionRunTimeMins = ["mission_runtime",60] call BIS_fnc_getParamValue;
_missionFracTime = _missionSafeTime + (_missionRunTimeMins/4);
waitUntil {if (time >= (_missionFracTime*60)) then {true} else {uisleep 10;};}; //Wait for enough time to elapse so the battle can play out a bit


_nextDone = 1;
_getDone = 1.5;
_originalErrorPos = 400;
_originalErrorSize = 750;

while {true} do {
	if (time >= (_missionFracTime*60)*_nextDone) then {
		_passedVars = [];
		{
			_markArray = []; //Use this as a container for each marker
			
			//Add marker name as first variable in container
			_markerName = str(_x) + "MarkBlu";
			_markArray pushBack _markerName;
			
			//Generate positions
			_xPos = ((getPos _x select 0)+(random (_originalErrorPos/_getDone))-((_originalErrorPos/2)/_getDone));
			_yPos = ((getPos _x select 1)+(random (_originalErrorPos/_getDone))-((_originalErrorPos/2)/_getDone));
			_size = _originalErrorSize/_getDone;
		
			//Add positions to container
			_markArray pushBack _xPos;
			_markArray pushBack _yPos;
			_markArray pushBack _size;
			
			//Add container to passed variable list
			_passedVars pushBack _markArray;
		} forEach _cacheArray;
		_nextDone = _nextDone + .25;
		_getDone = _nextDone + .5;
		//Execute client side of script if client is on side west
		[[[_passedVars],"scripts\cache\c_cacheMarkersBlufor.sqf"],"BIS_fnc_execVM",true,false] call BIS_fnc_MP;
	};
	if (time >= ((_missionRunTimeMins*60)-600) && (_nextDone < 10)) then { //10 mins before mission ends
		_passedVars = [];
		{
			_markArray = []; //Use this as a container for each marker
			_markerName = str(_x) + "MarkBlu";
			_markArray pushBack _markerName;
			
			//Generate positions
			_xPos = ((getPos _x select 0)+((random (25))-12.5));
			_yPos = ((getPos _x select 1)+((random (25))-12.5));
			_size = 50;
			
			//Add positions to container
			_markArray pushBack _xPos;
			_markArray pushBack _yPos;
			_markArray pushBack _size;
			_passedVars pushBack _markArray;
		} forEach _cacheArray;
		_nextDone = 50;
		_getDone = 51;
		
		//Execute client side of script if client is on side west
		[[[_passedVars],"scripts\cache\c_cacheMarkersBlufor.sqf"],"BIS_fnc_execVM",true,false] call BIS_fnc_MP;
		//No more need to loop, final update
		if (true) exitWith {};
	};
	uisleep 15;
};