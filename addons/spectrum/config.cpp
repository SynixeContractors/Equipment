#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_equipment_main",
            "arc_signal",
        };
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
