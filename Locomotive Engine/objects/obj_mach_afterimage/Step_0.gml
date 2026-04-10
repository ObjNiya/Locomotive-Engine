if (!use_alpha)
    exit;

with (spawner_id)
{
    var mvspd = abs(x - other.spawner_prev_x);
    var sub = 4;

    other.image_alpha = (mvspd - sub) / (12 - sub);
    other.spawner_prev_x = x;
}

image_alpha = clamp(image_alpha, 0, 1);