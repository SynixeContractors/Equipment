class RscOptics_AV_pilot: RscUnitInfo {
    class DriverOpticsGroup: RscControlsGroup {
        class controls {
            class TextGrid;
            class GVAR(TextSignal): TextGrid {
                fade = 0;
                font = ISR_FONT;
                shadow = 0;
                text = "SIGNAL:";
                idc = IDC_SIGNAL_TEXT;
                y = "31 * (0.025 * safeZoneH)";
            };
            class ValueGrid;
            class GVAR(CA_Signal): ValueGrid {
                idc = IDC_SIGNAL;
                onLoad = "uiNamespace setVariable [""synixe_equipment_isr_signalControl"", _this#0];";
                y = "31 * (0.025 * safeZoneH)";
                text = "0";
            };
            class GVAR(TextConnMode): GVAR(TextSignal) {
                idc = IDC_CONN_MODE_TEXT;
                text = "CONN:";
                y = "30.2 * (0.025 * safeZoneH)";
            };
            class GVAR(CA_ConnMode): GVAR(CA_Signal) {
                idc = IDC_CONN_MODE;
                onLoad = "uiNamespace setVariable [""synixe_equipment_isr_connModeControl"", _this#0];";
                y = "30.2 * (0.025 * safeZoneH)";
                text = "UAV";
            };
            class GVAR(TextConnFreq): GVAR(TextSignal) {
                idc = IDC_CONN_FREQ_TEXT;
                text = "FREQ:";
                y = "29.4 * (0.025 * safeZoneH)";
            };
            class GVAR(CA_ConnFreq): GVAR(CA_Signal) {
                idc = IDC_CONN_FREQ;
                onLoad = "uiNamespace setVariable [""synixe_equipment_isr_connFreqControl"", _this#0];";
                y = "29.4 * (0.025 * safeZoneH)";
                text = "1300";
            };
            class GVAR(TextConnPower): GVAR(TextSignal) {
                idc = IDC_CONN_POWER_TEXT;
                text = "POWER:";
                y = "28.6 * (0.025 * safeZoneH)";
            };
            class GVAR(CA_ConnPower): GVAR(CA_Signal) {
                idc = IDC_CONN_POWER;
                onLoad = "uiNamespace setVariable [""synixe_equipment_isr_connPowerControl"", _this#0];";
                y = "28.6 * (0.025 * safeZoneH)";
                text = "100";
            };

            class GVAR(MenuLine0): GVAR(CA_Signal) {
                idc = IDC_MENU_LINE_0;
                onLoad = "uiNamespace setVariable [""synixe_equipment_isr_menuLine0"", _this#0];";
                x = "40 * (0.01875 * SafezoneH)";
                y = "12.4 * (0.025 * safeZoneH)";
                w = "10 * (0.01875 * SafezoneH)";
                text = "";
            };
            class GVAR(MenuLine1): GVAR(CA_Signal) {
                idc = IDC_MENU_LINE_1;
                onLoad = "uiNamespace setVariable [""synixe_equipment_isr_menuLine1"", _this#0];";
                x = "40 * (0.01875 * SafezoneH)";
                y = "13.2 * (0.025 * safeZoneH)";
                w = "10 * (0.01875 * SafezoneH)";
                text = "";
            };
            class GVAR(MenuLine2): GVAR(CA_Signal) {
                idc = IDC_MENU_LINE_2;
                onLoad = "uiNamespace setVariable [""synixe_equipment_isr_menuLine2"", _this#0];";
                x = "40 * (0.01875 * SafezoneH)";
                y = "14 * (0.025 * safeZoneH)";
                w = "10 * (0.01875 * SafezoneH)";
                text = "";
            };
            class GVAR(MenuLine3): GVAR(CA_Signal) {
                idc = IDC_MENU_LINE_3;
                onLoad = "uiNamespace setVariable [""synixe_equipment_isr_menuLine3"", _this#0];";
                x = "40 * (0.01875 * SafezoneH)";
                y = "14.8 * (0.025 * safeZoneH)";
                w = "10 * (0.01875 * SafezoneH)";
                text = "";
            };
            class GVAR(MenuLine4): GVAR(CA_Signal) {
                idc = IDC_MENU_LINE_4;
                onLoad = "uiNamespace setVariable [""synixe_equipment_isr_menuLine4"", _this#0];";
                x = "40 * (0.01875 * SafezoneH)";
                y = "15.6 * (0.025 * safeZoneH)";
                w = "10 * (0.01875 * SafezoneH)";
                text = "";
            };
            class GVAR(MenuLine5): GVAR(CA_Signal) {
                idc = IDC_MENU_LINE_5;
                onLoad = "uiNamespace setVariable [""synixe_equipment_isr_menuLine5"", _this#0];";
                x = "40 * (0.01875 * SafezoneH)";
                y = "16.4 * (0.025 * safeZoneH)";
                w = "10 * (0.01875 * SafezoneH)";
                text = "";
            };
            class GVAR(MenuLine6): GVAR(CA_Signal) {
                idc = IDC_MENU_LINE_6;
                onLoad = "uiNamespace setVariable [""synixe_equipment_isr_menuLine6"", _this#0];";
                x = "40 * (0.01875 * SafezoneH)";
                y = "17.2 * (0.025 * safeZoneH)";
                w = "10 * (0.01875 * SafezoneH)";
                text = "";
            };
            class GVAR(MenuLine7): GVAR(CA_Signal) {
                idc = IDC_MENU_LINE_7;
                onLoad = "uiNamespace setVariable [""synixe_equipment_isr_menuLine7"", _this#0];";
                x = "40 * (0.01875 * SafezoneH)";
                y = "18 * (0.025 * safeZoneH)";
                w = "10 * (0.01875 * SafezoneH)";
                text = "";
            };
            class GVAR(MenuLine8): GVAR(CA_Signal) {
                idc = IDC_MENU_LINE_8;
                onLoad = "uiNamespace setVariable [""synixe_equipment_isr_menuLine8"", _this#0];";
                x = "40 * (0.01875 * SafezoneH)";
                y = "18.8 * (0.025 * safeZoneH)";
                w = "10 * (0.01875 * SafezoneH)";
                text = "";
            };
            class GVAR(MenuLine9): GVAR(CA_Signal) {
                idc = IDC_MENU_LINE_9;
                onLoad = "uiNamespace setVariable [""synixe_equipment_isr_menuLine9"", _this#0];";
                x = "40 * (0.01875 * SafezoneH)";
                y = "19.6 * (0.025 * safeZoneH)";
                w = "10 * (0.01875 * SafezoneH)";
                text = "";
            };
        };
    };
};
