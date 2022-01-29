if (hp <= 0) {
	oAlly.stress -= 10;
	instance_create_layer(x, y, "Enemy", oSmoke);
	if (random(100) <= 30) {
		instance_create_layer(x, y, "Item", oHeart);
	}
	instance_destroy();
}