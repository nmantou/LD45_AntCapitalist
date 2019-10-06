/// @description Insert description here
// You can write your code in this editor
image_index = 1;
if o_controller_player.money > 0 && o_controller_player.ant_count < 64{
	o_controller_player.money -= 1;
	create_loc = irandom(63);
	create_i = int64(create_loc / 8);
	create_j = int64(create_loc % 8);
	while o_controller_player.tile[create_i,create_j].count != 0{
		create_loc = (create_loc + 1) % 64;
		create_i = int64(create_loc / 8);
		create_j = int64(create_loc % 8);
	}
	o_controller_player.tile[create_i, create_j].object[0] = instance_create_layer(o_controller_player.tile[create_i,create_j].x, o_controller_player.tile[create_i,create_j].y, "Instances", o_ant);
	o_controller_player.tile[create_i, create_j].object[0].loc_i = create_i;
	o_controller_player.tile[create_i, create_j].object[0].loc_j = create_j;
	o_controller_player.tile[create_i, create_j].count ++;
}
