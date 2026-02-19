repeat 4 {
	with create_debris(x, y, spr_towerblockdebris) {
        hsp = random_range(-5, 5);
        vsp = random_range(-10, 10);
		image_speed = 0.35
	}
}