//This script isn't worth running since it seems like there's no way to remove the default helicopter crosshairs without an addon.
//Only add the eventhandler if the player is a pilot.
sleep 5;
if (typeOf player == "B_Pilot_F") then {
	["bc_ah9_crosshair", "onEachFrame", {
		 if ((typeOf player == "B_Pilot_F") && (typeOf (vehicle player) == "B_Heli_Light_01_armed_F") && (driver (vehicle player) == player) && (cameraView == "INTERNAL") && (isEngineOn (vehicle player))) then {
			//map\markers\HandDrawn\dot_CA.paa
			drawIcon3D ["\A3\ui_f\data\map\markers\military\dot_CA.paa", [0,.5,0,1], (vehicle player) modelToWorldVisual [-.345,301.75,.615], .5, .5, 0, "", 2, 0.05, "TahomaB"];
			drawIcon3D ["\A3\ui_f\data\map\markers\military\dot_CA.paa", [0,.5,0,.5], (vehicle player) modelToWorldVisual [-.345,301.75,.615], .95, .95, 0, "", 2, 0.05, "TahomaB"];
		 };
	}] call BIS_fnc_addStackedEventHandler;
};