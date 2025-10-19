#include "..\script_component.hpp"

params ["_unit", "_uav"];

scopeName "main";

{
    if (_x canAdd QGVAR(battery)) exitWith {
        _x addMagazineAmmoCargo [QGVAR(battery), 1, round ((fuel _uav) * 100)];
        breakTo "main";
    };
} forEach [
    vestContainer _unit,
    uniformContainer _unit,
    backpackContainer _unit
];

[_uav, 0] remoteExec ["setFuel", _uav];
[_unit, "MedicOther"] call ace_common_fnc_doGesture;
