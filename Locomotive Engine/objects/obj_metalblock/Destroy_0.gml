if (array_length(targetTiles) >= 1)
    TilesDestroyArea(targetTiles, bbox_left, bbox_top, bbox_right, bbox_bottom);

repeat (debrisAmnt)
{
    with (InstanceCreate(x + M_RandomInt(sprite_width), y + M_RandomInt(sprite_height), obj_block_debris))
    {
        sprite_index = other.debrisSpr;
        image_index = M_RandomInt(image_number);
    }
}

with (instance_place(x, y, [par_points, obj_secretegg]))
    visible = true;

SaveroomAdd();
Sleep(5);
InstanceCreate(x + 32, y + 32, obj_bang_particle);
sound_instance_one_shot(destroySnd, x, y);

with (obj_player)
    camera.shake_set(20, 0.666);