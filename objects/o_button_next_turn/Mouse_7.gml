/// @description Insert description here
// You can write your code in this editor
image_index = 1;
o_controller_player.turn = true;
o_button_borrow.turn = true;
o_button_buy.turn = true;
o_controller_player.turn_count++;

if o_controller_player.select_target != noone{
	instance_destroy(o_controller_player.select_target.select_eff);
	o_controller_player.select_target.select_eff = noone;
	o_controller_player.select_target = noone;
}