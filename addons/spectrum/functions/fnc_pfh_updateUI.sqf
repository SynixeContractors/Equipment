#include "..\script_component.hpp"

if !("hgun_esd_01_F" in weapons ace_player) exitWith {};

(call FUNC(looking)) params ["_looking", "_incline"];

private _duration = [1, 0.05] select (currentWeapon vehicle ace_player == "hgun_esd_01_F");

private _now = diag_tickTime;
if (_now - GVAR(lastRun) < _duration) exitWith {};
GVAR(lastRun) = _now;

private _values = createHashMap;

{
    _x params ["_object", "_signals"];

    if (_object == ace_player) then { continue; };

    private _dir = ace_player getDir (
        _object modelToWorld (
            _object selectionPosition ["motor", "HitPoints", "FirstPoint"]
        )
    );
    private _targetDistance = (getPosASL _object) distance2D (getPosASL ace_player);
    private _heightDiff = ((getPosASL _object) select 2) - ((eyePos ace_player) select 2) + (0 boundingBoxReal _object)#1#2;
    private _targetIncline = if (_targetDistance == 0) then { 0 } else { atan (_heightDiff / _targetDistance) };
    private _error = 180 - abs (abs (_dir - _looking) - 180) + ((abs (_incline - _targetIncline)) * 0.8);

    {
        _x params ["_f", "_mW"];
        if (_f == 0) then { continue; };
        private _strength = ([_f, _mW, getPosASL ace_player, getPosASL _object] call arc_signal_fnc_calc) select 1;
        private _visualStrength = _strength - _error;
        _values set [_f, _visualStrength max (_values getOrDefault [_f, -1000])];
    } forEach _signals;
} forEach GVAR(sourcesActive);

private _em_values = [];
{
    _em_values pushBack _x;
    _em_values pushBack _y;
} forEach _values;

missionNamespace setVariable ["#EM_Values", _em_values];
