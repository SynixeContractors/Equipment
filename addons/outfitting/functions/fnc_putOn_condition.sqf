#include "..\script_component.hpp"

params ["_target", "_unit", "_args"];
_args params ["_selection", "_weapon"];

if !(call FUNC(canInteract)) exitWith { false };

if !(switch (_selection) do {
    case "ACE_Torso": {
        vest _target == ""
    };
    case "ACE_Head": {
        headgear _target == ""
    };
}) exitWith { false };

[_unit, _weapon] call ace_common_fnc_hasItem
