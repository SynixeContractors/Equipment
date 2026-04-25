class CfgVehicles {
    class B_RadioBag_01_black_F;
    class plse_backpack: B_RadioBag_01_black_F {
        scope = 2;
        displayName = "PLSE System";
        author = "Synixe Contractors";
        maximumLoad = 40;
        mass = 180;
    };

    class Man;
    class CAManBase: Man {

        class ACE_SelfActions {
            class ACE_Equipment {

                class EMP_Pulse_Root {
                    displayName = "PLSE System";
                    condition = "backpack _player == 'plse_backpack'";
                    statement = "";

                    class ChargeEMP {
                        displayName = "Charge EMP";
                        condition = "([_player] call plse_fnc_hasUAVBattery) &&
                                     ([_player] call plse_fnc_canCharge) &&
                                     !([_player] call plse_fnc_canFire)";

                        statement = "['FD_Finish_F', _player] remoteExec ['playSound3D', 0];
                            [12 + random 5, [], {
                                playSound3D ['FD_CP_Not_Clear_F', _player];
                                ACE_player removeItem 'ACE_UAVBattery';
                                (unitBackpack ACE_player) setVariable ['emp_fire_by', time + 120, true];
                            }, {}, 'Charging EMP Pulse...'] call ace_common_fnc_progressBar;";
                    };

                    class FireEMP {
                        displayName = "Fire EMP";
                        condition = "([_player] call plse_fnc_canFire)";

                        statement = "[5, [], {
                                playSound3D ['FD_CP_Clear_F', _player];
                                [getPosASL ACE_player] call plse_fnc_empPulseUAV;
                                ACE_player setVariable ['emp_ready', false, false];
                                (unitBackpack ACE_player) setVariable ['emp_next_charge', time + 340 + random 40, true];
                                (unitBackpack ACE_player) setVariable ['emp_fire_by', 0, true];
                            }, {}, 'Firing EMP Pulse...'] call ace_common_fnc_progressBar;";
                    };
                };
            };
        };
    };
};
