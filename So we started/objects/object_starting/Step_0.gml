if (f <900){ 
	f++;
}

if (f=60) {
	global.starting = 0.5;
	for (var a = 0; a < 300; a++) {
		instance_create_depth(512,384,0 ,object_fragment);
	}
}

if(f > 120 and f < 180) {
	b ++;
	if b > 3 {
		with (instance_create_depth(irandom_range(0,1024),irandom_range(0,768),0,object_light)) {
		image_xscale = irandom_range(5,10)/10;
		image_yscale = image_xscale;
		b = 0;
		}
	}
}

if (f = 180) {
	global.starting = 1;
}


if (f = 360) {
	global.starting = 2;
}

if (f = 720) {
	instance_destroy(object_fragment);
}




