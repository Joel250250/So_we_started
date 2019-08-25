depth = - 9998;
draw_set_alpha(1);
global.player_movable = 0;
draw_set_font(Calibri_Bold);

////default

//text
Text[0] = "Text";  //string
Text_x[0] = 0;
Text_y[0] = 0;
Text_appear[0] = 0;  //int
Text_speed[0] = 0; //int
Text_color[0] = c_white; //color
Text_font[0] = Calibri; //font
Text_movement[0] = 0; //int

//text box
Head_portrait[0] = noone;
Text_box_sprite[0] = sprite_text_box; //sprite
Text_box_filling[0] = c_black; //color

//appear and destroy
auto[0] = 0;
delay[0] = 0; //no needs to be set if auto = 0
destroy_delay[0] = 0; //no needs to be set if auto = 0

////information for each sentence
page_ = 0;
char_ = 0;

//if key entre was pressed in last frame
if keyboard_check(vk_enter) {
	key_pressed = 1;
}else{
	key_pressed = 0;
}