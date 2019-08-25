image_angle += rotate_speed;
image_xscale += size_change_speed/100;
image_yscale = image_xscale;
x += x_speed;
y += y_speed;
x_speed += x_speed_c;
y_speed += y_speed_c;
image_alpha += alpha_speed_c/100;

if timer > 0 {
	timer --;
} else {
	instance_destroy(id);
}

if image_xscale < 0 {
	instance_destroy(id);
}

if created = 0 {
	created = 1;
} else {
	draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,color,image_alpha);
}
