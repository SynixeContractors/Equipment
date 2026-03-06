#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_equipment_main",
            "ace_medical_gui",
        };
        author = "Synixe Contractors";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgOutfitting.hpp"
#include "CfgWeapons.hpp"
