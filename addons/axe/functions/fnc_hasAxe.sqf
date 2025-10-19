#include "..\script_component.hpp"

params ["_unit"];

// because I am too lazy to add a config value to mgp
// TODO remove with Synixe MGP
if ("Tomahawk" in backpack _unit) exitWith {true};

private _uniqueItems = +(_unit call ace_common_fnc_uniqueItems);
_uniqueItems append weapons _unit;
_uniqueItems pushBack vest _unit;
_uniqueItems pushBack backpack _unit;

GVAR(classes) findAny _uniqueItems != -1
