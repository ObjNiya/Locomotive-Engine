if (vsp < 20)
    vsp += grav;

x += hsp;
y += floor(vsp);

cloudPartTimer.Step();

if (collideBuffer > 0)
{
    collideBuffer--;
    exit;
}

var player = instance_place(x, y, obj_player);
if (player == noone || !player.instakillmove)
    exit;

vsp = random_range(-10, -18);
hsp = sign(x - player.x) * random_range(10, 18);
collideBuffer = 10;

cloudPartTimer.Start();
instance_create(x, y, obj_bang_particle);

if (x != player.x)
    image_xscale = -sign(x - player.x);