/// @ignore
function StateEnemyThrownCreate()
{
    movespeed = 25;
    hsp = lengthdir_x(movespeed, thrownAngle);
    vsp = -lengthdir_y(movespeed, thrownAngle);
    grav = 0;
    hurtbox.canAttack = true;
    hurtbox.canHurt = false;
    
    sprite_index = throwSpr;
}

/// @ignore
function StateEnemyThrownStep()
{
    static blur_afterimage_timer = 2;
    if (--blur_afterimage_timer <= 0)
    {
        blur_afterimage_timer = 2;
        create_afterimage(x, y, obj_blur_afterimage);
    } 
    
    if (dashcloudPartTimer <= 0 && abs(hsp) > 4 && grounded)
    {
        PartSpawnDirX(x, bbox_bottom, PART_TYPES.DASHCLOUD, dir);
        dashcloudPartTimer = 13;
    }
    
    BlocksDestroy(x + hsp, y, true, false, [obj_metalblock]);
    BlocksDestroy(x, y + vsp, false, true, [obj_metalblock]);
    
    var orig_x = x;
    var orig_y = y;
    
    x += hsp;
    y += vsp;
    
    var enemy = HitboxPlace(hurtbox, par_enemy, "hurtbox")
    if (enemy != noone && enemy.id != id)
        AttackEnemy(enemy, self);
    
    x = orig_x;
    y = orig_y;
    
    if (place_meeting_collision(x + hsp, y) || place_meeting_collision(x, y + vsp) || (vsp == 0 && hsp == 0))
        instance_destroy();
}