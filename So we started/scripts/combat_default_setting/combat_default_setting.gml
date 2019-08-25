global.combat_room_x1 = 5;
global.combat_room_y1 = 5;
global.combat_room_x2 = 5;
global.combat_room_y2 = 5;

global.combat_player = object_combat_dummy;
global.combat_player_x = 5;
global.combat_player_y = 5;
global.combat_enemy1 = object_combat_dummy;
global.combat_enemy2 = noone;
global.combat_enemy3 = noone;

for (var a = 0;a < 4;a ++) {
	global.combat_data[a,combat_data_name.name] = "nobody";
	global.combat_data[a,combat_data_name.attack_damage1] = 0;
	global.combat_data[a,combat_data_name.attack_damage2] = 0;
	global.combat_data[a,combat_data_name.attack_damage3] = 0;
	global.combat_data[a,combat_data_name.resistance] = 0;
	global.combat_data[a,combat_data_name.health_] = 0;
	global.combat_data[a,combat_data_name.max_health] = 0;
	global.combat_data[a,combat_data_name.tireness] = 0;
	global.combat_data[a,combat_data_name.will] = -1;
	global.combat_data[a,combat_data_name.strength] = 0;
	global.combat_data[a,combat_data_name.immune_time] = 0;
	global.combat_data[a,combat_data_name.state] = fighter_state.normal;
	global.combat_data[a,combat_data_name.state_timer] = 0;
}