//player movement
global.player_movable = 1;
with instance_create_depth(0,0,-1001,object_rectangle_drawer) {
	r_delay = 20;
	r_type = 1;
}
wait = 0;
_wait = 30;
_image_speed = 0.4;
_speed = 3;
room_delay = 0;
_room_delay = 20;
image_speed = 0;
image_index = 0;
image_xscale = 2.2;
image_yscale = 2.2;

if global.lying = "true" {
	
	sprite_index = sprite_jasper_lie_down;
	_wait = 400;
	global.player_movable = 0;
	
}


////room environment setting

//light
global.light_color = 0;

if (room = room_temple) {
	global.light_color = 1;
}

if (room = room_forest) {
	global.light_color = 1;
}

//water
global.water_color = c_white;
global.water_alpha = 1;

if (room = room_water_pool) {
	global.water_color = make_color_rgb(70,110,60);
	global.water_alpha = 0.5;
}

////
x = global.playerX;
y = global.playerY;