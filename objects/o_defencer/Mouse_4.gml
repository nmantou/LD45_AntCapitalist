/// @description Insert description here
// You can write your code in this editor
if o_controller_player.select_target == noone{
	o_controller_player.select_target = self;
	select_eff = instance_create_layer(x, y, "Instances", o_select_eff);
}
else{
	instance_destroy(o_controller_player.select_target.select_eff);
	o_controller_player.select_target.select_eff = noone;
	o_controller_player.select_target = self;
	select_eff = instance_create_layer(x, y, "Instances", o_select_eff);
}