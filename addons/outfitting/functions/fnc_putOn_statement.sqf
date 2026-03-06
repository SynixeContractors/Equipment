#include "..\script_component.hpp"

if !(call FUNC(canInteract)) exitWith {};

params ["_target", "_unit", "_args"];
_args params ["_selection", "_weapon"];

switch (_selection) do {
    case "ACE_Torso": {
        _target addVest _weapon;
        _unit removeItem _weapon;
    };
    case "ACE_Head": {
        _target addHeadgear _weapon;
        _unit removeItem _weapon;
    };
};
