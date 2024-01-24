waitUntil {alive player};
if (([player] call ace_common_fnc_isMedic) == false) exitWith {};
if ((player getVariable "triageAddedToPlayer") == true) exitWith {};

// debug
systemChat "B|Tac Triage station added to ACE Self Interact!";

// Functions
player setVariable ["triageNotDeployed", true];

BTAC_fnc_triage_spawnObjects = { // spawn and create Tarp + first Aid Kits
	[2, [], {hint "Triage Station deployed!";}, {hint "Cancelled"}, "Deploying..."] call ace_common_fnc_progressBar;
	
	_playerPos = getPos player;
	_playerDir = getDir player;

	// Tarp
	_tarp = "Tarp_01_Small_Black_F" createVehicle  _playerPos;
	_tarp enableSimulationGlobal false;
	_tarp allowDamage false;
	_tarp setDir _playerDir;
	_tarp setPos _playerPos;
	// Set tarp as medical facility
	_tarp setVariable ["ace_medical_isMedicalFacility", true, true];

	// open FAK
	_openFAK = "Land_FirstAidKit_01_open_F" createVehicle _playerPos;
	_openFAK enableSimulationGlobal false;
	_openFAK allowDamage false;
	_openFAK setDir (_playerDir + 90);
	_oFAKpos = player modelToWorld [-0.9, 0.5, 0];
	_openFAK setPos _oFAKpos;

	if (triageHasConsumables == true) then {
		_openFAK addItemCargo ["kat_IV_16", 5];
		_openFAK addItemCargo ["kat_larynx", 5];
	};


	//closed FAK
	_closedFAK = "Land_FirstAidKit_01_closed_F" createVehicle _playerPos;
	_closedFAK enableSimulationGlobal false;
	_closedFAK allowDamage false;
	_closedFAK setDir _playerDir;
	_cFAKpos = player modelToWorld [-0.9, 1, 0];
	_closedFAK setPos _cFAKpos;

	// triage station is 'not not' deployed (it is deployed)
	player setVariable ["triageNotDeployed", false];
	
	// create action on bag to remove station
	_reStatement = {
		params ["_target", "_player", "_args"];
		_args params ["_tarp", "_openFAK", "_closedFAK"];
		{ deleteVehicle _x; } forEach [_tarp, _openFAK, _closedFAK];
		player setVariable ["triageNotDeployed", true];
		[3, [], {hint "Triage Station packed!";}, {hint "Cancelled"}, "Packing..."] call ace_common_fnc_progressBar;
	};
	_removeAction = ["removeTriage", "Pack Up Station", "", _reStatement, {true}, {}, [_tarp, _openFAK, _closedFAK]] call ace_interact_menu_fnc_createAction;
	[_closedFAK, 0, ["ACE_MainActions"], _removeAction] call ace_interact_menu_fnc_addActionToObject;
};


// MAIN
_statement = {
	call BTAC_fnc_triage_spawnObjects;
};
_action = ["Triage","Deploy Triage Station", "", _statement, {player getVariable "triageNotDeployed"}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToObject;
player setVariable ["triageAddedToPlayer", true];