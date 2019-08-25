//leave argument6 = 1 to show normally
//all the arguments should be numbers expect argument4

var _x = argument0;
var _y = argument1;
var _x2 = argument2;
var _y2 = argument3;
var _box_sprite = argument4;
var _filling_color = argument5;
var _color = 0 - argument6;
var _alpha = argument7;

var _w = sprite_get_width(argument4)/3;

//corners
draw_sprite_part_ext(_box_sprite,0,0,0,_w,_w,_x,_y,1,1,_color,_alpha);
draw_sprite_part_ext(_box_sprite,0,_w*2,0,_w,_w,_x2 - _w,_y,1,1,_color,_alpha);
draw_sprite_part_ext(_box_sprite,0,0,_w*2,_w,_w,_x,_y2 - _w,1,1,_color,_alpha);
draw_sprite_part_ext(_box_sprite,0,_w*2,_w*2,_w,_w,_x2 - _w,_y2 - _w,1,1,_color,_alpha);

//edges
draw_sprite_part_ext(_box_sprite,0,_w,0,_w,_w,_x + _w,_y,(_x2 - _x)/_w - 2,1,_color,_alpha);
draw_sprite_part_ext(_box_sprite,0,0,_w,_w,_w,_x ,_y + _w,1,(_y2 - _y)/_w - 2,_color,_alpha);
draw_sprite_part_ext(_box_sprite,0,_w,_w*2,_w,_w,_x + _w,_y2 - _w,(_x2 - _x)/_w - 2,1,_color,_alpha);
draw_sprite_part_ext(_box_sprite,0,_w*2,_w,_w,_w,_x2 - _w,_y + _w,1,(_y2 - _y)/_w - 2,_color,_alpha);

//middle
if not _filling_color = -1 {
	draw_set_color(0 - _filling_color);
	draw_set_alpha(_alpha);
	draw_rectangle(_x + _w, _y + _w, _x2 - _w,_y2 - _w ,false);
}

draw_set_alpha(1);
draw_set_color(-1);