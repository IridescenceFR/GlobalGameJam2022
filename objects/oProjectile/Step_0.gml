if (place_meeting(x, y, oPlayer) && oPlayer.invincible == false) {
	instance_destroy();
	global.hp -= 1;
	oPlayer.invincible = true;
	oPlayer.alarm[0] = 30;
} else if (place_meeting(x, y, oPlayer) || place_meeting(x, y, oMur)) {
	instance_destroy();
}