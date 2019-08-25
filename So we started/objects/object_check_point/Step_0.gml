a++;

if (a < 60) {
	y-=0.1;
}

if (a > 90 and a < 150) {
	y+=0.1;
}

if (a = 180) {
	a = 0;
	y = _y;
}

if place_meeting(x,y,object_player) and keyboard_check_pressed(vk_enter) {
	
	b ++;
	c = 200;
	save();
	
	////text, color setting
	//default
		
	_room = room;
	_box = sprite_text_box;
	r_color = c_white;
	f_color = 0;
	_Text = ""
	
	//normal situation (no cheating)
	
	if room = room_forest {
		_room = "Forest";
		_box = sprite_box1;
		f_color = 0 - make_color_rgb(102,72,42);
		r_color = c_black;
		r_font = Ink_Free;
	}
	
	//E1
	
	if global.E1 = 0 {
	
		if b = 6 {
			_Text = "Stop it!"
		}
		
		if b = 7 {
			_Text = "It's not funny!"
		}
	
		if b = 8 {
			 _Text = "..."
			save_real("data.ini","E","E1",1);	
		}
			
		if b = 9 {
			_Text = "You like finding easter eggs, don't you?"
		}
		
		if b = 10 {
			_Text = "I have nothing left to say."
		}
	
		if b = 11 {
			_Text = "..."
		}
		
		if b = 12 {
			_Text = ""
		}
	}
	
	if global.E1 = 1 {
		if b = 3 {
			_Text = "Well, here you go...again."
		}
			
		if b = 4 {
			_Text = "..."
		}
		
		if b = 5 {
			_Text = "Why you are so annoying?"
		}
		
	}
}