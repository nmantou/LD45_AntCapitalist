/// @description Insert description here
// You can write your code in this editor
if turn{
	eff_count = instance_number(o_upgrade);
	for(i = 0; i < eff_count; i++){
		instance_destroy(instance_find(o_upgrade, 0));
	}
	
	eff_count = instance_number(o_death);
	for(i = 0; i < eff_count; i++){
		instance_destroy(instance_find(o_death, 0));
	}
	
	eff_count = instance_number(o_factory_pre);
	for(i = 0; i < eff_count; i++){
		instance_destroy(instance_find(o_factory_pre, 0));
	}
	
	var eff_count = instance_number(o_enemy_range);
	for(i = 0; i < eff_count; i++){
		instance_destroy(instance_find(o_enemy_range, 0));
	}
	event_user(0);
	event_user(1);
	event_user(2);
	turn = false;
}