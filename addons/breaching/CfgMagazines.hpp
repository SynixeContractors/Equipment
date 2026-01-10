class CfgMagazines {
    class SLAMDirectionalMine_Wire_Mag;
    class ITEM(BreachingCharge_Mag): SLAMDirectionalMine_Wire_Mag {
        scopeArsenal = 2;
        author = "Mike";
        displayName = "Breaching Charge";
        descriptionShort = "Explosive designed to destroy doors and walls with minimal collateral damage.";
        mass = 5;

        ammo = QITEM(BreachingCharge_Ammo);
        ACEGVAR(explosives,SetupObject) = QITEM(BreachingCharge_Place);

        class ACE_Triggers {
            SupportedTriggers[] = {"Command", "Timer", "MK16_Transmitter"};
        };
    };
};
