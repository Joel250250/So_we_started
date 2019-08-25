r_time ++;

//r_type = 0 for alpha +
//r_type = 1 for alpha -
if r_type = 0 {
	draw_set_alpha(r_time/r_delay);
	draw_set_color(r_color2);
	draw_rectangle(0,0,room_width,room_height,false);
} else {
	draw_set_alpha(1 - r_time/r_delay);
	draw_set_color(r_color2);
	draw_rectangle(0,0,room_width,room_height,false);
}

if r_time = r_delay {
	instance_destroy(object_rectangle_drawer);
}

draw_set_alpha(1);
