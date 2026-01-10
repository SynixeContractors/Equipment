class CfgAmmo {
    class ClaymoreDirectionalMine_Remote_Ammo;
    class ITEM(BreachingCharge_Ammo): ClaymoreDirectionalMine_Remote_Ammo {
        model = "\A3\Weapons_F\Explosives\mine_SLAM_directional";
        mineModelDisabled = "\A3\Weapons_F\Explosives\mine_SLAM_directional";

        hit = 5;
        indirectHit = 5;
        indirectHitRange = 2;
        defaultMagazine = QITEM(BreachingCharge_Mag);

        ACEGVAR(explosives,magazine) = QITEM(BreachingCharge_Mag);
        ACEGVAR(explosives,Explosive) = QITEM(BreachingCharge_Ammo);
    };
};
