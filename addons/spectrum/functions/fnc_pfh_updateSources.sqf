#include "..\script_component.hpp"

if !("hgun_esd_01_F" in weapons ace_player) exitWith {};

if (count GVAR(sourcesToProcess) == 0) then {
    GVAR(sourcesActive) = +GVAR(sourcesBuilding);
    GVAR(sourcesBuilding) = [];
    private _sources = +GVAR(sources);
    {
        private _freq = _x getVariable ["arc_freq", -1];
        private _power = _x getVariable ["arc_power", -1];
        if (_freq != -1 && _power != -1) then {
            private _objectSources = GVAR(sources) getOrDefaultCall [netId _x, { createHashMap }, true];
            _objectSources set ["arc_uav_source", ["UAV_SOURCE", _freq, _power, -1, -1]];
            private _controllers = UAVControl _x;
            {
                if (_x < count _controllers) then {
                    private _controller = _controllers select _x;
                    if (!isNull _controller && { _controller != ace_player }) then {
                        private _controllerSources = GVAR(sources) getOrDefaultCall [netId _controller, { createHashMap }, true];
                        _controllerSources set ["arc_uav_command", ["UAV_COMMAND", _freq, _power, -1, -1]];
                    };
                };
            } forEach [0,2];
        };
    } forEach allUnitsUAV;
    GVAR(sourcesToProcess) = _sources toArray false;
};

private _timeBudget = 0.01; // Max time (in seconds) to spend processing sources each frame
private _startTime = diag_tickTime;

while { (diag_tickTime - _startTime) < _timeBudget && count GVAR(sourcesToProcess) > 0 } do {
    private _source = GVAR(sourcesToProcess) deleteAt 0;
    private _sourceObject = _source select 0;
    private _sourceData = _source select 1;
    private _object = objectFromNetId _sourceObject;

    if (isNull _object || { !alive _object }) then {
        GVAR(sources) deleteAt _sourceObject;
        continue;
    };

    private _activeForObject = [];

    {
        _y params [
            ["_profileName", "", [""]],
            ["_frequency", -1, [0]],
            ["_power", -1, [0]],
            ["_duration", -1, [0]],
            ["_interval", -1, [0]]
        ];

        if (_frequency == -1 || _power == -1) then {
            [_object, _x] call FUNC(removeSource);
            continue;
        };

        private _profile = [_profileName] call FUNC(getProfile);
        _profile params ["_powerNoise", "_burstiness", "_freqDrift"];

        // -------------------------
        // TIME LOGIC
        // -------------------------

        // One time signal
        if (_duration != -1 && _interval == -1) then {
            if (_duration < diag_tickTime) then {
                [_object, _x] call FUNC(removeSource);
                continue;
            };
        };

        private _isActive = true;

        // Repeating signal
        if (_duration != -1 && _interval != -1) then {
            private _position = diag_tickTime % _interval;

            if (_position >= _duration) then {
                _isActive = false;
            };
        };

        if (!_isActive) then { continue };

        // -------------------------
        // PROFILE-BASED VARIATION
        // -------------------------

        // 1. Burstiness (packet-style on/off inside active window)
        if (random 1 < _burstiness) then { continue };

        // 2. Power variation (signal strength fluctuation)
        private _noiseFactor = 1 - _powerNoise + (random (_powerNoise * 2));
        private _finalPower = _power * _noiseFactor;

        // 3. Frequency drift (tiny offset)
        private _finalFreq = _frequency + ((random (_freqDrift * 2)) - _freqDrift);

        _activeForObject pushBack [_finalFreq, _finalPower];
    } forEach _sourceData;

    if (_activeForObject isNotEqualTo []) then {
        GVAR(sourcesBuilding) pushBack [_object, _activeForObject];
    };
};
