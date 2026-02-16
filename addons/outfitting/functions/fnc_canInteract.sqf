#include "..\script_component.hpp"

params ["_target", "_unit"];

if (isPlayer _target) exitWith { false };
// TODO prevent interaction with hostile units

true
