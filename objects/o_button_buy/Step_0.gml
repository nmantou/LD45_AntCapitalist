/// @description Insert description here
// You can write your code in this editor
if instance_exists(o_controller_player) {
	money = o_controller_player.money;
	get_money = o_controller_player.get_money;
	text = string(money)+" + "+string(get_money);
}

if turn{
	event_user(0);
	turn = false;
}