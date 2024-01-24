// Order of Battle and Safe-Start Script 
// using structured text to achieve the intended effect 

// need to make the hint loop and stay on screen for longer.
// need to enable safeties on weapons. 

//params ["_includeSituation", "_bluforFaction", "_opforFaction"];

//if (isServer) then {
	briefingPhase = true;
	publicVariable "briefingPhase";
	briefingStartTime = time;
	publicVariable "briefingStartTime";
//};

//null = execVM "BtacMissionFncs\scripts\orbatLocal.sqf";