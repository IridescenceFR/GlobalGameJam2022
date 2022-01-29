if (place_meeting(x, y, oPlayer) && oPlayer.invincible == false) {
	instance_destroy();
	global.hp -= 1;
	oPlayer.invincible = true;
	oPlayer.alarm[0] = 50;
	if (instance_exists(oAlly)) {
		oAlly.stress += 5;
	}
} else if (place_meeting(x, y, oAlly) && oAlly.hide == false) {
	instance_destroy();
	oAlly.stress += 10;
} else if (place_meeting(x, y, oPlayer) || place_meeting(x, y, oMur)  || place_meeting(x, y, oWhip)) {
	instance_destroy();
}