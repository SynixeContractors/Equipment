#include "..\script_component.hpp"

params ["_target", "_unit", "_args"];
_args params ["_selection", "_weapon"];

if !(call FUNC(canInteract)) exitWith { false };

if !(_unit canAdd _weapon) exitWith { false };

switch (_selection) do {
    case "ACE_Torso": {
        vest _target == _weapon
    };
    case "ACE_Head": {
        headgear _target == _weapon
    };
}
