class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;
    class CLASS(hvi_helmet_packed): ACE_ItemCore {
        scope = 2;
        scopeArsenal = 2;
        displayName = "HVI Helmet";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 13.6;
        };
    };

    class CLASS(hvi_vest_packed): ACE_ItemCore {
        scope = 2;
        scopeArsenal = 2;
        displayName = "HVI Vest";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 27.2;
        };
    };

    class H_PASGT_basic_black_F;
    class CLASS(hvi_helmet): H_PASGT_basic_black_F {
        scope = 2;
        displayName = "HVI Helmet";
        author = "Synixe Contractors";
    };

    class V_CarrierRigKBT_01_Black_F;
    class CLASS(hvi_vest): V_CarrierRigKBT_01_Black_F {
        scope = 2;
        displayName = "HVI Vest";
        author = "Synixe Contractors";
    };
};
