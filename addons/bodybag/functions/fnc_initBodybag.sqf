#include "..\script_component.hpp"

params ["_display", "_name"];

private _parts = _name splitString ":";
private _name = _parts select 1;
private _color = _parts select 0;

private _texture = if (_color in ["yellow", "red", "green"]) then {
    format [QPATHTOF(data\bodybag_%1_ca.paa), _color]
} else {
    format ["a3\props_f_orange\humanitarian\camps\data\bodybag_01_%1_co.paa", _color]
};

private _ctrlImage = _display ctrlCreate ["ctrlStaticPicture", 500];
_ctrlImage ctrlSetPosition [0,0,1,1];
_ctrlImage ctrlSetText _texture;
_ctrlImage ctrlCommit 0;

private _names = _name splitString " ";
private _firstName = _names select 0;
private _lastName = if (count _names > 1) then {_names select [1, count _names - 1] joinString " "} else {""};

private _ctrlFirst = _display ctrlCreate ["RscText", 501];
_ctrlFirst ctrlSetPosition [0.607,-0.035,1,1];
_ctrlFirst ctrlSetShadow 0;
_ctrlFirst ctrlSetText format ["%1", _firstName];
_ctrlFirst ctrlSetFontHeight (25 * pixelH);
_ctrlFirst ctrlSetTextColor [0, 0, 0, 1];
_ctrlFirst ctrlCommit 0;

if (_lastName != "") then {
    private _ctrlLast = _display ctrlCreate ["RscText", 502];
    _ctrlLast ctrlSetPosition [0.607,-0.025,1,1];
    _ctrlLast ctrlSetShadow 0;
    _ctrlLast ctrlSetText format ["%1", _lastName];
    _ctrlLast ctrlSetFontHeight (25 * pixelH);
    _ctrlLast ctrlSetTextColor [0, 0, 0, 1];
    _ctrlLast ctrlCommit 0;
};

displayUpdate _display;
