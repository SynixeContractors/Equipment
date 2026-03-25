#include "..\script_component.hpp"

if (getConnectedUAV ace_player isNotEqualTo objNull) then {
    // need to fix with https://community.bistudio.com/wiki/UAVControl
    [getConnectedUAV ace_player, true]
} else {
    [vehicle ace_player, false]
} params ["_vehicle", "_isUAV"];

GVAR(vehicle) = _vehicle;
GVAR(isUAV) = _isUAV;

if (_vehicle isEqualTo ace_player) exitWith {};

// Signal
if (_isUAV) then {
    ["speed", ([_vehicle, GVAR(speedCurrentMode)] call FUNC(getSpeed)) toFixed 0] call FUNC(menu_setControlText);

    [_vehicle, "setAltitudeMode"] call GVAR(vehicleFunction);
    ["alt", ([_vehicle, GVAR(altCurrentMode)] call FUNC(getAltitude)) toFixed 0] call FUNC(menu_setControlText);


    ["signal", format ["%1%%", (100 * EGVAR(uav,currentSignal)) toFixed 0]] call FUNC(menu_setControlText);
    ["connMode", EGVAR(uav,mode)] call FUNC(menu_setControlText);
    if (EGVAR(uav,mode) == "LOS") then {
        ["connFreq", ([_vehicle getVariable [QEGVAR(uav,freq), 1300]] call FUNC(displayFrequency))] call FUNC(menu_setControlText);
        ["connPower", ([_vehicle getVariable [QEGVAR(uav,power), 800]] call FUNC(displayPower))] call FUNC(menu_setControlText);
    } else {
        ["connFreq", ""] call FUNC(menu_setControlText);
        ["connPower", ""] call FUNC(menu_setControlText);
    };
};

[_vehicle] call FUNC(pfh_markers);
[_vehicle] call FUNC(pfh_targets);
