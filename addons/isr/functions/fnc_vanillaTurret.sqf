#include "..\script_component.hpp"

params ["_unit", "_command"];

switch (_command) do {
    case "setSpeedMode": {
        (uiNamespace getVariable QGVAR(vanilla_group) controlsGroupCtrl 1009) ctrlSetText format ["SPEED [%1]: ", GVAR(speedCurrentMode)];
    };
    case "setAltitudeMode": {
        (uiNamespace getVariable QGVAR(vanilla_group) controlsGroupCtrl 1007) ctrlSetText format ["ALT [%1]: ", GVAR(altCurrentMode)];
    };
};
