#include "..\script_component.hpp"

private _unit = missionNamespace getVariable [QGVAR(unit), 1];
private _unitIndex = switch (_unit) do {
    case 0.001: { 0 }; // kHz
    case 1000: { 2 }; // GHz
    default { 1 }; // MHz
};
[
    "Change Settings",
    [
        [
            "SLIDER",
            "Min Frequency",
            [
                0,
                1000,
                (missionNamespace getVariable ["#EM_FMin", 0]) / _unit,
                0
            ]
        ],
        [
            "SLIDER",
            "Window",
            [
                1,
                10000,
                (missionNamespace getVariable [QGVAR(window), 100]),
                0
            ]
        ],
        [
            "SLIDER",
            "Selector",
            [
                0.1,
                100,
                (missionNamespace getVariable [QGVAR(selector), 1]),
                0
            ]
        ],
        [
            "COMBO",
            "Unit",
            [
                [
                    0.001,
                    1,
                    1000
                ],
                [
                    "kHz",
                    "MHz",
                    "GHz"
                ],
                _unitIndex
            ]
        ]
    ],
    {
        params ["_values"];
        _values params ["_fMin", "_window", "_selector", "_unit"];
        private _min = _fMin * _unit;
        private _max = _min + (_window * _unit);
        // Minimum of 10 Mhz, Maximum of 6 Ghz
        private _fmin = (_min max 1) min (6000);
        private _fmax = (_max max 1) min (6000);
        missionNamespace setVariable ["#EM_FMin", _fmin];
        missionNamespace setVariable ["#EM_FMax", _fmax];
        private _start = (_min + ((_max - _min) / 2));
        missionNamespace setVariable ["#EM_SelMin", _start];
        missionNamespace setVariable ["#EM_SelMax", _start + (_selector * _unit)];
        missionNamespace setVariable [QGVAR(unit), _unit];
        missionNamespace setVariable [QGVAR(window), _window];
        missionNamespace setVariable [QGVAR(selector), _selector];
    }
] call zen_dialog_fnc_create;
