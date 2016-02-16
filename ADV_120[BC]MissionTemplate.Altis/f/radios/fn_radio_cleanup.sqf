//If ORBAT is written, destroy all global variables that aren't in use anymore
if (bc_writtenORBAT) then {
    bc_hasSWitem = nil;
    bc_hasLRitem = nil;
    bc_radHandle1 = nil;

    bc_curChan = nil;
    bc_altChan = nil;
    bc_ch1 = nil;
    bc_ch2 = nil;
    bc_ch3 = nil;
    bc_ch4 = nil;
    bc_ch5 = nil;
    bc_ch6 = nil;
    bc_ch7 = nil;
    bc_ch8 = nil;
    bc_ch9 = nil;
    bc_radioNoteString = nil;
    bc_radHandle2 = nil;

    bc_hasLR = nil;
    bc_LRsetup = nil;
    bc_hasSW = nil;
    bc_SWsetup = nil;

    bc_curSettings = nil;
};
