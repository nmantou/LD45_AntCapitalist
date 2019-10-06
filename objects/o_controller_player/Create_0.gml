/// @description Insert description here
// You can write your code in this editor
money = 0;
get_money = 0;
debt = 0;
borrow_count = 0;
ant_count = 0;
ini_x = 480;
ini_y = 128;
for(i = 0; i < 8; i++){
	for(j = 0; j < 8 ; j++){
		tile[i,j] = instance_create_layer(ini_x + j * 64, ini_y + i * 64, "Tile", o_tile);
		tile[i,j].loc_i = i;
		tile[i,j].loc_j = j;
	}
}

select_target = noone;
turn = false;
turn_count = 0;
enemy_count = 0;

