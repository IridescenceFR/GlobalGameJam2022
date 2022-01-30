/// @description move light with player
// You can write your code in this editor
	
if (instance_exists(oAlly)) {
	light[| eLight.X] = oAlly.x;
	light[| eLight.Y] = oAlly.y;
} else if (instance_exists(oAllyRunner)){
	light[| eLight.X] = oAllyRunner.x;
	light[| eLight.Y] = oAllyRunner.y;
} else  if (instance_exists(oEnemyBoss)){
	light[| eLight.X] = oEnemyBoss.x;
	light[| eLight.Y] = oEnemyBoss.y;
}