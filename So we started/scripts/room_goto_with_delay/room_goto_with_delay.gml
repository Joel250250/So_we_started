var _room = argument0;
var _delay = argument1;
var _color = argument2; 

room_delay++;

if _delay > 0 {
	with (instance_create_depth(0,0,-9999,object_rectangle_drawer)) {
		r_type = 0;
		r_color = _color;
		r_delay = _delay;
	}
} else {
	with (instance_create_depth(0,0,-9999,object_rectangle_drawer)) {
		r_type = 1;
		r_color = _color;
		r_delay = _delay;
	}
}

if room_delay = _delay{
	room_goto(_room);
}
