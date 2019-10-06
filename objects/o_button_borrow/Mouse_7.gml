/// @description Insert description here
// You can write your code in this editor
image_index = 1;
if instance_exists(o_controller_player){
	o_controller_player.debt += 3;
	o_controller_player.borrow_count ++;
	o_controller_player.money += 3;
}
audio_play_sound(sound_money, 1, false);