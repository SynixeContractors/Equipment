class CfgVehicles {
    class Weapon_Bag_Base;
    class GVAR(uav_bag_base): Weapon_Bag_Base {
        author = "Synixe Contractors";
        mass = 80;
        maximumLoad = 600;
        hiddenSelections[] = {"Camo"};
        hiddenSelectionsMaterials[] = {"\A3\Supplies_F_Orange\Bags\Data\UAV_backpack.rvmat"};
        model = "\A3\Drones_F\Weapons_F_Gamma\Ammoboxes\Bags\UAV_backpack_F.p3d";
    };
    class GVAR(ar2_bag_od): GVAR(uav_bag_base) {
        scope = 2;
        displayName = "UAV Backpack (AR-2, OD)";
        hiddenSelectionsTextures[] = {"\A3\Supplies_F_Orange\Bags\Data\UAV_06_backpack_NATO_co.paa"};
    };
    class GVAR(ar2_bag_green): GVAR(uav_bag_base) {
        scope = 2;
        displayName = "UAV Backpack (AR-2, Green)";
        hiddenSelectionsTextures[] = {"\A3\Supplies_F_Orange\Bags\Data\UAV_06_backpack_AAF_co.paa"};
    };
    class GVAR(ar2_bag_wdl): GVAR(uav_bag_base) {
        scope = 2;
        displayName = "UAV Backpack (AR-2, Woodland)";
        hiddenSelectionsTextures[] = {"\A3\Supplies_F_Enoch\Bags\Data\UAV_backpack_EAF_co.paa"};
    };
    class GVAR(ar2_bag_tan): GVAR(uav_bag_base) {
        scope = 2;
        displayName = "UAV Backpack (AR-2, Tan)";
        hiddenSelectionsTextures[] = {"\A3\Supplies_F_Orange\Bags\Data\UAV_06_backpack_CSAT_co.paa"};
    };

    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(assemble) {
                    displayName = "Assemble";
                    condition = QUOTE([_player] call FUNC(generic_assembleCondition));
                    insertChildren = QUOTE([_player] call FUNC(generic_assembleInsertChildren));
                    statement = "";
                };
            };
        };
    };

    class Air;
    class Helicopter: Air {
        class ACE_Actions {
            class ACE_MainActions;
        };
    };
    class Helicopter_Base_F: Helicopter {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {};
        };
    };

#define PACK  class GVAR(pack) { \
                    displayName = "Pack"; \
                    distance = 4; \
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(generic_packCondition)); \
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(generic_pack)); \
                }
