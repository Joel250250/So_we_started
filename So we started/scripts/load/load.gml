ini_open("data.ini")

//player's position
global.playerX = ini_read_real("Player","PlayerX",0);
global.playerY = ini_read_real("Player","PlayerY",0);
room_goto(asset_get_index(ini_read_string("Player","Room","")));

//player's status
global.player_att_d1 = ini_read_real("Player","attack_damage1",1);
global.player_att_d2 = ini_read_real("Player","attack_damage2",1);
global.player_att_d3 = ini_read_real("Player","attack_damage3",1);
global.player_health = ini_read_real("Player","Health",1);
global.player_max_health = ini_read_real("Player","Max_health",1);
global.player_weapon_CD = ini_read_real("Player","Weapon_CD",1)

//anti cheating
if global.player_health > 200 {
	show_message("How dare you cheat!");
	game_end();
}

if global.player_health > global.player_max_health {
	show_message("How dare you cheat!");
	game_end();
}

//
global.lying = ini_read_string("Data","lying","");

global.delay = 20;

ini_close();