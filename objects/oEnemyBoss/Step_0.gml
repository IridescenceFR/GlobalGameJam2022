// Interaction avec le fouet
if (place_meeting(x, y, oWhip) && invincible == false) {
	hp -= 1;
	invincible = true;
	alarm[1] = 30;
}

// Attaque
if (is_firing == false) {
	is_firing = true;
	//sprite_index = sEnemyShooter;
	attack_type = choose(0, 1, 2);

	if (attack_type == 0) { // line shot
		att_direction = choose(0, 5, -5);
		for (i = 0; i < 200; i += 40) {
			j = choose(-40, -80, -100, 40, 80, 100);
			p = instance_create_layer(x + j, y + i, "Enemy", oProjectileBoss);
			p.hspd = att_direction;
		}
	} else if (attack_type == 1) { // diamond shot
		att_direction = choose(0, 5, -5);
		p1 = instance_create_layer(x - 40, y, "Enemy", oProjectileBoss);
		p2 = instance_create_layer(x + 40, y, "Enemy", oProjectileBoss);
		p3 = instance_create_layer(x, y - 40, "Enemy", oProjectileBoss);
		p4 = instance_create_layer(x, y + 40, "Enemy", oProjectileBoss);
		p5 = instance_create_layer(x, y, "Enemy", oProjectileBoss);
		
		p1.hspd = att_direction;
		p2.hspd = att_direction;
		p3.hspd = att_direction;
		p4.hspd = att_direction;
		p5.hspd = att_direction;
	} else  if (attack_type == 2) { // triple shot
		instance_create_layer(x, y, "Enemy", oProjectileBoss);
		p2 = instance_create_layer(x, y, "Enemy", oProjectileBoss);
		p3 = instance_create_layer(x, y, "Enemy", oProjectileBoss);
		p2.hspd = 5;
		p3.hspd = -5;

	}
	alarm[0] = 90;
}