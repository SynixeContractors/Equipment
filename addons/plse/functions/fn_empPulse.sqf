params ["_centerPos"];

private _radius = 150;
private _dist = ACE_player distance2D _centerPos;
private _rel = 1 - (_dist / _radius);
private _pain = 0.3 * _rel;

[ACE_player, _pain] call ace_medical_fnc_adjustPainLevel;
ACE_player setVariable ["is_emp", true, true];
