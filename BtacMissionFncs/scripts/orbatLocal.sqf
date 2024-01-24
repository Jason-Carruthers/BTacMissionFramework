// Order of Battle and Safe-Start Script 
// using structured text to achieve the intended effect 

//params ["_includeSituation", "_bluforFaction", "_opforFaction"];

//exits if Orbat is disabled in init.sqf or briefing phase is done
sleep 1;
if (isNil "briefingPhase" || briefingPhase != true) exitWith {};

[ACE_player, currentWeapon ACE_player, true] call ace_safemode_fnc_setWeaponSafety;

[] spawn {
	//params ["_includeSituation", "_bluforFaction", "_opforFaction"];
	while {briefingPhase} do {
		// recalc every 5 seconds to adjust for updates/changes 
		private _playerName = name player;
		private _playerGroup = group player;
		private _groupName = groupId _playerGroup;
		private _squadLeader = name leader group player; 
		private _role = (roleDescription player) splitString "@" select 0; 
		private _opName = briefingName; 
		private _terrain = worldName; 
		private _currentTime = systemTime apply {if (_x < 10) then {"0" + str _x} else {str _x}};
		private _hours = _currentTime select 3; _minutes = _currentTime select 4;
		private _timeSys = _hours + ":" + _minutes;
		private _timeSinceBriefingStart = time - briefingStartTime;
		private _briefTime = (_timeSinceBriefingStart / 60) toFixed 0;

		_playableGroups = [];
		{
		_group = group _x;
		if !(_group in _playableGroups) then {
		_playableGroups set [count _playableGroups,_group];
		}
		} foreach playableunits;

		private _groupNum = _playableGroups find _playerGroup;
		if (_groupNum == 0) then {
			_groupNum = (count _playableGroups) - 1;
		};
		private _radioFreq = _groupNum;

		private _orbatString = "
<t font='PuristaBold'><t size='1.1'>ORBAT - %1 </t></t><br/>
<t font='PuristaMedium'><t align='left'>
Welcome <t color='#FFFF9400'>%2</t> to %3.<br/><br/>


<t align='center'><t size='1.1'>Briefing phase is underway!<br/></t></t>
<t size='1.0'>
The time is <t color='#FFFF9400'>%4</t>. <br/></t>
<t size='0.8'>
It has been <t color='#FFFF9400'>%5 minutes</t> since briefing began.<br/><br/>
</t>

Stick close to your SL, <t color='#FFFF9400'>%6</t> and listen to their instructions.<br/><br/>

<t font='PuristaBold'>
Squad:
<t color='#FFFF9400'><t align='right'>%7 </t></t><br/>
<t align='left'>Role:</t>
<t color='#FFFF9400'><t align='right'>%8 </t></t><br/>
<t align='left'>Freq:</t>
<t align='right'><t color='#FFFF9400'>Ch: %9 </t></t><br/>
</t><br/><br/>

<t font='PuristaLight'><t size='0.7'>B|Tac Mission Framework V0.2 - 23/01/24</t></t>
";

// 		private _situationBrief = "<br/><br/>
// <t font='PuristaBold'><t align='centre'><t size='1.2'SITUATION</t></t>
// <t font='PuristaMedium'>
// <t align='left'>Date:</t>
// <t color='#FFFF9400'><t align='right'>%10</t></t><br/>

// </t>";

// 		if (_includeSituation) then {
// 			_orbatString = _orbatString + _situationBrief;
// 		};

		hintSilent parseText format [
			_orbatString, 
			_opName, //%1
			_playerName, //%2
			_terrain, //%3
			_timeSys, //%4
			_briefTime, //%5
			_squadLeader, //%6
			_groupName, //%7
			_role, //%8
			_radioFreq //%9
			//_date, //%10
			//_bluforFaction, //%11
			//_opforFaction //%12
		];

		sleep 5;
	};
	waitUntil {!briefingPhase};
	hint parseText "<t font='PuristaBold'><t size='1.2'><t color='#FFFF9400'>BRIEFING COMPLETE</t><br/></t>
	<t font='PuristaMedium'>Mission Starting soon!</t></t></t>";
	[ACE_player, currentWeapon ACE_player, false] call ace_safemode_fnc_setWeaponSafety;
};
