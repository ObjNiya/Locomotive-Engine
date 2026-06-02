x += shake;
y += shake;

hspeed = approach(hspeed, 0, 0.25);
vspeed = approach(vspeed, 0, 0.25);

shake = irandom_range(-1, 1);