//init.sqf - Executed when mission is started (before briefing screen)

// set the group IDs
[] call compile preprocessFileLineNumbers "f\setGroupID\f_setGroupIDs.sqf";

// Generate automatic ORBAT briefing page
[] execVM "f\briefing\f_orbatNotes.sqf";

//Call the safeStart
[] execVM "f\safeStart\f_safeStart.sqf";

waitUntil {!(isNull player) && time > 1}; 
player setspeaker "NoVoice";
showSubtitles false; 
enableSentences false;
enableRadio false;
player disableConversation true;
