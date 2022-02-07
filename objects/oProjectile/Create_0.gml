if (instance_exists(oAlly) && oAlly.hide == false) {
	ex = instance_nearest(x, y, oAlly).x;
	ey = instance_nearest(x, y, oAlly).y;
} else {
	ex = instance_nearest(x, y, oPlayer).x;
	ey = instance_nearest(x, y, oPlayer).y;
}

direction = point_direction(x, y, ex, ey);

image_angle = direction + 180;
move_towards_point(ex, ey, 5);