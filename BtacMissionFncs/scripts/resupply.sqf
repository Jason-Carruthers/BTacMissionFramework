// Will load the saved initLoadout from initPlayerLocal.sqf and BTAC_fnc_saveLoadout.sqf 
[player,[missionNameSpace,"initLoadout"]] call BIS_fnc_loadInventory;
hint "Resupplied!";
