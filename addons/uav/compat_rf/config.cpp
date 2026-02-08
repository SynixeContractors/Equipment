#include "script_component.hpp"

class CfgPatches {
    class DOUBLES(ADDON,SUBCOMPONENT) {
        name = QUOTE(DOUBLES(COMPONENT,SUBCOMPONENT));
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_equipment_uav",
            "RF_Air_RC40",
        };
        skipWhenMissingDependencies = 1;
        author = "Synixe Contractors";
        VERSION_CONFIG;
    };
};

class Extended_InitPost_EventHandlers {
    class UAV_RC40_Base_RF {
        class ADDON {
            init = "removeAllActions (_this select 0);";
        };
    };
};

#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgMagazineWells.hpp"
#include "CfgVehicles.hpp"
