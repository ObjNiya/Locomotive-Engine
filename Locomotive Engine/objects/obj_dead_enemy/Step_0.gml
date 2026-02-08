vsp += grav;
x += hsp;
y += vsp;

hsp = approach(hsp, 0, 0.1);

shake_magnitude = approach(shake_magnitude, 0, shake_decrease);

visual_xscale = approach(visual_xscale, 1, 0.04);
visual_yscale = approach(visual_yscale, 1, 0.04);