draw_self();
draw_set_alpha(1);

if c > 0 {
	
	c -= 1;
	ccx = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2;
	ccy = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2;
	
	if c < 100 {
		d = c/100;
	} else {
		d = 1;
	}

	draw_box(ccx - 160,ccy - 100,ccx + 160,ccy + 100,sprite_text_box,color_get_value(c_black),1,d);
	
	draw_box(ccx - string_width(_room)/2 - 32, ccy - string_height(_room)/2 - 62,
	ccx + string_width(_room)/2 + 32, ccy + string_height(_room)/2 - 2,_box,f_color,1,d);

	draw_set_color(r_color);
	draw_set_font(r_font);
	draw_text(ccx - string_width(_room)/2,ccy - string_height(_room)/2 - 30,_room);
	
	draw_set_color(c_white);
	draw_set_font(Calibri);
	draw_text(ccx - string_width("Data saved")/2,ccy - string_height("Data saved")/2 + 30,"Data saved");

	draw_set_color(c_aqua);
	draw_set_font(Calibri_Bold);
	draw_text(ccx - string_width(_Text)/2,ccy - string_height(_Text)/2 + 60,_Text);
	
}