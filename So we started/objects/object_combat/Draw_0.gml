//battle result
if global.player_health < 0 {
	global.player_health = 0;
}

if global.player_health = 0 {
	room_goto(room_you_die);
	global.combat_result = 1;
}

for (var b = 1; b < 4; b++){
	
	var c = 0;
	var d = 0;
	var e = 0;
	
	if global.combat_data[b,combat_data_name.name] != "nobody" { 
		if global.combat_data[b,combat_data_name.health_] = 0{
			c ++;
		}
		
		if global.combat_data[b,combat_data_name.will] = -1 and global.combat_data[fighter.player,combat_data_name.will] = -1 {
			d ++;
		}	
	} else {
		e ++;
	}
}

if c = 3 - e {
	global.combat_result = 2;
}

if d = 3 - e {
	global.combat_result = 3;
}

if c + d + e = 3 and global.combat_result = 0 {
	global.combat_result = 4;
}

if not global.combat_result = 0 {
	global.player_health = global.combat_data[fighter.player,combat_data_name.health_];
}

if global.player_health > global.player_max_health {
	global.player_health = global.player_max_health;
}


//turn
//uf


if global.combat_main_choice = 1{
	if bottom1 > 0 {
		bottom1 -=4;
	}
} else {
	if bottom1 < 32 {
		bottom1 +=4;
	}
}
		
if global.combat_main_choice = 2{
	if bottom2 > 0 {
		bottom2 -=4;
	}
} else {
	if bottom2 < 32 {
		bottom2 +=4;
	}
}

if global.combat_main_choice = 3{
	if bottom3 > 0 {
		bottom3 -=4;
	}
} else {
	if bottom3 < 32 {
		bottom3 +=4;
	}
}
		
if global.combat_step = 1 {
	if timer > 0 {
		timer --;
		draw_box(0, 768 - 192, 1024, 768, sprite_combat_textbox,0,1,1);
		//timer bar
		draw_set_alpha(1);
		draw_set_color(c_white);
		draw_rectangle(12,768 - 12 - 20,1024 - 12,768 - 12,false);
		draw_set_color(c_black);
		draw_rectangle(14,768 - 12 - 18,1024 - 12 - 2,768 - 12 - 2,false);
		draw_healthbar(16,768 - 12 - 16,1024 - 12 - 4,768 - 12 - 4,timer/global.combat_player_timer*100,c_black,c_white,c_white,0,false,false);
		if particle_ = 5 {
			particle_ = 0;
			for (var a = 0;a < 2;a++) {
				//particle of the timer bar
				with instance_create_depth(1000*timer/global.combat_player_timer,768 - 12 - 10,-100,object_particle) {
					x += irandom_range(-2,2);
					y += irandom_range(-8,8);
					sprite_index = sprite_fragment;
					image_xscale = 2;
					image_yscale = 2;
					alpha_speed_c = -2
					x_speed = irandom_range(1,100)/100;
					y_speed = irandom_range(-100,10)/100;
					y_speed_c = 4/100;
					rotate_speed = 3;
					size_change_speed = -2;
				}
			}
		} else {
			particle_ ++;
		}
		draw_box(0, 768 - 192 - 48 + bottom1, 320, 768 - 192 + 12,sprite_combat_bottom_l,0,1,1);
		draw_box(320 + 32, 768 - 192 - 48 + bottom2, 640 + 32, 768 - 192 + 12,sprite_combat_bottom_m,0,1,1);
		draw_box(640 + 64, 768 - 192 - 48 + bottom3, 1024, 768 - 192 + 12,sprite_combat_bottom_r,0,1,1);
		
		draw_set_alpha(1);
		draw_set_font(Calibri);
		draw_set_color(c_white);

		if not global.combat_choice = 0 {
			draw_set_color(c_aqua);
		}
		draw_text_transformed(160 - 12 - string_width("Attack")/2,768-192-32+string_height("Attack")*2*(bottom1/32),"Attack",2,2*(1 - bottom1/32),0);
		
		if not global.combat_choice = 0 {
			draw_set_color(c_aqua);
		}
		draw_text_transformed(480 + 16 - string_width("Item")/2,768-192-32+string_height("Item")*2*(bottom2/32),"Item",2,2*(1 - bottom2/32),0);
		
		if not global.combat_choice = 0 {
			draw_set_color(c_aqua);
		}
		draw_text_transformed(832 + 8 - string_width("Other")/2,768-192-32+string_height("Other")*2*(bottom3/32),"Other",2,2*(1 - bottom3/32),0);

	} else {
		//player's turn is over
		global.combat_step = 2;
		timer = global.combat_player_timer;
		global.combat_main_choice = 1;
		global.combat_choice = 0;
	}
} else {
	if timer2 > 0 {
		timer2 --;
		draw_set_alpha(1);
		draw_set_color(c_white);
		draw_rectangle(12,768 - 12 - 20,1024 - 12,768 - 12,false);
		draw_set_color(c_black);
		draw_rectangle(14,768 - 12 - 18,1024 - 12 - 2,768 - 12 - 2,false);
		draw_healthbar(16,768 - 12 - 16,1024 - 12 - 4,768 - 12 - 4,timer2/global.combat_enemy_timer*100,c_black,c_white,c_white,0,false,false);
		if particle_2 = 5 {
			particle_2 = 0;
			for (var a = 0;a < 2;a++) {
				//particle of the timer bar
				with instance_create_depth(1000*timer2/global.combat_enemy_timer,768 - 12 - 10,-100,object_particle) {
					x += irandom_range(-2,2);
					y += irandom_range(-8,8);
					sprite_index = sprite_fragment;
					image_xscale = 2;
					image_yscale = 2;
					alpha_speed_c = -2
					x_speed = irandom_range(1,100)/100;
					y_speed = irandom_range(-100,10)/100;
					y_speed_c = 4/100;
					rotate_speed = 3;
					size_change_speed = -2;
				}
			}
		} else {
			particle_2 ++;
		}
	} else {
		//enemies' turn is over
		global.combat_step = 1;
		timer2 = global.combat_enemy_timer;
		global.combat_turn ++;
		instance_destroy(object_back_ground);
		var x1 = global.combat_room_x1;
		var x2 = global.combat_room_x2;
		var y1 = global.combat_room_y1;
		var y2 = global.combat_room_y2;
		for (var a = x1; a < x2 + 1; a ++){
			for (var b = y1; b < y2 + 1; b ++) {
				instance_create_depth((a - 1)*64,(b - 1)*64,-999,object_back_ground);
			}
		}
	}
}

