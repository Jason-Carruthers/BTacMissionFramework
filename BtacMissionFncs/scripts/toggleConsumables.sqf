// Toggles consumables for the BTac Triage Station

if (triageHasConsumables == true) then {
	triageHasConsumables = false;
	publicVariable "triageHasConsumables";
	hint "Consumables turned off";
} else {
	triageHasConsumables = true;
	publicVariable "triageHasConsumables";
	hint "Consumables turned on";
};