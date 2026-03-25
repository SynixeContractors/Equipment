#include "script_component.hpp"

GVAR(sources) = createHashMap;

GVAR(channels_military) = [];
GVAR(channels_cellphone) = [];
GVAR(channels_wifi) = [];

for "_i" from 1 to 99 do {
    private _freq = ["ACRE_PRC152", "default", _i, "frequencyTX"] call acre_api_fnc_getPresetChannelField;
    GVAR(channels_military) pushBack [_freq, 150000];
};

for "_i" from 650 to 850 do {
    GVAR(channels_cellphone) pushBack [_i, 100000];
};

// 2.4GHz Wi-Fi channels
for "_i" from 2350 to 2450 do {
    GVAR(channels_wifi) pushBack [_i, 100000];
};

// 5GHz Wi-Fi channels
for "_i" from 4950 to 5050 do {
    GVAR(channels_wifi) pushBack [_i, 100000];
};

// 6GHz Wi-Fi channels
for "_i" from 5925 to 7125 step 20 do {
    GVAR(channels_wifi) pushBack [_i, 100000];
};
