var target_fade = real(!fadeIn);

image_alpha = Approach(image_alpha, target_fade, fadeSpd);

if (image_alpha != target_fade)
    exit;

if (--endLag > 0)
    exit;

if (fadeIn)
{
    instance_destroy();
    exit;
}

with (obj_player)
    frozen = false;
fadeIn = true;

RoomGoto();
if (onSwitch != -1)
    onSwitch();