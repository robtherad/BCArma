#include "settings.sqf";

_aliveB = {side _x isEqualTo west} count allUnits;
_aliveR = {side _x isEqualTo east} count allUnits;
_aliveG = {side _x isEqualTo independent} count allUnits;
_return = [_aliveB,_aliveR,_aliveG]
_return