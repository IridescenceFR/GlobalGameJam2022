
if (instance_exists(oAlly) && oAlly.hide == false) {
	move_towards_point(oAlly.x, oAlly.y, 3);
} else {
	move_towards_point(oPlayer.x, oPlayer.y, 3);
}
