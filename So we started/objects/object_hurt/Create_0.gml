sprite_index = noone;
image_speed = 1;
image_xscale = 1;
image_yscale = 1;
draw_set_color(color_get_value(c_white));
attack_duration = 1;//-1 won't disappear
attack_type = 0;//0 1 2
disappear_c = 0;
attacker = fighter.player;
victim = fighter.enemy1;

if victim = fighter.player {
	victim_object = global.combat_player;
}

if victim = fighter.enemy1 {
	victim_object = global.combat_enemy1;
}

if victim = fighter.enemy2 {
	victim_object = global.combat_enemy2;
}

if victim = fighter.enemy3 {
	victim_object = global.combat_enemy3;
}

//
a = global.combat_data[attacker,attack_type];
b = global.combat_data[attacker,combat_data_name.tireness];
c = global.combat_data[attacker,combat_data_name.will];
d = global.combat_data[attacker,combat_data_name.strength];

attack_damage = a* (d/10)* (c+1)/ (b+1)*10;

attack_duration_t = 0;