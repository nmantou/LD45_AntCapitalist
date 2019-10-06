/// @description Insert description here
// You can write your code in this editor
if instance_exists(o_controller_player) {
	debt = o_controller_player.debt;
	borrow_count = o_controller_player.borrow_count;
	text = string(debt)+" + "+string(borrow_count);
}

if turn{
	event_user(0);
	turn = false;
}