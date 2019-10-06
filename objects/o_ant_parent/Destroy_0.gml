/// @description Insert description here
// You can write your code in this editor
o_controller_player.ant_count--;
instance_create_layer(x, y, "Direction", o_death_eff);
instance_destroy(direction_eff);
for(i = 0; i < instance_number(o_enemy); i++){
	var enemy_clear = instance_find(o_enemy, i);
	if enemy_clear.target == self{
		enemy_clear.target = noone;
	}
}

audio_play_sound(sound_hit, 1, false);