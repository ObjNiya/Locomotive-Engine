function state_player_sjump_start()
{
    sprite_index_set(spr_sjump, 0);
    
    vsp = -12;
    hsp = 0;
    movespeed = 0;
    grav = -0.1;
    grounded = false;
    
    mach_afterimage_use_alpha = false;
    mach_afterimage_timer.start();
    step_particle_timer.start();
    groundpound_woosh_particle_timer.start();
    
    instance_create(x, y, obj_explosion_particle_alt);
}

function state_player_sjump_step()
{
    if (player_perform_hit_ceiling())
        return;
    
    if (sprite_index == spr_springlaunch)
        return;
    
    if ((InputPressed(INPUT_VERB.MACHRUN) || InputPressed(INPUT_VERB.GRABDASH)) && sprite_index == spr_sjump)
    {
        sprite_index_set(spr_sjump_cancel_intro, 0);
        
        vsp = 0;
        grav = 0;
    }
    
    if (!instance_exists(obj_groundpound_effect))
    {
        with (instance_create(x, y, obj_groundpound_effect))
            player_instance = other.id;
    }    
    
    if (sprite_index != spr_sjump_cancel_intro)
        return;
    
    mach_afterimage_timer.stop();
    groundpound_woosh_particle_timer.stop();
    blur_afterimage_timer.stop();
    step_particle_timer.stop();
    
    var sign_input_x = sign(InputX(INPUT_CLUSTER.NAVIGATION))
    
    if (sign_input_x != 0)
        image_xscale = sign_input_x;
    
    if (!animation_end())
        return;
    
    state_machine_set_state(state_player_mach());
    
    vsp = -5;
    movespeed = 12;
    
    sprite_index = spr_sjump_cancel;
}

function state_player_sjump_end()
{
    grav = 0.5;
    mach_afterimage_use_alpha = true;
    mach_afterimage_timer.stop();
    groundpound_woosh_particle_timer.stop();
    blur_afterimage_timer.stop();
    step_particle_timer.stop();
}

function state_player_sjump()
{
    return [state_player_sjump_start, state_player_sjump_step, state_player_sjump_end];
}