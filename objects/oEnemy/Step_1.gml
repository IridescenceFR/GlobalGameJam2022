if (hp <= 0) {
	if (instance_exists(oAlly)) {
		oAlly.stress -= 10;
	}
	instance_create_layer(x, y, "Enemy", oSmoke);
	if (random(100) <= 30) {
		instance_create_layer(x, y, "Item", oHeart);
	}
	instance_destroy();
}