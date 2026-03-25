#include "..\script_component.hpp"

if !("hgun_esd_01_F" in weapons ace_player) exitWith {};

(call FUNC(looking)) params ["_looking", "_incline"];

if (currentWeapon vehicle ace_player == "hgun_esd_01_F") then {
    GVAR(scanDuration) = 0.2;
} else {
    GVAR(scanDuration) = 1.5;
};

private _total = count GVAR(sources);

if (GVAR(toProcess) isEqualTo []) exitWith {
    private _now = diag_tickTime;
    if (_now - GVAR(lastRun) < GVAR(scanDuration)) exitWith {};

    {
        private _freq = _x getVariable ["arc_freq", -1];
        private _power = _x getVariable ["arc_power", -1];
        if (_freq != -1 && _power != -1) then {
            GVAR(sources) set [netId _x, [[_freq, _power]]];
        } else {
            GVAR(sources) deleteAt netId _x;
        };
    } forEach allUnitsUAV;

    GVAR(lastRun) = _now;
    GVAR(toProcess) = GVAR(sources) toArray false;
    GVAR(values) = +GVAR(values_building);
    GVAR(interference) = +GVAR(interference_building);
    private _em_values = [];
    {
        _em_values pushBack _x;
        _em_values pushBack _y;
    } forEach GVAR(values);
    missionNamespace setVariable ["#EM_Values", _em_values];
    GVAR(values_building) = createHashMap;
    GVAR(interference_building) = createHashMap;
};

private _timeSpent = diag_tickTime - GVAR(lastRun);
private _bucket = floor (_total / (GVAR(scanDuration) / diag_deltaTime));

for "_i" from 0 to _bucket do {
    if (GVAR(toProcess) isEqualTo []) then { continue };
    private _start = diag_tickTime;
    private _object = GVAR(toProcess) deleteAt 0;
    _object params ["_x", "_y"];
    private _source = objectFromNetId _x;
    if (isNull _source) then {
        GVAR(sources) deleteAt _x;
        continue;
    };
    if !(alive _source) exitWith {
        GVAR(sources) deleteAt netId _source;
    };
    private _dir = ace_player getDir (
        _source modelToWorld (
            _source selectionPosition ["motor", "HitPoints", "FirstPoint"]
        )
    );
    private _targetDistance = (getPosASL _source) distance2D (getPosASL ace_player);
    private _heightDiff = ((getPosASL _source) select 2) - ((eyePos ace_player) select 2) + (0 boundingBoxReal _source)#1#2;
    private _targetIncline = atan (_heightDiff / _targetDistance);
    private _error = 180 - abs (abs (_dir - _looking) - 180) + ((abs (_incline - _targetIncline)) * 0.8);

    private _last = 0;
    
    {
        _x params ["_f", "_mW"];
        if (_f == 0) then { continue; };
        private _strength = ([_f, _mW, getPosASL ace_player, getPosASL _source] call arc_signal_fnc_calc) select 1;
        private _visualStrength = +_strength;
        _visualStrength = _visualStrength - (_error);
        private _existing = GVAR(interference_building) getOrDefault [_f, -1000];
        if (_existing != -1000) then {
            _strength = _strength max _existing;
        };
        if !(isPlayer _source) then {
            GVAR(interference_building) set [_f, _strength];
        };
        private _existing = GVAR(values_building) getOrDefault [_f, -1000];
        if (_existing == -1000) then {
            GVAR(values_building) set [_f, _visualStrength];
        } else {
            GVAR(values_building) set [_f, _visualStrength max _existing];
        };
        _last = _f;
    } forEach _y;
    GVAR(scanTime) = GVAR(scanTime) max (diag_tickTime - _start);
};
