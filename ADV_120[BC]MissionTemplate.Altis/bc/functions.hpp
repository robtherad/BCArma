class init
{
    file = "bc";
    class coreInit{};
};
class core 
{
    file = "bc\core";
    class kd_addKilledEH{};
    class kd_mpKilled{};
};
class radios
{
	file = "bc\radios";
    class radioInit{};
	class radio_genFreqs{};
	class radio_waitGear{};
	class radio_getChannels{};
    class radio_waitRadios{};
    class radio_setRadios{};
    class radio_cleanup{};
};
class loadout
{
    file = "bc\loadout";
    class load_set{};
    class load_notes{};
};