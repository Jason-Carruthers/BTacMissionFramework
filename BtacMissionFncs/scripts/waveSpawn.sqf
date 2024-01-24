// Creates a wave spawn, respawning all dead players who are in specatator
[] spawn {
	setPlayerRespawnTime 0;
	sleep 1;
	setPlayerRespawnTime 9999;
};
