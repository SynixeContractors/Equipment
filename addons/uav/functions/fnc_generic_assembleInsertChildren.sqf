#include "..\script_component.hpp"

params ["_unit"];

private _children = [];

{
    private _container = _x;
    {
        _x params ["_class", "_count"];
        private _drone = getText (configFile >> "CfgMagazines" >> _class >> QGVAR(drone));
        if (_drone == "") exitWith {
            continue;
        };
        private _droneCfg = configFile >> "CfgVehicles" >> _drone;
        _children pushBack [
            [
                format ["drone_%1", _forEachIndex],
                format ["%1 (%2%3)", getText (_droneCfg >> "displayName"), _count, "%"],
                getText (_droneCfg >> "picture"),
                { [_this select 0, _this select 2] call FUNC(generic_assemble) },
                { true },
                {},
                [_container,_count,_class]
            ] call ace_interact_menu_fnc_createAction,
            [],
            ACE_Player
        ];
    } forEach magazinesAmmoCargo _container;
} forEach [
    uniformContainer _unit,
    vestContainer _unit,
    backpackContainer _unit
];

_children
