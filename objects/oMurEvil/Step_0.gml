//create spikes
if (activated == false && distance_to_object(oPlayer) < 200) {
	activated = true;
	inst = instance_create_layer(x, y - 50, "Mur", oSpike);
	with (inst) {
		alarm[0] = 130;
	}
	alarm[0] = 250;
}