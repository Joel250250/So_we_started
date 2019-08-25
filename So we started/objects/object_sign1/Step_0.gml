if place_meeting(x,y,object_player) and keyboard_check_pressed(vk_enter) and global.player_movable = 1{
	with instance_create_depth(0,0,-9999,object_communication) {
	Text[0] = "Be aware of foxes!";
	Text_x[0] = 
	Text_appear[0] = 0;
	Text_speed[0] = 0;
	Text_color[0] = c_black;
	Text_font[0] = Ink_Free;
	Text_movement[0] = 0;
	
	Text_box_sprite[0] = sprite_box1;
	Text_box_filling[0] = 0 - make_color_rgb(102,72,42);
	Head_portrait[0] = noone;
	
	auto[0] = 0;
	delay[0] = 0; 
	destroy_delay[0] = 0;
	}
}