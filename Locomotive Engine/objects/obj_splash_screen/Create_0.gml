SINGLETON;

#macro SPLASH_DURATION 2.5 // The duration of a splash in frames

depth = DEPTHS.FRONT;

splashes = [];
splash_index = 0;

splash_timer = new Timer(SPLASH_DURATION, time_source_units_seconds, function() {
    fade_out = true;
});
splash_timer.Start();

fade_out = false;
fade_alpha = 1;


function Splash(bg_sprite_index, sprite_index) constructor
{
    bg = new Sprite(bg_sprite_index);
    
    bg.image_xscale = GAME_WIDTH / sprite_get_width(bg.sprite_index);
    bg.image_yscale = GAME_HEIGHT / sprite_get_height(bg.sprite_index);
    
    spr = new Sprite(sprite_index);
    
    spr.x = GAME_WIDTH / 2;
    spr.y = GAME_HEIGHT / 2;
    
    array_push(obj_splash_screen.splashes, self);
}

new Splash(spr_pixel, spr_splash_studio);
var splash = new Splash(spr_pixel, spr_splash_fmod);
with (splash)
{
    spr.image_xscale = 0.5;
    spr.image_yscale = 0.5;
    
    bg.image_alpha = c_black;
}