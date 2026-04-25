params ["_unit"];
(((unitBackpack _unit) getVariable ["emp_fire_by", 0]) - time > 0)
