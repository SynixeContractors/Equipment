#include "..\script_component.hpp"

params [
    ["_object", objNull, [objNull]],
    ["_key", "", [""]]
];

if (isNull _object) exitWith {
    WARNING("Attempted to remove source with null object");
};

if (_key == "") exitWith {
    WARNING("Attempted to remove source with empty key");
};

private _sources = GVAR(sources) getOrDefaultCall [netId _object, { createHashMap }, true];
_sources deleteAt _key;
