class CfgWeapons {
    class Default;
    class Put: Default {
        muzzles[] += {QITEM(BreachingCharge_Muzzle)};

        class PutMuzzle: Default {};
        class ITEM(BreachingCharge_Muzzle): PutMuzzle {
            magazines[] = {QITEM(BreachingCharge_Mag)};
            displayName = "Breaching Charge";
        };
    };
};
