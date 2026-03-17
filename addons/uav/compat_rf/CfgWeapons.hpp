class CfgWeapons {
    class GrenadeLauncher;
    class Throw: GrenadeLauncher {
        muzzles[] += {QGVAR(RC40_HE)};

        class ThrowMuzzle;
        class GVAR(RC40_HE): ThrowMuzzle {
            magazines[] = {QGVAR(RC40_HE)};
        };
    };
};
