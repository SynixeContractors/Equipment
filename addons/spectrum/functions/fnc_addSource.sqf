#include "..\script_component.hpp"

params [
    ["_object", objNull, [objNull]],
    ["_key", "", [""]],
    ["_profile", "", [""]],
    ["_frequency", -1, [0]],
    ["_power", -1, [0]],
    ["_duration", -1, [0]],
    ["_interval", -1, [0]]
];

if (isNull _object) exitWith {
    WARNING("Attempted to add source with null object");
};

if (_key == "") exitWith {
    WARNING("Attempted to add source with empty key");
};

if (_frequency == -1 || _power == -1) exitWith {
    WARNING("Attempted to add source with invalid frequency or power");
};

private _sources = GVAR(sources) getOrDefaultCall [netId _object, { createHashMap }, true];

// A one time signal
if (_duration != -1 && _interval == -1) then {
    _duration = diag_tickTime + _duration;
};

_sources set [_key, [_profile, _frequency, _power, _duration, _interval]];
