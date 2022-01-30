if (place_meeting(x, y, oPlayer)) {
	oPlayer.x = targetX;
	oPlayer.y = targetY;
	instance_destroy(oAlly);
	room_goto(roomChoose);
}