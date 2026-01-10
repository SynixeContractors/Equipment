#include "script_component.hpp"

["ace_placedInBodyBag", {
    params ["_unit", "_bodybag"];
    private _name = [_unit, false, true] call ace_common_fnc_getName;
    private _color = switch (typeOf _bodybag) do {
        case "ACE_bodyBagObject_blue";
        case "Land_Bodybag_01_blue_F": {"blue"};
        case "ACE_bodyBagObject_white";
        case "Land_Bodybag_01_white_F": {"white"};
        case "ACE_bodyBagObject_black";
        case "Land_Bodybag_01_black_F": {"black"};
        case QITEM(bodybag_ace_yellow);
        case QITEM(bodybag_yellow): {"yellow"};
        case QITEM(bodybag_ace_red);
        case QITEM(bodybag_red): {"red"};
        case QITEM(bodybag_ace_green);
        case QITEM(bodybag_green): {"green"};
        default {"black"};
    };
    private _arg = format ["#(rgb,2048,2048,10)ui(""RscBodybag"",""%1:%2"", ""ca"")", _color, _name];
    _bodybag setObjectTextureGlobal [0, _arg];
}] call CBA_fnc_addEventHandler;
