/// @description Portail

if (place_meeting(x, y, oPlayer)) {
	oPlayer.x = targetX;
	oPlayer.y = targetY;
	oAlly.x = targetX;
	oAlly.y = targetY;
	room_goto(roomChoose);
}

