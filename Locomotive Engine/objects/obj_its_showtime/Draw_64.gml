if (flashAlpha != -1)
    exit;

array_foreach(timings, function(time, index) {
    var music_pos = sound_instance_get_timeline_position(global.music);
    
    if (index == 3)
    {
        if (music_pos >= time)
            flashAlpha = 1;
        return;
    }
    
    var offset_time = time - ITS_SHOWTIME_SEG_SPAWN_OFFSET;
    
    if (music_pos < offset_time)
        return;
    
    var scale_prog = clamp((time - music_pos) / ITS_SHOWTIME_SEG_SPAWN_OFFSET, 0, 1);
    var scale = lerp(1, ITS_SHOWTIME_SEG_STARTING_SCALE, scale_prog);
    
    if (txtParts[index] != -1)
        txtParts[index] = approach(txtParts[index], 0, 0.05);
    
    if (scale_prog <= 0 && txtParts[index] == -1)
        txtParts[index] = ITS_SHOWTIME_SEG_SHAKE_MAG;
    
    var shake_mag = max(txtParts[index], 0);
    var shake_x = IRandomSign(shake_mag);
    var shake_y = IRandomSign(shake_mag);
    
    quick_log(txtParts[index])
    
    draw_sprite_ext(sprite_index, index, GuiCalcX(fa_center, shake_x), GuiCalcY(fa_top, y + shake_y), image_xscale * scale, image_yscale * scale, image_angle, image_blend, image_alpha);
})