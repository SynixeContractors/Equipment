#include "..\script_component.hpp"

params ["_unit", "_uav"];

if (getNumber (configOf _uav >> QGVAR(singleUse)) == 1) exitWith {};

alive _uav && !(isEngineOn _uav)
