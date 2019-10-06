/// @description Insert description here
// You can write your code in this editor
if (o_controller_player.select_target != noone) && (o_controller_player.select_target.loc_j < 7){
	o_controller_player.select_target.move_direction = 4;
	if o_controller_player.select_target.direction_eff == noone{
		o_controller_player.select_target.direction_eff = instance_create_layer(o_controller_player.select_target.x, o_controller_player.select_target.y, "Direction", o_direction_eff);
		o_controller_player.select_target.direction_eff.image_angle = 0 + ((o_controller_player.select_target.move_direction - 1) * 90);
	}
	else{
		instance_destroy(o_controller_player.select_target.direction_eff);
		o_controller_player.select_target.direction_eff = instance_create_layer(o_controller_player.select_target.x, o_controller_player.select_target.y, "Direction", o_direction_eff);
		o_controller_player.select_target.direction_eff.image_angle = 0 + ((o_controller_player.select_target.move_direction - 1) * 90);
	}
}