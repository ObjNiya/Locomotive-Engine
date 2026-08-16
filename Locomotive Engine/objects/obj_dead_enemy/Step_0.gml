if (vsp < 20)
    vsp += grav;

x += hsp;
y += floor(vsp);

if (collideBuffer > 0)
{
    collideBuffer--;
    exit;
}

var player = instance_place(x, y, obj_player);
if (player == noone || !player.instakillHitbox.canAttack)
    exit;

vsp = random_range(-10, -18);
hsp = sign(x - player.x) * random_range(10, 18);
collideBuffer = 10;

alarm[0] = 5;
InstanceCreate(x, y, obj_bang_particle);

if (x != player.x)
    image_xscale = -sign(x - player.x);