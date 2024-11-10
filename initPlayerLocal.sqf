// Features for B|Tac Missions:
// Created by Jace, updated November 2024
// To disable any feature, comment out the lines that you don't want.
// ==================================================================

// Save created loadout at mission start, for BTAC_fnc_resupply
call BTAC_fnc_saveLoadout;

// Will add mission info and platoon roster to player's map and diary.
call BTAC_fnc_briefing;

// Triage Station & consumables
player setVariable ["triageAddedToPlayer", false]; player setVariable ["consumableRequestsAdded", false];
["ace_interactMenuOpened", BTAC_fnc_triageStation] call CBA_fnc_addEventHandler;

// Orbat runs locally to display unique info on each player's screen
null = execVM "BtacMissionFncs\scripts\orbatLocal.sqf";

// Ambient Audio
// ["soundName", loopLength] call BTAC_fnc_ambientLoop;




























// DO NOT TOUCH!
// ===================================================================================================
// add Zeus modules
["BTac Mission Functions", "Player Wave Spawn", {call BTAC_fnc_waveSpawn;}] call zen_custom_modules_fnc_register;
["BTac Mission Functions", "End Briefing Phase", {missionNamespace setVariable ["briefingPhase", false, true];}] call zen_custom_modules_fnc_register;
// ["BTac Mission Functions", "Create Resupply Crate", {}] call zen_custom_modules_fnc_register;