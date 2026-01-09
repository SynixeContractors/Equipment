#include "script_component.hpp"

["ace_placedInBodyBag", {
    params ["_unit", "_bodybag"];
    private _name = name _unit;
    private _color = switch (typeOf _bodybag) do {
        case "Land_Bodybag_01_blue_F": {"blue"};
        case "Land_Bodybag_01_white_F": {"white"};
        case "Land_Bodybag_01_black_F": {"black"};
        case QITEM(bodybag_yellow): {"yellow"};
        case QITEM(bodybag_red): {"red"};
        case QITEM(bodybag_green): {"green"};
        default {"black"};
    };
    private _arg = format ["#(rgb,2048,2048,10)ui(""RscBodybag"",""%1:%2"", ""ca"")", _color, _name];
    _bodybag setObjectTextureGlobal [0, _arg];
}] call CBA_fnc_addEventHandler;
