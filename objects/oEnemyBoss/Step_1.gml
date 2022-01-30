if (hp <= 0) {
	audio_pause_sound(Music);
	audio_pause_sound(bossMusic);
	audio_play_sound(Victory, 10, false);
	instance_create_layer(x, y, "Enemy", oSmokeBoss);
	instance_create_layer(x, y, "Ally", oAlly);
	instance_destroy();
}