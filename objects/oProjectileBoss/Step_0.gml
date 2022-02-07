x = x + hspd;
y = y + vspd;

if (place_meeting(x, y, oPlayer) && oPlayer.invincible == false) {
	instance_destroy();
	global.hp -= 1;
	oPlayer.invincible = true;
	oPlayer.alarm[0] = 50;
} else if (place_meeting(x, y, oPlayer) || place_meeting(x, y, oMur)  || place_meeting(x, y, oWhip)) {
	instance_destroy();
}

image_angle = point_direction(x, y, hspd, vspd);