class CfgFunctions {
    class F {
        class safeStart {
            file = "f\safeStart";
            class safety{};
        };
    };
    class BC {
        #include "f\functions.hpp"
    };
};