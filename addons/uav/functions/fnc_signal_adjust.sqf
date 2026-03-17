#include "..\script_component.hpp"

params ["_uav", "_signal"];

private _currentFreq = _uav getVariable [QGVAR(freq), 1300];
private _currentPower = _uav getVariable [QGVAR(power), 800];
private _powerLevels = _uav getVariable [QGVAR(powerOptions), [200, 300, 400, 600, 800, 1200, 1800]];
private _freqLevels = _uav getVariable [QGVAR(freqOptions), [433, 915, 1200, 2400, 5800]];

private _powerIndex = _powerLevels find _currentPower;
private _freqIndex = _freqLevels find _currentFreq;

// Signal is very strong — try to reduce power
if (_signal > 0.8) then {
    if (_powerIndex > 0) then {
        private _newPower = _powerLevels select (_powerIndex - 1);
        _uav setVariable [QGVAR(power), _newPower, true];
        if (aid_debug) then {
            systemChat format ["[%1] Signal strong. Lowering power to %2mW", _uav, _newPower];
        };
    };
};

// Signal is weak — increase power
if (_signal <= 0.20) then {
    if (_powerIndex < (count _powerLevels) - 1) exitWith {
        private _newPower = _powerLevels select (_powerIndex + 1);
        _uav setVariable [QGVAR(power), _newPower, true];
        if (aid_debug) then {
            systemChat format ["[%1] Signal low. Boosting power to %2mW", _uav, _newPower];
        };
    };
    // No more power levels, drop frequency if possible
    if (_freqIndex > 0) exitWith {
        private _newFreq = _freqLevels select (_freqIndex - 1);
        _uav setVariable [QGVAR(freq), _newFreq, true];
        if (aid_debug) then {
            systemChat format ["[%1] Signal low and at max power. Dropping frequency to %2MHz", _uav, _newFreq];
        };
    };
    if (aid_debug) then {
        systemChat format ["[%1] Signal critical. No more fallback options.", _uav];
    };
};
