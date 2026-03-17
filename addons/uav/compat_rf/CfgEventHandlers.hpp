class Extended_PostInit_EventHandlers {
    class DOUBLES(ADDON,SUBCOMPONENT) {
        clientInit = QUOTE(call COMPILE_FILE(SUBCOMPONENT\XEH_postInitClient));
    };
};
