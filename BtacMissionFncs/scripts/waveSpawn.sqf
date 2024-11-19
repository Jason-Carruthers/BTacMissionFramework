// Creates a wave spawn, respawning all dead players who are in specatator
params ["_spawnLocation"];
"respawn_west" setMarkerPos _spawnLocation;

[] spawn {
	sleep 1;
	[0] remoteExec ["setPlayerRespawnTime"];
	sleep 3;
	[9999] remoteExec ["setPlayerRespawnTime"];
};