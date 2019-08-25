f ++;
text_f ++;

//rectangles
if (f > 120*(array_length_1d(_Text)-2)) {
	r_f += 1;
	if (r_f > 60){
		r_h = (r_f - 30)/4;
	}
}

if (r_h > 0 and r_f < 300) {
	draw_set_color(make_color_rgb(255,25,0));
	draw_rectangle(0,384 - r_h/1.5, 1024, 384 + r_h/ 4.5, false);
}

if (r_h > 0 and r_f < 300) {
	draw_set_color(make_color_rgb(255,80,0));
	draw_rectangle(0,384 - r_h/2.25, 1024, 384 + r_h / 6.75, false);
}

if (r_h > 0 and r_f < 300) {
	draw_set_color(make_color_rgb(255,120,0));
	draw_rectangle(0,384 - r_h/3.5, 1024, 384 + r_h / 10.5, false);
}

if (r_h > 0 and r_f < 300) {
	draw_set_color(make_color_rgb(255,160,0));
	draw_rectangle(0,384 - r_h/5, 1024, 384 + r_h / 15, false);
}

if (r_f > 300 and r_f < 330) {
	var a = r_f - 300;
	draw_set_color(c_white);
	draw_rectangle(0,384 - a*13, 1024, 384 + a*13, false);
}

if (r_f >= 330 and r_f <450) {
	var a = r_f - 330
	draw_set_color(c_white);
	draw_set_alpha(1 - a/120);
	draw_rectangle(0,0, 1024,768, false);
}

//text
if (f<120*(array_length_1d(_Text)) + 60) {
	var ir = irandom_range(0,1);
	
	draw_set_font(Consolas_Bold);
	
	color_get_value(c_white);
	draw_text(512 - string_width(_Text[_Page])/2 + ir, 352 + string_height(_Text[_Page])/2 + ir,_Text[_Page]);
}

if (f = 120*(array_length_1d(_Text)) + 480) {
	
	room_goto(room_starting);
	rebuild();
	rebuild_part_2();

}

if (text_f = 120) {
	text_f = 0;
	if (_Page + 1 < array_length_1d(_Text)) {
		_Page += 1;
	}
}
