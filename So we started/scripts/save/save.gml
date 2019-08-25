save_real("data.ini","Player","PlayerX",object_player.x);
save_real("data.ini","Player","PlayerY",object_player.y);
save_string("data.ini","Player","Room",room_get_name(room));

save_real("data.ini","Player","Max_health",global.player_max_health);
save_real("data.ini","Player","Health",global.player_health);

save_string("data.ini","Data","lying",global.lying);