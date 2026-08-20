event_inherited();
with (other)
{
    TvDoExpression(hudTvId, spr_tv_laugh, 150);
    
    if (irandom(100) <= 50)
        sound_instance_one_shot(sfxVoiceHappy, x, y);
}