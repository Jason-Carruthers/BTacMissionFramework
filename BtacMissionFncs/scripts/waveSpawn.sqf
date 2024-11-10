// Creates a wave spawn, respawning all dead players who are in specatator
// setPlayerRespawnTime 1;
[] spawn {
	[1] remoteExec ["setPlayerRespawnTime"];

	sleep 3;

	// setPlayerRespawnTime 9999;
	[9999] remoteExec ["setPlayerRespawnTime"];
};
