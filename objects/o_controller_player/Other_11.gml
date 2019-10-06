/// @description Insert description here
// You can write your code in this editor
for (i = 0; i < 8; i++) {
	for (j = 0; j < 8; j++) {
		if tile[i,j].count != 0 && tile[i,j].object[0].type == 3{
			for(p = -1; p < 2; p++){
				for(q = -1; q < 2; q++){
					if (((i + p) >= 0) && ((i + p) < 8)) && (((j + q) >= 0) && ((j + q) < 8)) && (p!=0 || q!=0){
						if tile[i + p, j + q].count !=0 && tile[i + p, j + q].object[0].type == 0 && tile[i, j].object[0] != noone{
							instance_destroy(tile[i + p, j + q].object[0]);
							tile[i + p, j + q].object[0] = noone;
							tile[i + p, j + q].count--;
							break;
						}
					}
				}
			}
		}
	}
}

for (i = 0; i < 8; i++) {
	for (j = 0; j < 8; j++) {
		var pre_count = 0;
		for(p = -1; p < 2; p++){
			for(q = -1; q < 2; q++){
				if (((i + p) >= 0) && ((i + p) < 8)) && (((j + q) >= 0) && ((j + q) < 8)) && (p!=0 || q!=0){
					if tile[i + p, j + q].count !=0 {
						if tile[i + p, j + q].object[0].type < 2 pre_count++;
					}
				}
			}
		}
		if pre_count >= 4 && tile[i,j].count == 1 && tile[i,j].object[0].type == 0{
			if tile[i,j].object[0].pre_death != noone{
				instance_destroy(tile[i,j].object[0].pre_death);
				instance_destroy(tile[i,j].object[0]);
				tile[i,j].object[0] = noone;
				tile[i,j].count--;
			}
			else tile[i,j].object[0].pre_death = instance_create_layer(tile[i,j].x, tile[i,j].y, "Direction", o_death);
		}
		else if tile[i,j].count == 1 && tile[i,j].object[0].type == 0 && tile[i,j].object[0].pre_death != noone{
			instance_destroy(tile[i,j].object[0].pre_death);
			tile[i,j].object[0].pre_death = noone;
		}
	}
}

for (i = 0; i < 8; i++) {
	for (j = 0; j < 8; j++) {
		var pre_count = 0;
		for(p = -1; p < 2; p++){
			for(q = -1; q < 2; q++){
				if (((i + p) >= 0) && ((i + p) < 8)) && (((j + q) >= 0) && ((j + q) < 8)) && (p!=0 || q!=0){
					if tile[i + p, j + q].count !=0 {
						if tile[i + p, j + q].object[0].type == 0 pre_count++;
					}
				}
			}
		}
		if pre_count == 2 && tile[i,j].count == 1 && tile[i,j].object[0].type == 0{
			if tile[i,j].object[0].pre_upgrade != noone{
				instance_destroy(tile[i,j].object[0].pre_upgrade);
				instance_destroy(tile[i,j].object[0]);
				tile[i,j].object[0] = instance_create_layer(tile[i,j].x, tile[i,j].y, "Instances", o_defencer);
				tile[i,j].object[0].loc_i = i;
				tile[i,j].object[0].loc_j = j;
			}
			else tile[i,j].object[0].pre_upgrade = instance_create_layer(tile[i,j].x, tile[i,j].y, "Direction", o_upgrade);
		}
		else if tile[i,j].count == 1 && tile[i,j].object[0].type == 0{
			instance_destroy(tile[i,j].object[0].pre_upgrade);
			tile[i,j].object[0].pre_upgrade = noone;
		}
	}
}

for (i = 0; i < 8; i++) {
	for (j = 0; j < 8; j++) {
		var pre_count = 0;
		for(p = -1; p < 2; p++){
			for(q = -1; q < 2; q++){
				if (((i + p) >= 0) && ((i + p) < 8)) && (((j + q) >= 0) && ((j + q) < 8)) && (p!=0 || q!=0){
					if tile[i + p, j + q].count !=0 {
						if tile[i + p, j + q].object[0].type == 1 pre_count++;
					}
				}
			}
		}
		
		if pre_count >= 3 && tile[i,j].count == 0 {
			if tile[i,j].pre_factory == noone{
				tile[i,j].pre_factory = instance_create_layer(tile[i,j].x, tile[i,j].y, "Direction", o_factory_pre);
			}
			else{
				instance_destroy(tile[i,j].pre_factory);
				tile[i,j].pre_factory = noone;
				o_controller_player.tile[i, j].object[0] = instance_create_layer(o_controller_player.tile[i,j].x, o_controller_player.tile[i,j].y, "Instances", o_factory);
				o_controller_player.tile[i, j].object[0].loc_i = i;
				o_controller_player.tile[i, j].object[0].loc_j = j;
				o_controller_player.tile[i, j].count ++;
				for(p = -1; p < 2; p++){
					for(q = -1; q < 2; q++){
						if (((i + p) >= 0) && ((i + p) < 8)) && (((j + q) >= 0) && ((j + q) < 8)) && (p!=0 || q!=0){
							var death_count = 3;
							if tile[i + p, j + q].count !=0 && tile[i + p, j + q].object[0].type == 1 && death_count > 0{
								instance_destroy(tile[i + p, j + q].object[0]);
								tile[i + p, j + q].object[0] = noone;
								tile[i + p, j + q].count--;
								death_count--;
							}
						}
					}
				}
	
			}
		}

		else{
			instance_destroy(tile[i,j].pre_factory);
			tile[i,j].pre_factory = noone;	
		}
		
	}
}



//for (i = 0; i < 8; i++) {
//	for (j = 0; j < 8; j++) {
//		var pre_count = 0;
//		for(p = -1; p < 2; p++){
//			for(q = -1; q < 2; q++){
//				if (((i + p) > 0) && ((i + p) < 8)) && (((j + q) > 0) && ((j + q) < 8)){
//					if tile[i + p, j + q].count !=0 {
//						if tile[i + p, j + q].object[0].type == 0 pre_count++;
//					}
//				}
//			}
//		}
		
//		if pre_count == 3 && tile[i,j].count == 0 {
//			if tile[i,j].pre_ant == noone{
//				tile[i,j].pre_ant = instance_create_layer(tile[i,j].x, tile[i,j].y, "Direction", o_ant_pre);
//			}
//			else{
//				instance_destroy(tile[i,j].pre_ant);
//				tile[i,j].pre_ant = noone;
//				o_controller_player.tile[i, j].object[0] = instance_create_layer(o_controller_player.tile[i,j].x, o_controller_player.tile[i,j].y, "Instances", o_ant);
//				o_controller_player.tile[i, j].object[0].loc_i = i;
//				o_controller_player.tile[i, j].object[0].loc_j = j;
//				o_controller_player.tile[i, j].count ++;
//			}
//		}

//		else{
//			instance_destroy(tile[i,j].pre_ant);
//			tile[i,j].pre_ant = noone;	
//		}
		
//	}
//}
