draw_set_alpha(1)

if (wait < _wait) {
	wait ++;
}

//animation for lying 

if (global.lying = "true" ) {
	
	if wait = 120 {
		image_index = 1;
	}
	
	if wait = 150 {
		image_index = 0;
	}
	
	if wait = 210 {
		image_index = 1;
	}
	
	if wait = 240 {
		image_index = 0;
	}
	
	if wait = 360 {
		image_index = 1;
	}
	
	if wait = 390 {
		image_index = 2;
	}

	if (wait = _wait and keyboard_check_pressed(vk_anykey)) {
	global.player_movable = 1;
	global.lying = "false"
	sprite_index = sprite_jasper_walk_r;
	}
}

//moving

var _moving = 0;

if (global.player_movable = 1) {
	if (keyboard_check(vk_right)) {
		if (not place_meeting(x+_speed,y,object_solid)) {
			x+=_speed;
		}
		sprite_index = sprite_jasper_walk_r;
		if (keyboard_check_pressed(vk_right)) {
			image_index ++;
		}
		var _moving = 1;
	}
	
	
	if (keyboard_check(vk_left)) {
		if (not place_meeting(x-_speed,y,object_solid)) {
			x-=_speed;
		}
		sprite_index = sprite_jasper_walk_l;
		if (keyboard_check_pressed(vk_left)) {
			image_index ++;
		}
		var _moving = 1;
	}
	
	
	if (keyboard_check(vk_up)) {
		if (not place_meeting(x,y-_speed,object_solid)) {
			y-=_speed;
		}
		sprite_index = sprite_jasper_walk_u;
		if (keyboard_check_pressed(vk_up)) {
			image_index ++;
		}
		var _moving = 1;
	}
	
	
	if (keyboard_check(vk_down)) {
		if (not place_meeting(x,y+_speed,object_solid)) {
			y+=_speed;
		}
		sprite_index = sprite_jasper_walk_d
		if (keyboard_check_pressed(vk_down)) {
			image_index ++;
		}
		var _moving = 1;
	}
	
	if _moving = 0 {
		image_speed = 0;
		image_index = 0;
	} else {
		image_speed = _image_speed;
	}

}

depth = -y;

//rooms 

if room = room_temple and place_meeting(x,y,object_exit1) {
	
	global.playerX = 64;
	global.playerY = y;
	global.player_movable = 0;
	room_goto_with_delay(room_forest,_room_delay,c_black);
	
}

if room = room_forest and place_meeting(x,y,object_exit1) {
	
	global.playerX = 1008;
	global.playerY = y;
	global.player_movable = 0;
	room_goto_with_delay(room_temple,_room_delay,c_black);
	
}

if room = room_forest and place_meeting(x,y,object_exit2) {
	
	global.playerX = 32;
	global.playerY = y;
	if y < 384 {
	 global.playerY = 384;
	}
	global.player_movable = 0;
	room_goto_with_delay(room_forest2,_room_delay,c_black);
	
}

if room = room_forest2 and place_meeting(x,y,object_exit1) {
	
	global.playerX = 1008;
	global.playerY = y;
	global.player_movable = 0;
	room_goto_with_delay(room_forest,_room_delay,c_black);
	
}

if room = room_forest2 and place_meeting(x,y,object_exit3) {
	
	global.playerX = x;
	global.playerY = 736;
	global.player_movable = 0;
	room_goto_with_delay(room_forest3,_room_delay,c_black);
}

if room = room_forest2 and place_meeting(x,y,object_exit4) {
	
	global.playerX = x;
	global.playerY = 64;
	global.player_movable = 0;
	room_goto_with_delay(room_water_pool,_room_delay,c_black);
}

if room = room_forest3 and place_meeting(x,y,object_exit4) {
	
	global.playerX = x;
	global.playerY = 736;
	global.player_movable = 0;
	room_goto_with_delay(room_forest3,_room_delay,c_black);
}

if room = room_testing and place_meeting(x,y,object_exit3) {
	//uf
	combat_default_setting();
	global.playerX = x;
	global.playerY = 736;
	global.player_movable = 0;
	global.combat_room = room;

	global.combat_room_x1 = 4;
	global.combat_room_y1 = 4;
	global.combat_room_x2 = 6;
	global.combat_room_y2 = 6;
	
	global.combat_player = object_combat_dummy;
	global.combat_player_x = 5;
	global.combat_player_y = 5;
	
	global.combat_enemy1 = object_combat_dummy;
	global.combat_enemy2 = noone;
	global.combat_enemy3 = noone;
	global.combat_data[fighter.enemy1,combat_data_name.name] = "dummy";
	global.combat_data[fighter.enemy1,combat_data_name.attack_damage1] = 2;

	
	global.combat_enable_enemy_learning = false;
	
	room_goto_with_delay(room_combat_room,30,c_aqua);
}

if room = room_testing and place_meeting(x,y,object_exit4) {
	
	game_end();
	
}
