_target = cursorTarget;
if (_target isKindOf "Man" && player == vehicle player) then {
    if((side _target == side player) && (player distance _target) < 15 && alive _target)then {
        _nameString = format ["<t size='0.375' shadow='2' font='TahomaB' color='#ba9d00'>%2<br/><t size='0.5'>%1</t></t>",name _target,groupID (group _target)];
        [_nameString,0,1,0,0,0,4] spawn bis_fnc_dynamicText;
    };
};
