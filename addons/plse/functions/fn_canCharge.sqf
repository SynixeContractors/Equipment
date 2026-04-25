params ["_unit"];
(((unitBackpack _unit) getVariable ["emp_next_charge", 0]) - time < 0)
