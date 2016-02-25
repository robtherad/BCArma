#include "settings.sqf";

if (!isServer) exitWith {};

if (count _cargoArray > 0) then {
    { // forEach cargoArray
        _vehicleArray = _x select 0;
        _weapons = _x select 1;
        _magazines = _x select 2;
        _items = _x select 3;
        _backpacks = _x select 4;

        { //forEach _vehicle in _vehicleArray
            // Unpack variables
            _vehicle = _x;

            //Weapons
            if (count _weapons > 0) then {
                {
                    _vehicle addWeaponCargoGlobal [_x select 0, _x select 1];
                } forEach _weapons;
            };

            //Magazines
            if (count _magazines > 0) then {
                {
                    _vehicle addmagazineCargoGlobal [_x select 0, _x select 1];
                } forEach _magazines;
            };

            //Items
            if (count _items > 0) then {
                {
                    _vehicle addItemCargoGlobal [_x select 0, _x select 1];
                } forEach _items;
            };

            //Backpacks
            if (count _backpacks > 0) then {
                {
                    _vehicle addBackpackCargoGlobal [_x select 0, _x select 1];
                } forEach _backpacks;
            };

        } forEach _vehicleArray
    } forEach _cargoArray;
};
