class core {
    file = "f\core";
    class core_addKilledEH{postInit = 1;};
    class core_mpKilled{};
    class core_showTags{};
    class core_addRatingEH{postInit = 1;};
};
class radios {
    file = "f\radios";
    class radio_genFreqs{postInit = 1;};
    class radio_waitGear{};
    class radio_getChannels{};
    class radio_waitRadios{};
    class radio_setRadios{};
    class radio_cleanup{};
};
class loadout {
    file = "f\loadout";
    class loadout_set{postInit = 1;};
    class loadout_notes{};
};
class gpsmarkers {
    file = "f\gpsmarkers";
    class gps_init{};
    class gps_createMarks{};
    class gps_updateMarks{};
};
class endConditions {
    file = "f\endconditions";
    class end_clientWait{};
    class end_clientTime{};
    class end_checkTime{};
    class end_checkAlive{};
};