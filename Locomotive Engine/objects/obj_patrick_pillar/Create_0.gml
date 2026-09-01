event_inherited();

playerDir = 1;
music = sound_instance_create(mu_patrickpillar);
sound_instance_start(music);

canCollide = function(o_index)
{
    return (alarm[0] == -1);
}