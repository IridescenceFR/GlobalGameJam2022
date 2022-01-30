if (global.hp <= 0){
	
	global.hp = 3;
	oPlayer.x = global.reset_position_x;
	oPlayer.y = global.reset_position_y;
	if (instance_exists(oAlly)) {
		oAlly.x = global.reset_position_x;
		oAlly.y = global.reset_position_y;
	}
	room_restart();
}