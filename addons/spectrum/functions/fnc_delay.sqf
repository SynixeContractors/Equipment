#include "..\script_component.hpp"

if !(hasInterface) exitWith {};

[{
    params ["_args", "_idPFH"];
    _args params ["_object", "_delay", "_signal"];
    if !(alive _object) exitWith {[_idPFH] call CBA_fnc_removePerFrameHandler};
    private _active = _object getVariable [QGVAR(active), false];
    if (_active) then {
        GVAR(sources) deleteAt netId _object;
    } else {
        GVAR(sources) set [netId _object, _signal];
    };
    _object setVariable [QGVAR(active), !_active, true];
}, _this#1, _this] call CBA_fnc_addPerFrameHandler;
