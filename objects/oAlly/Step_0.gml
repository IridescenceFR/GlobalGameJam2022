/// @description Comportement de l'allié

// Il y as 2 comportement pour l'allié:
// S'il est très stressé il cherche à se cacher dans une cachette.
// S'il est peu stressé il suis le joueur.



// Gestion du stress

if (stress <= 0)
{
	stress = 0;
	if(instance_nearest(x, y, oEnemy) == noone || (distance_to_object(oEnemy) > 1000) && (distance_to_object(oPlayer) < 400))
	{
		hide = false;
	}
}
else
{
	if(stress > 100)
	{
		stress = 100;
	}
}

if(hide)
{
	stress -= 0.5;
}
else
{
	if (instance_nearest(x, y, oEnemy) != noone)
	{
		if ((10 - distance_to_object(oEnemy) / 100) > 0)
		{
			stress += 10 - distance_to_object(oEnemy) / 100;
		}
	}
}


// Action de l'allié en fonction de son stress

if((stress < 70) && !hide) // Suivi du joueur
{
	var move = oPlayer.x - x;
	if(abs(move) > 200)
	{
		hspd = sign(move) * walkspd;
	}
	else
	{
		hspd = 0;
	}
}
else if(!hide)// L'allié cherche à se cacher
{
	var move = instance_nearest(x, y, oCachette).x - x;
	if(move != 0)
	{
		if(move > 4)
		{
			hspd = sign(move) * walkspd;
		}
		else
		{
			hspd = sign(move);
		}
	}
	else
	{
		hspd = 0;
		hide = true;
	}
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
