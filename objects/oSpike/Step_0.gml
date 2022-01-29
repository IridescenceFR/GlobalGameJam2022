// Interaction avec le joueur
if (place_meeting(x, y, oPlayer) && oPlayer.invincible == false) {
	global.hp -= 1;
	oPlayer.invincible = true;
	oPlayer.alarm[0] = 50;
	if (instance_exists(oAlly)) {
		oAlly.stress += 5;
	}
}