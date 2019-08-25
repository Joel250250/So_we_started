//delay
if delay[page_] > 0 {
	delay[page_] --;
}

if not keyboard_check(vk_enter) and key_pressed = 1{
	key_pressed = 0;
}

if delay[page_] = 0 {

draw_set_color(c_white);
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var cw = camera_get_view_width(view_camera[0]);
var ch = camera_get_view_height(view_camera[0]);

//text box
draw_box(cx,cy + ch - 160,cx + cw,cy + ch, Text_box_sprite[page_], Text_box_filling[page_],1,1);

//head portrait
if Head_portrait[page_] = noone {
	var h_p_w = 0;
	draw_text(cx,cy,page_);
} else {
	var h_p_w = sprite_get_width(Head_portrait[page_])*2;
	draw_sprite_ext(Head_portrait[page_],0,cx+sprite_get_width(Text_box_sprite[page_])/3 - 8,
					cy+ch-160+sprite_get_height(Text_box_sprite[page_])/3 - 8,2,2,0,-1,1);
}

////text
draw_set_font(Text_font[page_]);
draw_set_color(Text_color[page_]);
var ir = 0;

//text_movement
if Text_movement[page_] = 1 {
	var ir = irandom_range(0,1);
}

//text appear
//0
if Text_appear[page_] = 0 {
	draw_text_ext(cx + ir + h_p_w + Text_x[page_]+ 32, cy + ch + Text_y[page_] - 160 + 32 + ir,Text[page_],3,cw - h_p_w - 64);
	
	if auto[page_] = 1 {
		if destroy_delay[page_] > 0{
			destroy_delay[page_] --;
		} else {
			c_next_page()
		}
	} else {
		if keyboard_check_pressed(vk_enter) and key_pressed = 0 {
			c_next_page();
		}
	}
	
}

//1
if Text_appear[page_] = 1 {
	
	if char_ < string_length(Text[page_]){
		
		char_ += Text_speed[page_];
		
		if keyboard_check_pressed(vk_enter) and auto[page_] = 0 and key_pressed = 0 {
			char_ = string_length(Text[page_]);
		}
		
	} else{
		
		if auto[page_] = 1 {
			if destroy_delay[page_] > 0{
				destroy_delay[page_] --;
			} else {
				c_next_page();
			}
		} else {
			if keyboard_check_pressed(vk_enter) and key_pressed = 0 {
				c_next_page();
			}
		}
		
	}
	
	var text_part = string_copy(Text[page_],1,char_);
	draw_text_ext(cx + ir + h_p_w + Text_x[page_] + 32, cy + ch + Text_y[page_] - 160 + 32 + ir,text_part,3,cw - h_p_w - 64);
}

}

