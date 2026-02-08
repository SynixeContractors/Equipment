#include "..\script_component.hpp"

params ["_unit", "_uav"];

if (getNumber (configOf _uav >> QGVAR(singleUse)) == 1) exitWith {};

fuel _uav == 0 && {
    QGVAR(battery) in magazines _unit
}
