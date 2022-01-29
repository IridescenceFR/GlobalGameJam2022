//interaction avec le player

if (place_meeting(x, y, oPlayer)) {
	global.key_count += 1;
	instance_destroy();
}