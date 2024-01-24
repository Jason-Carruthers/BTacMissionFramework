// Will save the initLoadout, overwriting from initPlayerLocal.sqf
[player,[missionNameSpace,"initLoadout"]] call BIS_fnc_saveInventory;
hint "Your current loadout is now saved. You will get it back whenever you use a resupply crate.";
