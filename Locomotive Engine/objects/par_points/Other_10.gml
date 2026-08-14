hud_pointsbook_add_collect_effect(value);
create_points_number(value);
sound_instance_one_shot(eventPath, x, y);
instance_destroy();

if (IsSecret())
{
    with (InstanceCreate(x, y, obj_ghostcollectable))
        sprite_index = other.sprite_index;
}