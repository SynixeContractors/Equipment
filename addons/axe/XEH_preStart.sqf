#include "script_component.hpp"
#include "XEH_PREP.hpp"

private _axes = (QUOTE(getNumber (_x >> 'synixe_axe') > 0) configClasses (configFile >> "CfgWeapons") apply {configName _x});
_axes append    (QUOTE(getNumber (_x >> 'synixe_axe') > 0) configClasses (configFile >> "CfgVehicles") apply {configName _x});

uiNamespace setVariable [QGVAR(classes), compileFinal (_axes createHashMapFromArray [])];
