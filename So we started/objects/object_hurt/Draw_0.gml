if place_meeting(0,0,victim_object) and global.combat_data[victim,combat_data_name.immune_time] {
	
	global.combat_data[victim,combat_data_name.health_] -= attack_damage;
	
	if victim = fighter.player {
		global.combat_data[victim,combat_data_name.immune_time] = 60;
	}

	if disappear_c = 1 {
		instance_destroy(id);
	}
}

if not attack_duration = -1 {
	attack_duration_t ++;
	
	if attack_duration_t = attack_duration {
		instance_destroy(id);
	}
}