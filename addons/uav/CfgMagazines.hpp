class CfgMagazines {
    class CA_Magazine;

    class GVAR(battery): CA_Magazine {
        scope = 2;
        author = "Synixe Contractors";
        displayName = "UAV Battery";
        model = "\z\ace\addons\logistics_uavbattery\data\ace_battery.p3d";
        picture = "\z\ace\addons\logistics_uavbattery\ui\UAV_battery_ca.paa";
        descriptionShort = "A UAV battery";
        ACE_isUnique = 1;
        ACE_asItem = 1;
        ace_disableRepacking = 1;
        count = 100;
        mass = 20;
    };

    class GVAR(base): CA_Magazine {
        author = "Synixe Contractors";
        count = 1;
        mass = 500;
        ACE_isUnique = 1;
        ace_disableRepacking = 1;

        model = "\A3\Structures_F_Heli\Items\Luggage\PlasticCase_01_small_F.p3d";
        hiddenSelections[] = {"Camo","Camo2"};
        hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Supplies\Data\PlasticCase_01_black_CO.paa"};
        editorPreview = "\A3\EditorPreviews_F_Enoch\Data\CfgVehicles\Land_PlasticCase_01_small_black_F.jpg";
    };

    // Darter
    class GVAR(base_darter): GVAR(base) {
        count = 100;
        picture = "\A3\Drones_F\Air_F_Gamma\UAV_01\Data\UI\UAV_01_CA.paa";
    };
    class GVAR(B_UAV_01_CASE): GVAR(base_darter) {
        scope = 2;
        scopeCurator = 2;
        displayName = "AR-2 (BLUFOR)";
        descriptionShort = "Contains a BLUFOR AR-2 Darter";
        GVAR(drone) = "B_UAV_01_F";
    };
    class GVAR(I_UAV_01_CASE): GVAR(base_darter) {
        scope = 2;
        scopeCurator = 2;
        displayName = "AR-2 (INDEP)";
        descriptionShort = "Contains an INDEP AR-2 Darter";
        GVAR(drone) = "I_UAV_01_F";
    };
    class GVAR(O_UAV_01_CASE): GVAR(base_darter) {
        scope = 2;
        scopeCurator = 2;
        displayName = "AR-2 (OPFOR)";
        descriptionShort = "Contains an OPFOR AR-2 Darter";
        GVAR(drone) = "O_UAV_01_F";
    };

    // Bustard
    class GVAR(base_bustard): GVAR(base) {
        aid_uav_maxRange = 13000;
        count = 100;
        picture = "\lxWS\air_f_lxWS\Data\UI\UAV_02_CA.paa";
        DLC = "lxWS";
        GVAR(assembled) = QUOTE(_this call FUNC(bustard_assembled));
    };
    class GVAR(B_UAV_02_lxWS_CASE): GVAR(base_bustard) {
        scope = 2;
        scopeCurator = 2;
        displayName = "Bustard (BLUFOR)";
        descriptionShort = "Contains a BLUFOR AP-5 Bustard";
        GVAR(drone) = "B_UAV_02_lxWS";
    };
    class GVAR(I_UAV_02_lxWS_CASE): GVAR(base_bustard) {
        scope = 2;
        scopeCurator = 2;
        displayName = "Bustard (INDEP)";
        descriptionShort = "Contains an INDEP AP-5 Bustard";
        GVAR(drone) = "I_UAV_02_lxWS";
    };
    class GVAR(O_UAV_02_lxWS_CASE): GVAR(base_bustard) {
        scope = 2;
        scopeCurator = 2;
        displayName = "Bustard (OPFOR)";
        descriptionShort = "Contains an OPFOR AP-5 Bustard";
        GVAR(drone) = "O_UAV_02_lxWS";
    };

    // IED Drone
    class GVAR(base_ied): GVAR(base) {
        aid_uav_maxRange = 13000;
        count = 100;
        picture = "\lxWS\air_1_f_lxws\Data\UI\UAV_02_IED_CA.paa";
        DLC = "lxWS";
        GVAR(assembled) = QUOTE(_this call FUNC(ied_assembled));
    };
    class GVAR(B_UAV_02_IED_lxWS_CASE): GVAR(base_ied) {
        scope = 2;
        scopeCurator = 2;
        displayName = "Bustard IED (BLUFOR)";
        descriptionShort = "Contains a BLUFOR AP-5 Bustard IED";
        GVAR(drone) = "B_G_UAV_02_IED_lxWS";
    };
    class GVAR(I_G_UAV_02_IED_lxWS_CASE): GVAR(base_ied) {
        scope = 2;
        scopeCurator = 2;
        displayName = "Bustard IED (INDEP)";
        descriptionShort = "Contains an INDEP AP-5 Bustard IED";
        GVAR(drone) = "I_G_UAV_02_IED_lxWS";
    };
    class GVAR(O_G_UAV_02_IED_lxWS_CASE): GVAR(base_ied) {
        scope = 2;
        scopeCurator = 2;
        displayName = "Bustard IED (OPFOR)";
        descriptionShort = "Contains an OPFOR AP-5 Bustard IED";
        GVAR(drone) = "O_G_UAV_02_IED_lxWS";
    };
};
