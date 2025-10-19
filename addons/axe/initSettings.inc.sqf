[
    QGVAR(timeFactor),
    "SLIDER",
    "Time Factor",
    ["Synixe - Equipment", "AXE"],
    [0.1, 10, 1, 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(maxTime),
    "SLIDER",
    "Max Time",
    ["Synixe - Equipment", "AXE"],
    [5, 120, 20, 0],
    true
] call CBA_fnc_addSetting;
