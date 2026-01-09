class CfgWeapons {
    class ACE_bodyBag_blue;

    class ITEM(bodyBag_yellow): ACE_bodyBag_blue {
        displayName = "Body Bag (Yellow)";
        picture = QPATHTOF(data\bodybag_yellow_icon_ca.paa);
        hiddenSelectionsTextures[] = {
            QPATHTOF(data\bodybag_yellow_ca.paa),
        };
        ace_medical_treatment_bodyBagObject = QITEM(bodybag_yellow);
    };
    class ITEM(bodyBag_red): ACE_bodyBag_blue {
        displayName = "Body Bag (Red)";
        picture = QPATHTOF(data\bodybag_red_icon_ca.paa);
        hiddenSelectionsTextures[] = {
            QPATHTOF(data\bodybag_red_ca.paa),
        };
        ace_medical_treatment_bodyBagObject = QITEM(bodybag_red);
    };
    class ITEM(bodyBag_green): ACE_bodyBag_blue {
        displayName = "Body Bag (Green)";
        picture = QPATHTOF(data\bodybag_green_icon_ca.paa);
        hiddenSelectionsTextures[] = {
            QPATHTOF(data\bodybag_green_ca.paa),
        };
        ace_medical_treatment_bodyBagObject = QITEM(bodybag_green);
    };
};
