if global.combat_step = 1 {
	if e = 0 {
		a+=1*c;
		
		if a > b {
			b = irandom_range(30,100);
			if a < b {
				e = 0;
			} else {
				e = 1;
			}
		}
	} else {
		a-=1*c;
		
		if a < b {
			b = irandom_range(30,100);
			if a < b {
				e = 0;
			} else {
				e = 1;
			}
		}
	}
	draw_sprite_ext(sprite_index,0,x,y,1,1,0,-1,a/100);
} else {
	
	if d = 0 {
		a = 30;
		b = 100;
		d = 1;
	}
	
	if a > b {
		a--;
	} else {
		a++;
	}
	
	if a = b {
		if a = 30 {
			b = 100;
		} else {
			b = 30;
		}
	}
	draw_sprite_ext(sprite_index,0,x,y,1,1,0,-1,a/100);
}

