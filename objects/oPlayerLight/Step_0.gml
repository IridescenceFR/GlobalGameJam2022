/// @description move light with player
// You can write your code in this editor


	
if (instance_exists(oAlly)) {
	light[| eLight.X] = oAlly.x
	light[| eLight.Y] = oAlly.y
} else {
	light[| eLight.X] = oAllyRunner.x
	light[| eLight.Y] = oAllyRunner.y
}