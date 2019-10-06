/// @description Insert description here
// You can write your code in this editor
if (o_controller_player.select_target != noone) {
	o_controller_player.select_target.move_direction = 0;
	if o_controller_player.select_target.direction_eff != noone{
	instance_destroy(o_controller_player.select_target.direction_eff);
	}
}