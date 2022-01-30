if (place_meeting(x, y, oPlayer)) {
	if (global.hp < 3) {
		global.hp += 1;
	}
	if (instance_exists(oAlly)) {
		oAlly.stress += 5;
	}
	instance_destroy();
}