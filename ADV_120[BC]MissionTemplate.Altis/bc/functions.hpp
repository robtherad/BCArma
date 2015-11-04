class init {
    file = "bc";
    class bcInit{};
};
class core {
    file = "bc\core";
    class core_addKilledEH{postInit = 1;};
    class core_mpKilled{};
    class core_showTags{};
    class core_addRatingEH{postInit = 1;};
};
class radios {
	file = "bc\radios";
	class radio_genFreqs{postInit = 1;};
	class radio_waitGear{};
	class radio_getChannels{};
    class radio_waitRadios{};
    class radio_setRadios{};
    class radio_cleanup{};
};
class loadout {
    file = "bc\loadout";
    class loadout_set{postInit = 1;};
    class loadout_notes{};
};
class gpsmarkers {
    file = "bc\gpsmarkers";
    class gps_init{};
    class gps_createMarks{};
    class gps_updateMarks{};
};
class endConditions {
    file = "bc\endconditions";
    class end_clientWait{};
    class end_clientTime{};
    class end_checkTime{};
    class end_checkAlive{};
};