#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

{
    private _selection = configName _x;
    {
        private _weapon = configName _x;
        private _config = configFile >> "CfgWeapons" >> _weapon;
        private _icon = getText (_config >> "picture");
        private _display = getText (_config >> "displayName");
        private _action = [
            format [QGVAR(putOn_%1_%2), _selection, _weapon],
            format ["Put on %1", _display],
            _icon,
            FUNC(putOn_statement),
            FUNC(putOn_condition),
            {},
            [_selection, _weapon]
        ] call ace_interact_menu_fnc_createAction;
        ["CAManBase", 0, [_selection], _action, true] call ace_interact_menu_fnc_addActionToClass;

        private _action = [
            format [QGVAR(takeOff_%1_%2), _selection, _weapon],
            format ["Take off %1", _display],
            _icon,
            FUNC(takeOff_statement),
            FUNC(takeOff_condition),
            {},
            [_selection, _weapon]
        ] call ace_interact_menu_fnc_createAction;
        ["CAManBase", 0, [_selection], _action, true] call ace_interact_menu_fnc_addActionToClass;
    } forEach (configProperties [_x, "true", true]);
} forEach ("true" configClasses (configFile >> "CfgOutfitting"));

ADDON = true;