if global.combat_step = 1 and global.combat_choice = 0{
	if keyboard_check_pressed(ord("A")) or keyboard_check_pressed(vk_left){
		if global.combat_main_choice > 1{
			global.combat_main_choice --;
		} else {
			global.combat_main_choice = 3;
		}
	}
	
	if keyboard_check_pressed(ord("D")) or keyboard_check_pressed(vk_right){
		if global.combat_main_choice < 3{
			global.combat_main_choice ++;
		} else {
			global.combat_main_choice = 1;
		}
	}
	
	if keyboard_check_pressed(vk_enter) {
		global.combat_choice = 1;	
	}
}

if combat_CD_timer > 0 {
	combat_CD_timer --;
}

if global.combat_step = 1 and global.combat_main_choice = 1 and not global.combat_choice = 0{
	if combat_CD_timer = 0 {
		if keyboard_check_pressed(ord("A")) or keyboard_check_pressed(vk_left){
			global.combat_choice = 2;
		}
		
		if keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down){
			global.combat_choice = 3;
		}
		
		if keyboard_check_pressed(ord("D")) or keyboard_check_pressed(vk_right){
			global.combat_choice = 4;
		}
	}
	
	if keyboard_check_pressed(vk_shift) {
		global.combat_choice = 0;
	}
}

if global.combat_step = 1 and global.combat_main_choice = 2 and not global.combat_choice = 0{
	if keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_down){
		choice = 3;
	}
	
	if keyboard_check_pressed(ord("A")) or keyboard_check_pressed(vk_left){
		choice = 1;
	}
	
	if keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down){
		choice = 4;
	}
	
	if keyboard_check_pressed(ord("D")) or keyboard_check_pressed(vk_right){
		choice = 2;
	}
	
	if keyboard_check_pressed(vk_shift) {
		global.combat_choice = 0;
	}
}

//immune time
for (var a = 0; a < 4; a++) {
	if global.combat_data[a,combat_data_name.name] != "nobody"{ 
		if global.combat_data[a,combat_data_name.immune_time] > 0 {
			global.combat_data[a,combat_data_name.immune_time] --;
		}
	}
}
