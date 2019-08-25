
image_angle += speed*2 + 2;


if (global.starting = 1) {
	
	if (speed > 0){
	speed -=0.01;
	}
}

if (global.starting = 2) {
	
	if (speed <= 3) {
		speed +=0.02;
	}
	
	if (image_xscale > 1.2) {
		image_xscale -= 0.005;
		image_yscale = image_xscale;
	}
	
	direction = point_direction(x,y,512,384)
	if (x>510 and x < 514 and y> 380 and y<388) {
		speed=0
		image_angle = 0
	}
}

