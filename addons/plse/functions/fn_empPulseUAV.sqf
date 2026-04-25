params ["_centerPos"];

private _radius = 150;

// Find all air vehicles in radius
private _targets = nearestObjects [_centerPos, ["Air"], _radius];

{
    private _uav = _x;

    // Only affect UAVs
    if (_uav isKindOf "UAV_01_base_F" ||
        _uav isKindOf "UAV_02_base_F" ||
        _uav isKindOf "UAV_03_base_F" ||
        _uav isKindOf "UAV_06_base_F" ||
        _uav isKindOf "UAV_RC40_Base_RF" ||
        _uav isKindOf "UAV_02_Base_lxWS") then {

        private _origFuel = fuel _uav;

        // Kill battery
        _uav setFuel 0;
        _uav engineOn false;
        _uav setVelocity [0,0,-5];

        // Restore after 120 seconds
        [{
            params ["_uav", "_origFuel"];
            if (!isNull _uav && {alive _uav}) then {
                _uav setFuel _origFuel;
            };
        }, [_uav, _origFuel], 120] call CBA_fnc_waitAndExecute;
    };
} forEach _targets;
