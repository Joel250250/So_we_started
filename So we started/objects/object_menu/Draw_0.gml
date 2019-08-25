draw_set_color(c_white);
draw_set_font(Calibri_Bold);

if c = 1 {
	draw_set_color(c_aqua);
	draw_rectangle(504 - string_width(Text_1),344,520 + string_width(Text_1),344+string_height(Text_1)*2,true);
}

draw_text_transformed(512-string_width(Text_1),344,Text_1,2,2,0);

draw_set_color(c_white);

if c = 2 {
	draw_set_color(c_aqua);
	draw_rectangle(504 - string_width(Text_2),424,520 + string_width(Text_2),424+string_height(Text_2)*2,true);
}

draw_text_transformed(512 - string_width(Text_2),424,Text_2,2,2,0);

////////////////////////////

ini_open("data.ini");

var _room = ini_read_string("Player","Room","");
var _text = _room;

ini_close();

var box = sprite_text_box;
var f_color = 0;
var t_color = c_white;
var t_font = Calibri_Bold;

if _room = "room_temple" {
	_text = "Temple";
	
	draw_sprite(sprite_pillar,0,352,768);
	draw_sprite(sprite_pillar,0,640,768);
	draw_sprite(sprite_moss,0,640,512);
}

if _room = "room_forest" {
	_text = "Forest"
	box = sprite_box1;
	t_color = color_get_value(c_black);
	t_font = Ink_Free;
	f_color = 0 - make_color_rgb(102,72,42);
	
	draw_sprite(sprite_tree_1_3,0,384,608);
	draw_sprite(sprite_tree_1_3,0,512,608);
	draw_sprite(sprite_tree_1_2,0,320,608);
	draw_sprite(sprite_tree_1_2,0,448,608);
	draw_sprite(sprite_tree_1_2,0,576,608);
	draw_sprite(sprite_tree_1_1,0,352,608);
	draw_sprite(sprite_tree_1_1,0,544,608);
	draw_sprite(sprite_tree_1_1,0,416,608);
	draw_sprite(sprite_tree_1_1,0,480,608);
}

draw_box(318,152,712,296,box,f_color,1,1);
draw_set_color(t_color);
draw_set_font(t_font);
draw_text_transformed(512 - string_width(_text), 224 - string_height(_text),_text,2,2,0);
