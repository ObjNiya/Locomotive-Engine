event_inherited();
with (other)
{
    TvTriggerExpr(hudTvId, spr_tv_laugh, true, 150);
    
    if (irandom(100) <= 50)
        sound_instance_one_shot(sfx_voice_happy, x, y);
}