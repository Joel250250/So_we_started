//uf object (long way to go)
with instance_create_depth((global.combat_player_x - 1) * 64,(global.combat_player_y - 1)* 64,0,global.combat_player) {
	identity = fighter.player;
}

if not global.combat_enemy1 = noone{
	with instance_create_depth(768,320,0,global.combat_enemy1) {
		identity = fighter.enemy1;
		image_xscale = -1;
	}
}

if not global.combat_enemy2 = noone{
	with instance_create_depth(768,320 - 128,0,global.combat_enemy2) {
		identity = fighter.enemy2;
		image_xscale = -1;
	}
}

if not global.combat_enemy3 = noone{
	with instance_create_depth(768,320 + 128,0,global.combat_enemy3) {
		identity = fighter.enemy3;
		image_xscale = -1;
	}
}

//GUI
global.combat_player_timer = 600;
timer = global.combat_player_timer;
global.combat_enemy_timer = 600;
timer2 = global.combat_enemy_timer;
global.combat_step = 1;
global.combat_turn = 0;
global.combat_main_choice = 1;
global.combat_choice = 0;

//result
global.combat_result = 0;
global.death_message = "LOL, you can't even beat a dummy!"

//player set
ini_open("data.ini");

global.combat_data[fighter.player,combat_data_name.attack_damage1] = global.player_att_d1;
global.combat_data[fighter.player,combat_data_name.attack_damage2] = global.player_att_d2;
global.combat_data[fighter.player,combat_data_name.attack_damage3] = global.player_att_d3;
global.combat_data[fighter.player,combat_data_name.health_] = global.player_health;
global.combat_data[fighter.player,combat_data_name.max_health] = global.player_max_health;
global.combat_data[fighter.player,combat_data_name.immune_time] = 0;
global.combat_data[fighter.player,combat_data_name.state] = fighter_state.normal;
global.combat_data[fighter.player,combat_data_name.state_timer] = 0;

ini_close();

combat_CD = global.player_weapon_CD;
combat_CD_timer = 0;
bottom1 = 0;
bottom2 = 32;
bottom3 = 32;
choice = 1;
particle_ = 0;
particle_2 = 0;

var x1 = global.combat_room_x1;
var x2 = global.combat_room_x2;
var y1 = global.combat_room_y1;
var y2 = global.combat_room_y2;
for (var a = x1; a < x2 + 1; a ++){
	for (var b = y1; b < y2 + 1; b ++) {
		instance_create_depth((a - 1)*64,(b - 1)*64,-999,object_back_ground);
	}
}