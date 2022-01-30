if (place_meeting(x, y, oPlayer)) {
	oPlayer.x = targetX;
	oPlayer.y = targetY;
	instance_destroy(oAlly);
	global.reset_position_x = targetX;
	global.reset_position_y = targetY;
	room_goto(roomChoose);
}