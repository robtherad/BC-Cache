#include "veh_settings.sqf";

{ //Ground vehicles
	if (!isNil "_x") then {
		//Add getIn eventHandler
		_x addEventHandler ["GetIn", {
			private ["_veh", "_pos", "_unit"];
			_veh = _this select 0;
			_pos = _this select 1;
			_unit = _this select 2;
			if (!(typeOf _unit == "B_crew_F") && (_pos != "cargo") && (_unit == player)) then {
				_unit action ["GetOut", vehicle _unit];
				titleText ["Only crewmen can operate this vehicle.","PLAIN DOWN",0.2];
			};
			if ((faction _unit != "BLU_F") && (_unit == player)) then {
				_unit action ["GetOut", vehicle _unit];
				titleText ["You don't know how to operate this vehicle.","PLAIN DOWN",0.2];
			};
		}]; //End addEventHandler
		
		//Add getIn eventHandler
		_x addEventHandler ["SeatSwitched", {
			private ["_veh", "_pos", "_unit"];
			_veh = _this select 0;
			_unit = _this select 1;
			_pos = assignedVehicleRole _unit;
			if (!(typeOf _unit == "B_crew_F") && (_pos select 0 != "cargo") && (_unit == player)) then {
				_unit action ["GetOut", vehicle _unit];
				_unit assignAsCargo _veh;
				_unit moveInCargo _veh;
				titleText ["Only crewmen can operate this vehicle.","PLAIN DOWN",0.2];
			};
		}]; //End addEventHandler
	};
} forEach _vehArray;

{ //Helicopters
	if (!isNil "_x") then {
		//Add getIn eventHandler
		_x addEventHandler ["GetIn", {
			private ["_veh", "_pos", "_unit"];
			_veh = _this select 0;
			_pos = _this select 1;
			_unit = _this select 2;
			if (!(typeOf _unit == "B_pilot_F") && (_pos != "cargo") && (_unit == player)) then {
				_unit action ["GetOut", vehicle _unit];
				titleText ["Only pilots can operate this vehicle.","PLAIN DOWN",0.2];
			};
			if ((faction _unit != "BLU_F") && (_unit == player)) then {
				_unit action ["GetOut", vehicle _unit];
				titleText ["You don't know how to operate this vehicle.","PLAIN DOWN",0.2];
			};
		}]; //End addEventHandler
		
		//Add getIn eventHandler
		_x addEventHandler ["SeatSwitched", {
			private ["_veh", "_pos", "_unit"];
			_veh = _this select 0;
			_unit = _this select 1;
			_pos = assignedVehicleRole _unit;
			if (!(typeOf _unit == "B_pilot_F") && (_pos select 0 != "cargo") && (_unit == player)) then {
				_unit action ["GetOut", vehicle _unit];
				_unit assignAsCargo _veh;
				_unit moveInCargo _veh;
				titleText ["Only pilots can operate this vehicle.","PLAIN DOWN",0.2];
			};
		}]; //End addEventHandler
	};
} forEach _heliArray;