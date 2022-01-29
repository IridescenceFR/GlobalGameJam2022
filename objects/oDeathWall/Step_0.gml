x = x + oAllyRunner.hspd;

// Interaction avec le joueur
if (place_meeting(x, y, oPlayer)) {
	global.hp = 0;
}