// Script loops ambient audio track, sound needs to be defined in description.ext cfgSounds
// Designed to work with a loop timer that is 2 seconds shorter than the length of audio track for smooth looping.
params ["_soundName", "_duration"];
ambientAudio = true;

while {ambientAudio} do {
	playSound _soundName;
	sleep _duration;
};
