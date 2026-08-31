vspeed = min(vspeed, 20);

if (collideBuffer > 0)
{
    collideBuffer--;
    exit;
}

var player = instance_place(x, y, obj_player);
if (player == noone || !player.instakillHitbox.canAttack)
    exit;

vspeed = random_range(-10, -18);
hspeed = sign(x - player.x) * random_range(10, 18);
alarm[0] = 5;

collideBuffer = 10;
PartSpawn(x, y, PART_TYPES.BANG);

if (x != player.x)
    image_xscale = -sign(x - player.x);