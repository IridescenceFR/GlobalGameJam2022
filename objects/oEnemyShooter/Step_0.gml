event_inherited();

//Mouvements du personnage

vspd = vspd + grav;

if (sign(oPlayer.x - x)) {
	image_xscale = -1;
}

// Attaque

if (is_firing == false) {
	is_firing = true;
	audio_play_sound(SnakeTSS, 0, 0)
	instance_create_layer(x, y, "Enemy", oProjectile);
	alarm[0] = 90;
}