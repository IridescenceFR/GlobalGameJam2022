if (hp <= 0) {
	instance_create_layer(x, y, "Enemy", oSmoke);
	instance_destroy();
}