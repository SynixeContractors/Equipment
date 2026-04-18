#include "script_component.hpp"

missionNamespace setVariable ["#EM_FMin", 0];
missionNamespace setVariable ["#EM_FMax", 100];

missionNamespace setVariable ["#EM_SelMin", 59];
missionNamespace setVariable ["#EM_SelMax", 60];

missionNamespace setVariable ["#EM_SMin", -130];
missionNamespace setVariable ["#EM_SMax", 10];

missionNamespace setVariable ["#EM_Transmit", false];

GVAR(sources) = createHashMap;
GVAR(sourcesToProcess) = [];
GVAR(sourcesBuilding) = [];
GVAR(sourcesActive) = [];

GVAR(lastRun) = 0;

[{ call FUNC(pfh_updateSources)}, 0.1] call CBA_fnc_addPerFrameHandler;
[{ call FUNC(pfh_updateUI)}] call CBA_fnc_addPerFrameHandler;

addUserActionEventHandler ["nextweapon", "Activate", {
    if (currentWeapon vehicle ace_player != "hgun_esd_01_F") exitWith {};
    call FUNC(settings);
}];

["grad_civs_lifecycle_civ_added", {
    {
        private _seed = parseNumber ((netId _x) select [2,10]);
        private _durationRandom = (_seed random [0,0]) * 0.3;
        private _delayRandom = (_seed random [1,1]) * 8;
        private _freq = (_seed random [1,1]) * 20 + 700;
        [_x, "grad_cell", "CELLPHONE", _freq, 150, 0.05 + _durationRandom, 12 + _delayRandom] call FUNC(addSource);
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

["acre_startedSpeaking", {
    params ["_unit", "_onRadio", "_radioID"];
    if (!_onRadio) exitWith {};
    [QGVAR(remoteStartedSpeaking), [_unit, _radioID]] call CBA_fnc_globalEvent;
}] call CBA_fnc_addEventHandler;

[QGVAR(remoteStartedSpeaking), {
    params ["_unit", "_radioID"];
    private _dataRemote = [_radioID, "getCurrentChannelData"] call acre_sys_data_fnc_dataEvent;
    private _frequencyRemote = _dataRemote getVariable ["frequencyTX", 0];
    private _power = _dataRemote getVariable ["power", 2000];
    GVAR(sources) set [netId _unit, [[_frequencyRemote, _power]]];
}] call CBA_fnc_addEventHandler;

["acre_remoteStoppedSpeaking", {
    params ["_unit"];
    GVAR(sources) deleteAt netId _unit;
}] call CBA_fnc_addEventHandler;

["lambs_danger_OnInformationShared", {
    params ["_unit"];
    private _seed = parseNumber ((netId _unit) select [2,10]);
    private _channelRandom = (_seed random [1,1]) * 20 + 55;
    private _durationRandom = (_seed random [0,0]) * 4;
    [_unit, "lambs_information", "UNIT_RADIO", _channelRandom, 2000, 3 + _durationRandom] call FUNC(addSource);
}] call CBA_fnc_addEventHandler;

["lambs_danger_OnArtilleryCalled", {
    params ["_unit", "_position"];
    private _seed = parseNumber ((netId _unit) select [2,10]);
    private _channelRandom = (_seed random [1,1]) * 20 + 55;
    private _durationRandom = (_seed random [0,0]) * 7;
    [_unit, "lambs_artillery", "SQUAD_RADIO", _channelRandom, 4000, 7 + _durationRandom] call FUNC(addSource);
}] call CBA_fnc_addEventHandler;
