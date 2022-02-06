/// @description Comportement de l'allié

// Il y as 2 comportement pour l'allié:
// S'il est très stressé il cherche à se cacher dans une cachette.
// S'il est peu stressé il suis le joueur.

// Gestion du stress

if (stress <= 0)
{
	stress = 0;
	if(instance_nearest(x, y, oEnemy) == noone || (distance_to_object(oEnemy) > 500) && (distance_to_object(oPlayer) < 300))
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

if(cur_sec != current_second)
{
	if(hide)
	{
		stress -= 10;
		//TEST
		if(instance_exists(oHaloTest))
		{
			oHaloTest.scale = 300;
		}
		//FIN TEST
	}
	else
	{
		if (instance_nearest(x, y, oEnemy) != noone)
		{
			//TEST
			if(instance_exists(oHaloTest))
			{
				oHaloTest.scale = 300;
			}
			//FIN TEST
			if (distance_to_object(oEnemy) < 300)
			{
				stress += 10;
			}
			else
			{
				if (distance_to_object(oEnemy) < 400)
				{
					stress += 8;
				}
				else
				{
					if (distance_to_object(oEnemy) < 500)
					{
						stress += 6;
					}
					else
					{
						if (distance_to_object(oEnemy) < 600)
						{
							stress += 4;
						}
						else
						{
							if (distance_to_object(oEnemy) < 700)
							{
								stress += 2;
							}
						}
					}
				}
			}
		}
	}
}
cur_sec = current_second;

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
		vspd = -14;
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


// Animation

if (!place_meeting(x, y + 1, oMur)) {
	//sprite_index = Splayer_Jump;
} else {
	if (hspd == 0) {
		sprite_index = sAlly_Idle;
	} else {
		sprite_index = sAlly_Run;
	}
}

if (hspd != 0) {
	image_xscale = sign(hspd);
}
