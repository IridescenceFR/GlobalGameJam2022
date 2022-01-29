if (place_meeting(x, y, oPlayer)) {
	global.hp += 1;
	oAlly.stress += 5;
	instance_destroy();
}