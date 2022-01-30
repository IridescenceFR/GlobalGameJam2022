if (hp <= 0) {
	instance_create_layer(x, y, "Enemy", oSmokeBoss);
	instance_create_layer(x, y, "Ally", oAlly);
	instance_destroy();
}