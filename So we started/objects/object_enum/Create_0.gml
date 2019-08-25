enum fighter {
	player = 0,
	enemy1,
	enemy2,
	enemy3,
}

enum impression {
	ability = 0, //0 - 10
	friend,// -5 - 5
	kind, //0 -10
	strong_willed, //0 - 10
	aggressive, //0 - 10
	sneaky, //0 - 10
}

enum combat_data_name {
	name = 0,
	attack_damage1 ,// 0 - 20
	attack_damage2,//0 - 20
	attack_damage3,//0 - 20
	resistance,//0 - 20
	health_,
	max_health,
	tireness,//0 - 1
	will,//-1 - 1
	strength,//0 - 10
	immune_time,//0 - 60
	state,
	state_timer,
}

enum fighter_state{
	normal,
	hurt,
	badly_hurt,
	die,
}