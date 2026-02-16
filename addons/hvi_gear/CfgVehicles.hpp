class CfgVehicles {
    class Man;
    class CAManBase: Man {

        class ACE_Actions {
            class ACE_Torso {
                class putOnHVIVest {
                    displayName = "Put on HVI Vest";
                    distance = 3;
                    selection = "torso";
                    condition = QUOTE(!isPlayer _target && { 'CLASS(hvi_vest_packed)' in items ACE_player });
                    statement = QUOTE(removeVest _target; _target addVest 'CLASS(hvi_vest)'; ACE_player removeItem 'CLASS(hvi_vest_packed)';);
                };

                class removeHVIVest {
                    displayName = "Remove HVI Vest";
                    distance = 3;
                    selection = "torso";
                    condition = QUOTE(!isPlayer _target && { vest _target == 'CLASS(hvi_vest)' });
                    statement = QUOTE(removeVest _target; ACE_player addItem 'CLASS(hvi_vest_packed)';);
                };

            };

            class ACE_Head {
                class putOnHVIHelmet {
                    displayName = "Put on HVI Helmet";
                    distance = 3;
                    selection = "head";
                    condition = QUOTE(!isPlayer _target && { 'CLASS(hvi_helmet_packed)' in items ACE_player });
                    statement = QUOTE(removeHeadgear _target; _target addHeadgear 'CLASS(hvi_helmet)'; ACE_player removeItem 'CLASS(hvi_helmet_packed)';);
                };

                class removeHVIHelmet {
                    displayName = "Remove HVI Helmet";
                    distance = 3;
                    selection = "head";
                    condition = QUOTE(!isPlayer _target && { headgear _target == 'CLASS(hvi_helmet)' });
                    statement = QUOTE(removeHeadgear _target; ACE_player addItem 'CLASS(hvi_helmet_packed)';);
                };
            };
        };
    };
};
