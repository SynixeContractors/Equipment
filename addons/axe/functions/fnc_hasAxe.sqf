#include "..\script_component.hpp"

params ["_unit"];

private _uniqueItems = +(_unit call ace_common_fnc_uniqueItems);
_uniqueItems append weapons _unit;
_uniqueItems pushBack vest _unit;
_uniqueItems pushBack backpack _unit;

(uiNamespace getVariable [QGVAR(classes), []]) findAny _uniqueItems != -1
