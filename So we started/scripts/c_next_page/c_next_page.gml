if page_ = array_length_1d(Text) - 1 {
	instance_destroy(id);
	global.player_movable = 1;
} else {
	page_++;
	char_ = 0;
	if keyboard_check(vk_enter) {
		key_pressed = 1;
	}else{
		key_pressed = 0;
	}
}