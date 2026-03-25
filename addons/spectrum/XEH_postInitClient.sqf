#include "script_component.hpp"

missionNamespace setVariable ["#EM_FMin", 0];
missionNamespace setVariable ["#EM_FMax", 100];

missionNamespace setVariable ["#EM_SelMin", 59];
missionNamespace setVariable ["#EM_SelMax", 60];

missionNamespace setVariable ["#EM_SMin", -130];
missionNamespace setVariable ["#EM_SMax", 10];

missionNamespace setVariable ["#EM_Transmit", false];

GVAR(toProcess) = GVAR(sources) toArray false;
GVAR(values) = createHashMap;
GVAR(interference) = createHashMap;
GVAR(lastRun) = 0;
GVAR(scanDuration) = 2;
GVAR(scanTime) = 0;

[{ call FUNC(pfh)} ] call CBA_fnc_addPerFrameHandler;

addUserActionEventHandler ["nextweapon", "Activate", {
    if (currentWeapon vehicle ace_player != "hgun_esd_01_F") exitWith {};
    call FUNC(settings);
}];

["grad_civs_lifecycle_civ_added", {
    {
        private _seed = parseNumber ((netId _x) select [2,10]);
        private _delay = (_seed random [0,0]) * 8;
        private _freq = (_seed random [1,1]) * 20 + 700;
        [_x, _delay, [[_freq, 150]]] call FUNC(delay);
    } forEach _this;
}] call CBA_fnc_addEventHandler;

[QGVAR(addSource), {
    params ["_object", "_frequencies"];
    GVAR(sources) set [netId _object, _frequencies];
}] call CBA_fnc_addEventHandler;

[QGVAR(removeSource), {
    params ["_object"];
    GVAR(sources) deleteAt netId _object;
}] call CBA_fnc_addEventHandler;

[QGVAR(addDelay), {
    params ["_object", "_delay", "_frequencies"];
    [_object, _delay, _frequencies] call FUNC(delay);
}] call CBA_fnc_addEventHandler;

[QGVAR(burst), {
    params ["_object", "_frequencies", "_duration"];
    private _id = netId _object;
    GVAR(sources) set [_id, _frequencies];
    [{
        params ["_id"];
        GVAR(sources) deleteAt _id;
    }, [_id], _duration] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

["acre_remoteStartedSpeaking", {
    params ["_unit", ["_onRadio", 0], ["_radioID", ""]];
    if (_onRadio == 0) exitWith {};
    private _dataRemote = [_radioID, "getCurrentChannelData"] call acre_sys_data_fnc_dataEvent;
    private _frequencyRemote = _dataRemote getVariable ["frequencyTX", 0];
    GVAR(sources) set [netId _unit, [[_frequencyRemote, 5000]]];
}] call CBA_fnc_addEventHandler;

["acre_remoteStoppedSpeaking", {
    params ["_unit"];
    GVAR(sources) deleteAt netId _unit;
}] call CBA_fnc_addEventHandler;

["lambs_danger_OnInformationShared", {
    params ["_unit"];
    [QGVAR(burst), [_unit, [[random [55, 65, 75], 2000]], 6]] call CBA_fnc_globalEvent;
}] call CBA_fnc_addEventHandler;

["lambs_danger_OnArtilleryCalled", {
    params ["_unit", "_position"];
    [QGVAR(burst), [_unit, [[random [55, 65, 75], 4000]], 6]] call CBA_fnc_globalEvent;
}] call CBA_fnc_addEventHandler;
