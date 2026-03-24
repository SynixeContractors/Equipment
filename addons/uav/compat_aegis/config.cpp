#include "script_component.hpp"

class CfgPatches {
    class DOUBLES(ADDON,SUBCOMPONENT) {
        name = QUOTE(DOUBLES(COMPONENT,SUBCOMPONENT));
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_equipment_uav",
            "A3_Aegis_Air_F_Aegis_UAV_07",
            "A3_Air_F_Exp_UAV_04",
            "ace_realisticnames",
        };
        skipWhenMissingDependencies = 1;
        author = "Synixe Contractors";
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
