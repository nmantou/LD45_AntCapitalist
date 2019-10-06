/// @description Insert description here
// You can write your code in this editor
if turn_count > 15{
	var factory_count = instance_number(o_factory) - irandom(2);
	if	factory_count <= 0{
		factory_count = 1;
	}
	if enemy_count <= 0{
		for(i = 0; i < factory_count; i++){
			var p = irandom(7);
			var q = irandom(7);
			if p > 0 && p < 4 {
				q = 0;
			}
			if p >= 4 && p < 7 {
				q = 7;
			}
			
			if tile[p,q].count != 0{
				for(k = 0; k < 4; k++){
					instance_destroy(tile[p,q].object[k]);
					tile[p,q].object[k] = noone;
				}
				tile[p,q].count = 0;
			}
			
			tile[p, q].object[0] = instance_create_layer(tile[p,q].x, tile[p,q].y, "Instances", o_enemy);
			tile[p, q].object[0].loc_i = p;
			tile[p, q].object[0].loc_j = q;
			tile[p, q].count ++;
		}
		enemy_count = irandom_range(15,25);
	}
	
	enemy_count --;
}

for (i = 0; i < 8; i++) {
	for (j = 0; j < 8; j++) {
		if tile[i,j].count != 0 && tile[i,j].object[0].type == 3{
			if tile[i,j].object[0].target == noone{
				if instance_exists(o_factory){
					var enemy_target = instance_find(o_factory, irandom(instance_number(o_factory) - 1));
				}
				else if instance_exists(o_ant){
					enemy_target = instance_find(o_ant, irandom(instance_number(o_ant) - 1));
				}
				else if instance_exists(o_defencer){
					enemy_target = instance_find(o_defencer, irandom(instance_number(o_defencer) - 1));
				}
				else enemy_target = noone;
				
				tile[i,j].object[0].target = enemy_target;
			}
			
			if tile[i,j].object[0].can_move && tile[i,j].object[0].target != noone{
				if tile[i,j].object[0].loc_i > tile[i,j].object[0].target.loc_i{
					tile[i,j].object[0].move_direction = 1;
					tile[i,j].object[0].direction_eff = instance_create_layer(tile[i,j].object[0].x, tile[i,j].object[0].y, "Direction", o_direction_eff);
					tile[i,j].object[0].direction_eff.image_angle = 0 + ((tile[i,j].object[0].move_direction - 1) * 90);	
				}
				
				else if tile[i,j].object[0].loc_i < tile[i,j].object[0].target.loc_i{
					tile[i,j].object[0].move_direction = 2;
					tile[i,j].object[0].direction_eff = instance_create_layer(tile[i,j].object[0].x, tile[i,j].object[0].y, "Direction", o_direction_eff);
					tile[i,j].object[0].direction_eff.image_angle = 0 + 180;	
				}
				
				else{
					if tile[i,j].object[0].loc_j > tile[i,j].object[0].target.loc_j{
						tile[i,j].object[0].move_direction = 3;
						tile[i,j].object[0].direction_eff = instance_create_layer(tile[i,j].object[0].x, tile[i,j].object[0].y, "Direction", o_direction_eff);
						tile[i,j].object[0].direction_eff.image_angle = 0 + 90;	
					}
					
					else if tile[i,j].object[0].loc_j < tile[i,j].object[0].target.loc_j{
						tile[i,j].object[0].move_direction = 4;
						tile[i,j].object[0].direction_eff = instance_create_layer(tile[i,j].object[0].x, tile[i,j].object[0].y, "Direction", o_direction_eff);
						tile[i,j].object[0].direction_eff.image_angle = 0 + ((tile[i,j].object[0].move_direction - 1) * 90);	
					}
				}
				
				tile[i,j].object[0].can_move = !tile[i,j].object[0].can_move;
			}
			
			else tile[i,j].object[0].can_move = !tile[i,j].object[0].can_move;
		}
	}
}

for (i = 0; i < 8; i++) {
	for (j = 0; j < 8; j++) {
		if tile[i,j].count != 0 && tile[i,j].object[0].type == 3{
			for(p = -1; p < 2; p++){
				for(q = -1; q < 2; q++){
					if (((i + p) >= 0) && ((i + p) < 8)) && (((j + q) >= 0) && ((j + q) < 8)) && (p!=0 || q!=0){
						instance_create_layer(tile[i + p, j + q].x, tile[i + p, j + q].y, "Direction", o_enemy_range);
						if tile[i + p, j + q].count !=0 && tile[i + p, j + q].object[0].type == 1 && tile[i, j].object[0] != noone{
							instance_destroy(tile[i + p, j + q].object[0]);
							tile[i + p, j + q].object[0] = noone;
							tile[i + p, j + q].count--;
							instance_destroy(tile[i, j].object[0]);
							tile[i, j].object[0] = noone;
							tile[i, j].count--;
							break;
						}
					}
				}
			}
		}
	}
}


if ((debt - money) > 500) || (instance_number(o_ant) == 0 && instance_number(o_defencer) == 0 && instance_number(o_factory) == 0 && instance_number(o_enemy) != 0){
	room_goto(room1);
}

if money >= debt{
	room_goto(room2);
}