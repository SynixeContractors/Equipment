#include "script_component.hpp"

GVAR(uav) = objNull;

GVAR(ppResolution) = ppEffectCreate ["Resolution", 2012];

["ACE_controlledUAV", {
    params ["_uav"];
    if (!GVAR(enabled)) exitWith {
        GVAR(uav) = objNull;
    };
    if (isNull _uav) exitWith {
        GVAR(uav) = objNull;
    };
    if ((!isNull _uav) && isNull GVAR(uav)) then {
        private _config = configOf _uav;
        GVAR(uav) = _uav;
        private _mode = getText (_config >> QGVAR(mode));
        if (_mode isEqualTo "SAT") then {
            GVAR(mode) = "SAT";
            GVAR(satCacheExpiry) = 0;
        } else {
            GVAR(mode) = "LOS";
        };
        [{ call FUNC(signal_pfh)}, 0.25] call CBA_fnc_addPerFrameHandler;
    };
}] call CBA_fnc_addEventHandler;
