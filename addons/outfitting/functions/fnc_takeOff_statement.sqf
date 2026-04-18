#include "..\script_component.hpp"

if !(call FUNC(canInteract)) exitWith {};

params ["_target", "_unit", "_args"];
_args params ["_selection", "_weapon"];

switch (_selection) do {
    case "ACE_Torso": {
        [_unit, "MedicOther"] call ace_common_fnc_doGesture;
        removeVest _target;
        _unit addItem _weapon;
    };
    case "ACE_Head": {
        [_unit, "PutDown"] call ace_common_fnc_doGesture;
        removeHeadgear _target;
        _unit addItem _weapon;
    };
};