#define BATTERY class GVAR(removeBattery) { \
                    displayName = "Remove Battery"; \
                    distance = 4; \
                    modifierFunction = QUOTE(call FUNC(generic_removeBatteryModify)); \
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(generic_removeBatteryCondition)); \
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(generic_removeBattery)); \
                }; \
                class GVAR(insertBattery) { \
                    displayName = "Insert Battery"; \
                    distance = 4; \
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(generic_insertBatteryCondition)); \
                    statement = ""; \
                    insertChildren = QUOTE([ARR_2(_player,_target)] call FUNC(generic_insertBatteryInsertChildren)); \
                }

    // Darter
    class UAV_01_base_F: Helicopter_Base_F {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                PACK;
                BATTERY;
            };
        };
    };
    class B_UAV_01_F: UAV_01_base_F {
        GVAR(case) = QGVAR(B_UAV_01_CASE);
        delete assembleInfo;
    };
    class I_UAV_01_F: UAV_01_base_F {
        GVAR(case) = QGVAR(I_UAV_01_CASE);
        delete assembleInfo;
    };
    class O_UAV_01_F: UAV_01_base_F {
        GVAR(case) = QGVAR(O_UAV_01_CASE);
        delete assembleInfo;
    };

    // Bustard
    class UAV_02_Base_lxWS: Helicopter_Base_F {
        class EventHandlers;
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                class GVAR(pack) {
                    displayName = "Pack";
                    distance = 4;
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(bustard_packCondition));
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(generic_pack));
                };
                BATTERY;
                // class GVAR(reload) {
                //     displayName = "Reload";
                //     distance = 4;
                //     condition = QUOTE([ARR_2(_player,_target)] call FUNC(bustard_reloadCondition));
                //     statement = QUOTE([ARR_2(_player,_target)] call FUNC(bustard_reload));
                // };
            };
            class GVAR(arm) {
                displayName = "Arm";
                distance = 4;
                condition = QUOTE([ARR_2(_player,_target)] call FUNC(bustard_armCondition));
                statement = QUOTE([ARR_2(_player,_target)] call FUNC(bustard_arm));
                modifierFunction = QUOTE(call FUNC(bustard_armModify));
                position = "[1.88926e-006,6.80166e-005,-0.237018]";
            };
            class GVAR(disarm) {
                displayName = "Disarm";
                distance = 4;
                condition = QUOTE([ARR_2(_player,_target)] call FUNC(bustard_disarmCondition));
                statement = QUOTE([ARR_2(_player,_target)] call FUNC(bustard_disarm));
                modifierFunction = QUOTE(call FUNC(bustard_disarmModify));
                position = "[1.88926e-006,6.80166e-005,-0.237018]";
            };
        };
    };
    class B_UAV_02_lxWS: UAV_02_Base_lxWS {
        GVAR(case) = QGVAR(B_UAV_02_lxWS_CASE);
        delete assembleInfo;
        class EventHandlers: EventHandlers {
            init = QUOTE([_this#0] call FUNC(bustard_init));
            killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
        };
    };
    class I_UAV_02_lxWS: UAV_02_Base_lxWS {
        GVAR(case) = QGVAR(I_UAV_02_lxWS_CASE);
        delete assembleInfo;
        class EventHandlers: EventHandlers {
            init = QUOTE([_this#0] call FUNC(bustard_init));
            killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
        };
    };
    class O_UAV_02_lxWS: UAV_02_Base_lxWS {
        GVAR(case) = QGVAR(O_UAV_02_lxWS_CASE);
        delete assembleInfo;
        class EventHandlers: EventHandlers {
            init = QUOTE([_this#0] call FUNC(bustard_init));
            killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
        };
    };

    // IED UAV
    class UAV_02_IED_Base_lxWS: UAV_02_Base_lxWS {
        class EventHandlers: EventHandlers {};
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                class GVAR(pack): GVAR(pack) {
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(ied_packCondition));
                };
            };
            class GVAR(arm) {};
            class GVAR(disarm) {};
            #define PYLON_Z -0.28
            class GVAR(arm1) {
                displayName = "Arm 1";
                distance = 4;
                condition = QUOTE([ARR_3(_player,_target,1)] call FUNC(ied_armCondition));
                position = QUOTE([ARR_3(0.0351628,0.0354007,PYLON_Z)]);
                insertChildren = QUOTE([ARR_3(_player,_target,1)] call FUNC(ied_armInsertChildren));
            };
            class GVAR(arm2): GVAR(arm1) {
                displayName = "Arm 2";
                condition = QUOTE([ARR_3(_player,_target,2)] call FUNC(ied_armCondition));
                position = QUOTE([ARR_3(-0.0351529,0.0354007,PYLON_Z)]);
                insertChildren = QUOTE([ARR_3(_player,_target,2)] call FUNC(ied_armInsertChildren));
            };
            class GVAR(arm3): GVAR(arm1) {
                displayName = "Arm 3";
                condition = QUOTE([ARR_3(_player,_target,3)] call FUNC(ied_armCondition));
                position = QUOTE([ARR_3(0.0351628,-0.0354006,PYLON_Z)]);
                insertChildren = QUOTE([ARR_3(_player,_target,3)] call FUNC(ied_armInsertChildren));
            };
            class GVAR(arm4): GVAR(arm1) {
                displayName = "Arm 4";
                condition = QUOTE([ARR_3(_player,_target,4)] call FUNC(ied_armCondition));
                position = QUOTE([ARR_3(-0.0351529,-0.0354006,PYLON_Z)]);
                insertChildren = QUOTE([ARR_3(_player,_target,4)] call FUNC(ied_armInsertChildren));
            };
            class GVAR(disarm1): GVAR(arm1) {
                displayName = "Disarm 1";
                condition = QUOTE(([ARR_3(_player,_target,1)] call FUNC(ied_disarmCondition)));
                statement = QUOTE([ARR_3(_player,_target,1)] call FUNC(ied_disarm));
                insertChildren = "";
            };
            class GVAR(disarm2): GVAR(arm2) {
                displayName = "Disarm 2";
                condition = QUOTE(([ARR_3(_player,_target,2)] call FUNC(ied_disarmCondition)));
                statement = QUOTE([ARR_3(_player,_target,2)] call FUNC(ied_disarm));
                insertChildren = "";
            };
            class GVAR(disarm3): GVAR(arm3) {
                displayName = "Disarm 3";
                condition = QUOTE(([ARR_3(_player,_target,3)] call FUNC(ied_disarmCondition)));
                statement = QUOTE([ARR_3(_player,_target,3)] call FUNC(ied_disarm));
                insertChildren = "";
            };
            class GVAR(disarm4): GVAR(arm4) {
                displayName = "Disarm 4";
                condition = QUOTE(([ARR_3(_player,_target,4)] call FUNC(ied_disarmCondition)));
                statement = QUOTE([ARR_3(_player,_target,4)] call FUNC(ied_disarm));
                insertChildren = "";
            };
        };
    };
    class B_G_UAV_02_IED_lxWS: UAV_02_IED_Base_lxWS {
        GVAR(case) = QGVAR(B_UAV_02_IED_lxWS_CASE);
        delete assembleInfo;
        class EventHandlers: EventHandlers {
            init = QUOTE([_this#0] call FUNC(ied_init));
            killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
        };
    };
    class I_G_UAV_02_IED_lxWS: UAV_02_IED_Base_lxWS {
        GVAR(case) = QGVAR(I_G_UAV_02_IED_lxWS_CASE);
        delete assembleInfo;
        class EventHandlers: EventHandlers {
            init = QUOTE([_this#0] call FUNC(ied_init));
            killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
        };
    };
    class O_G_UAV_02_IED_lxWS: UAV_02_IED_Base_lxWS {
        GVAR(case) = QGVAR(O_G_UAV_02_IED_lxWS_CASE);
        delete assembleInfo;
        class EventHandlers: EventHandlers {
            init = QUOTE([_this#0] call FUNC(ied_init));
            killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
        };
    };
};
