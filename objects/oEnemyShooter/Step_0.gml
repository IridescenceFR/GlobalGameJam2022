event_inherited();

//Mouvements du personnage

vspd = vspd + grav;

if (oPlayer.is_facing_right == false) {
	image_xscale = -1;
}

// Attaque

if (is_firing == false) {
	is_firing = true;
	sprite_index = sEnemyShooter;
	//instance_create_layer(x, y, "Enemy", oProjectile);
	alarm[0] = 90;
}