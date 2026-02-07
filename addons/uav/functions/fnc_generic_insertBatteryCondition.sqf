#include "..\script_component.hpp"

params ["_unit", "_uav"];

fuel _uav == 0 && {
    QGVAR(battery) in magazines _unit
}
