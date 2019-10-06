/// @description Insert description here
// You can write your code in this editor
for (i = 0; i < 8; i++) {
	for (j = 0; j < 8; j++) {
		if tile[i,j].count > 0 {
			if tile[i,j].object[0] != noone{
				
				switch(tile[i,j].object[0].move_direction) {
				    case 1:
				        tile[i,j].object[0].y = tile[i - 1,j].y;
						for(p = 0; p < 4; p++){	
							if tile[i - 1,j].object[p] == noone {
								tile[i,j].object[0].loc_i = i - 1;
								tile[i,j].object[0].move_direction = 0;
								instance_destroy(tile[i,j].object[0].direction_eff);
								tile[i,j].object[0].direction_eff = noone;
								tile[i - 1,j].object[p] = tile[i,j].object[0];
								tile[i,j].object[0] = noone;
								tile[i - 1,j].count++;
								tile[i,j].count--;
								break;
							}
						}
				        break;
			
				    case 2:
				        tile[i,j].object[0].y = tile[i + 1,j].y;
						for(p = 0; p < 4; p++){	
							if tile[i + 1,j].object[p] == noone {
								tile[i,j].object[0].loc_i = i + 1;
								tile[i,j].object[0].move_direction = 0;
								instance_destroy(tile[i,j].object[0].direction_eff);
								tile[i,j].object[0].direction_eff = noone;
								tile[i + 1,j].object[p] = tile[i,j].object[0];
								tile[i,j].object[0] = noone;
								tile[i + 1,j].count++;
								tile[i,j].count--;
								break;
							}
						}
				        break;
			
				    case 3:
				        tile[i,j].object[0].x = tile[i,j - 1].x;
						for(p = 0; p < 4; p++){	
							if tile[i,j - 1].object[p] == noone {
								tile[i,j].object[0].loc_j = j - 1;
								tile[i,j].object[0].move_direction = 0;
								instance_destroy(tile[i,j].object[0].direction_eff);
								tile[i,j].object[0].direction_eff = noone;
								tile[i,j - 1].object[p] = tile[i,j].object[0];
								tile[i,j].object[0] = noone;
								tile[i,j - 1].count++;
								tile[i,j].count--;
								break;
							}
						}
				        break;
			
				    case 4:
				        tile[i,j].object[0].x = tile[i,j + 1].x;
						for(p = 0; p < 4; p++){	
							if tile[i,j + 1].object[p] == noone {
								tile[i,j].object[0].loc_j = j + 1;
								tile[i,j].object[0].move_direction = 0;
								instance_destroy(tile[i,j].object[0].direction_eff);
								tile[i,j].object[0].direction_eff = noone;
								tile[i,j + 1].object[p] = tile[i,j].object[0];
								tile[i,j].object[0] = noone;
								tile[i,j + 1].count++;
								tile[i,j].count--;
								break;
							}
						}
				        break;
			
				    default:
					
				        break;
				}
			}

		}
	}
}


for (i = 0; i < 8; i++) {
	for (j = 0; j < 8; j++) {
		if tile[i,j].count > 1 {
			for(p = 0; p < 4; p++){
				if tile[i,j].object[p] != noone{
					if tile[i,j].object[p].type == 0{
						instance_destroy(tile[i,j].object[p].pre_death)
						tile[i,j].object[p].pre_death = noone;
					}
					instance_destroy(tile[i,j].object[p]);
					tile[i,j].object[p] = noone;
				}
			}
			tile[i,j].count = 0;
		}

		if tile[i,j].count == 1 && tile[i,j].object[0] == noone{
			for(p = 1; p < 4; p++){
				if tile[i,j].object[p] != noone{
					tile[i,j].object[0] = tile[i,j].object[p];
					tile[i,j].object[p] = noone;
					break;
				}
			}
		}
	}
}