/// @description Comportement de l'allié

// Il y as 2 comportement pour l'allié:
// S'il est très stressé il cherche à se cacher dans une cachette.
// S'il est peu stressé il suis le joueur.



// Gestion du stress

if (stress < 0)
{
	stress = 0;
}
else
{
	if(stress > 100)
	{
		stress = 100;
	}
}

// Action de l'allié en fonction de son stress

if(stress < 50) // Suivi du joueur
{
	var move = oPlayer.x - x;
	if(abs(move) > 70)
	{
		hspd = sign(move) * walkspd;
	}
	else
	{
		hspd = 0;
	}
}
else // L'allié cherche à se cacher
{
	
}

// Movement de l'allié


vspd = vspd + grav;

//Collision horizontales

if (place_meeting(x + hspd, y, oMur)) {
	while (!place_meeting(x + sign(hspd), y, oMur)) {
		x = x + sign(hspd);
	}
	hspd = 0;
	if (place_meeting(x, y + 1, oMur))
	{
		vspd = -9;
	}
}

x = x + hspd;

//Collisions verticales

if (place_meeting(x, y + vspd, oMur)) {
	while (!place_meeting(x, y + sign(vspd), oMur)) {
		y = y + sign(vspd);
	}
	vspd = 0;	
}

y = y + vspd;
