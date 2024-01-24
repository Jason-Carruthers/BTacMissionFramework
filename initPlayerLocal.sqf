// Features for B|Tac Missions:
// Created by Jace, updated 2024
// To disable any feature, comment out the lines that you don't want.
// ==================================================================

// Save created loadout at mission start, for BTAC_fnc_resupply
call BTAC_fnc_saveLoadout;

// Triage Station
player setVariable ["triageAddedToPlayer", false];
["ace_interactMenuOpened", BTAC_fnc_triageStation] call CBA_fnc_addEventHandler;

// Orbat runs locally to display unique info on each player's screen
null = execVM "BtacMissionFncs\scripts\orbatLocal.sqf";

// Ambient Audio
// ["soundName", loopLength] call BTAC_fnc_ambientLoop;




























// DO NOT TOUCH!
// ===================================================================================================
// add Zeus modules
["BTac Mission Functions", "Player Wave Spawn", {call BTAC_fnc_waveSpawn;}] call zen_custom_modules_fnc_register;
["BTac Mission Functions", "Toggle Triage Consumables", {call BTAC_fnc_toggleConsumables;}] call zen_custom_modules_fnc_register;
["BTac Mission Functions", "End Briefing Phase", {briefingPhase = false; publicVariable "briefingPhase";}] call zen_custom_modules_fnc_register;
// ["BTac Mission Functions", "Create Resupply Crate", {}] call zen_custom_modules_fnc_register;