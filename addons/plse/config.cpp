#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_factions_base_vehicles"
        };
        author = "Synixe Contractors";
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"

class CfgFunctions {
    class plse {
        tag = "plse";

        class functions {
            file = "s\synixe_factions\addons\plse\functions";

            class empPulse {
                file = "s\synixe_factions\addons\plse\functions\fn_empPulse.sqf";
            };

            class empPulseUAV {
                file = "s\synixe_factions\addons\plse\functions\fn_empPulseUAV.sqf";
            };

            class hasUAVBattery {
                file = "s\synixe_factions\addons\plse\functions\fn_hasUAVBattery.sqf";
            };

            class canCharge {
                file = "s\synixe_factions\addons\plse\functions\fn_canCharge.sqf";
            };

            class canFire {
                file = "s\synixe_factions\addons\plse\functions\fn_canFire.sqf";
            };
        };
    };
};


