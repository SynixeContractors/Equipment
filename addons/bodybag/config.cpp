#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            QITEM(bodybag_yellow),
            QITEM(bodybag_empty_yellow),
            QITEM(bodybag_folded_yellow),
            QITEM(bodybag_red),
            QITEM(bodybag_empty_red),
            QITEM(bodybag_folded_red),
            QITEM(bodybag_green),
            QITEM(bodybag_empty_green),
            QITEM(bodybag_folded_green),
        };
        weapons[] = {
            QITEM(bodyBag_yellow),
            QITEM(bodyBag_red),
            QITEM(bodyBag_green),
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "synixe_equipment_main",
            "ace_medical_treatment",
        };
        VERSION_CONFIG;
    };
};

#include "ACE_Medical_Treatment_Actions.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"

class RscBodybag {
    idd = 99033;
    onLoad = QUOTE(_this call FUNC(initBodybag));
};
