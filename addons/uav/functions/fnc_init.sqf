#include "..\script_component.hpp"

params ["_uav"];

if !(unitIsUAV _uav) exitWith {};

private _config = configOf _uav;
if !(_uav getVariable [QGVAR(init), false]) then {
    _uav setVariable [QGVAR(init), true];
    _uav setVariable [QGVAR(autoAdjust), true];
    private _defaultFreq = getNumber (_config >> QGVAR(defaultFreq));
    if (_defaultFreq isNotEqualTo 0) then {
        _uav setVariable [QGVAR(freq), _defaultFreq];
    };
    private _defaultPower = getNumber (_config >> QGVAR(defaultPower));
    if (_defaultPower isNotEqualTo 0) then {
        _uav setVariable [QGVAR(power), _defaultPower];
    };
    private _defaultFreqOptions = getArray (_config >> QGVAR(freq));
    if (_defaultFreqOptions isNotEqualTo []) then {
        _uav setVariable [QGVAR(freqOptions), _defaultFreqOptions];
    };
    private _defaultPowerOptions = getArray (_config >> QGVAR(power));
    if (_defaultPowerOptions isNotEqualTo []) then {
        _uav setVariable [QGVAR(powerOptions), _defaultPowerOptions];
    };
};
