// Features for B|Tac Missions:
// Created by Jace, updated 2024
// To disable any feature, comment out the lines that you don't want.
// ==================================================================

// Spawn consumable objects "KingLT" and "16gIV" in the B|Tac Triage station.
triageHasConsumables = true; // Set to 'false' to disable. 
publicVariable "triageHasConsumables";

// Will add mission info and platoon roster to player's map and diary.
call BTAC_fnc_briefing;

// Runs safe-start and Order of Battle overlay for briefing phase.
call BTAC_fnc_orbat;
