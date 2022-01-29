if (place_meeting(x, y, oPlayer)) {
	if (global.hp < 3) {
		global.hp += 1;
	}
	oAlly.stress += 5;
	instance_destroy();
}