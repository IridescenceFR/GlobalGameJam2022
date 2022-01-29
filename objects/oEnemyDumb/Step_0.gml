event_inherited();

//Mouvements du personnage

hspd = walkspd;

vspd = vspd + grav;

//Collision horizontales

if (place_meeting(x + hspd, y, oMur)) {
	walkspd = walkspd * -1;
}

x = x + hspd;

//Animations

if (hspd == 0) {
	sprite_index = sEnemyDumb;
} else {
	sprite_index = sEnemyDumb;
}