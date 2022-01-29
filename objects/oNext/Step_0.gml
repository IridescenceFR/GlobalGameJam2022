/// @description Portail

if (place_meeting(x, y, oPlayer)) {
	oPlayer.x = targetX;
	oPlayer.y = targetY;
	room_goto(roomChoose);
}

