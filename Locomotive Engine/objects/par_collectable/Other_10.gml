hud_pointsbook_add_collect_effect(value);
create_points_number(value);
sound_instance_one_shot(event_path, x, y);
instance_destroy();

if (is_secret())
{
    with (instance_create(x, y, obj_ghostcollectable))
        sprite_index = other.sprite_index;
}