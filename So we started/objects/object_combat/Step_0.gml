//anti cheating
if global.combat_data[fighter.player,combat_data_name.health_] > 200 {
	game_end();
}

if global.combat_data[fighter.player,combat_data_name.max_health] > 200 {
	game_end();
}

for (var z = 0; z < 4;z++) {

	if global.combat_data[z,combat_data_name.attack_damage1] > 20 or global.combat_data[z,combat_data_name.attack_damage1] < 0{
		game_end();
	}
	if global.combat_data[z,combat_data_name.attack_damage2] > 20 or global.combat_data[z,combat_data_name.attack_damage2] < 0{
		game_end();
	}
	if global.combat_data[z,combat_data_name.attack_damage3] > 20 or global.combat_data[z,combat_data_name.attack_damage3] < 0{
		game_end();
	}
	if global.combat_data[z,combat_data_name.immune_time] > 120 or global.combat_data[z,combat_data_name.immune_time] < 0{
		game_end();
	}
	if global.combat_data[z,combat_data_name.resistance] > 20 or global.combat_data[z,combat_data_name.resistance] < 0{
		game_end();
	}
	
}
