//if global.combat_data[identity,combat_data_name.state] = fighter_state.normal {
	draw_sprite(sprite_stump,0,x,y);
//}
if identity = fighter.enemy1 {
draw_set_alpha(1);
draw_set_color(c_white);
draw_text(x,y,"exist");
}