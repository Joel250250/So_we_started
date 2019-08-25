if (keyboard_check_pressed(vk_up)) {
	c = 1;
}

if (keyboard_check_pressed(vk_down)) {
	c = 2;
}

if keyboard_check_pressed(vk_enter) {
	if c = 1 {
		load();
	}
}

if keyboard_check_pressed(vk_enter) {
	if c = 2 {
		rebuild();
		load();
	}
}
