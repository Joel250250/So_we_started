if (f>60 and f<460) {
	draw_set_color(c_white);
	draw_set_alpha(1 - r/100);
	draw_circle(512,384,r*8,false);
}

if (f>60 and f<90) {
	for (var a = 0; a < 300; a++) {
		draw_set_alpha(1 - a*3.3);
	}
}

if (f > 60 and f < 160) {
	r ++;
}

if (f > 360 and f < 460) {
	r -=1;	
}

if (f = 720) {
	instance_create_depth(512,384,0,object_crystal);
}

if (f = 720) {
	r=0;
}

if (f > 720 and f < 820) {
	r ++;
	draw_set_color(c_white);
	draw_set_alpha(1 - r/60);
	draw_circle(512,384,r*15,false);
}

if (f=900) {
	draw_set_alpha(1);
	draw_set_font(Calibri);
	draw_text(512 - string_width(_Text)/2, 464 + string_height(_Text)/2,_Text);
	


}

	if keyboard_check_pressed(vk_enter) {
		room_goto(room_menu);
	}


