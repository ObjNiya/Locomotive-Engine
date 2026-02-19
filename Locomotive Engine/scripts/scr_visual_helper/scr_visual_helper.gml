/**
 * This function will initialize various variables to modify sprite drawing on the current instance without affecting collision interactions, those being:
 * ```visual_x```, ```visual_y```, ```visual_xscale```, ```visual_yscale``` and ```visual_angle``` which are all pretty self explanatory.
 * You may manually take these variables into account in your draw event, but there are special functions to automate this process:
 * ```vh_draw_sprite_ext``` and ```vh_draw_self```.
 */
function visual_helper_initialize()
{
    visual_x = 0;
    visual_y = 0;
    
    visual_xscale = 1;
    visual_yscale = 1;
    visual_angle = 0;
}

/**
 * This function will draw the given sprite like ```draw_sprite_ext()``` while also taking all of the visual helper variables into account automatically.
 * @parameter {Asset.GMSprite} sprite The sprite to draw.
 * @parameter {Real} subimg The sub-image (frame) of the sprite to draw (image_index or -1 correlate to the current frame of animation in the object).
 * @parameter {Real} x The x coordinate of where to draw the sprite.
 * @parameter {Real} y The y coordinate of where to draw the sprite.
 * @parameter {Real} xscale The horizontal scaling of the sprite, as a multiplier: 1 = normal scaling, 0.5 is half, etc.
 * @parameter {Real} yscale The vertical scaling of the sprite, as a multiplier: 1 = normal scaling, 0.5 is half, etc.
 * @parameter {Real} rot The rotation of the sprite. 0=right way up, 90=rotated 90 degrees counter-clockwise, etc.
 * @parameter {Real} alpha  	The alpha of the sprite (from 0 to 1 where 0 is transparent and 1 opaque).
 */
function vh_draw_sprite_ext(sprite, subimg, x, y, xscale, yscale, rot, colour, alpha)
{
    draw_sprite_ext(sprite, subimg, x + visual_x, y + visual_y, xscale * visual_xscale, yscale * visual_yscale, rot + visual_angle, colour, alpha);
}

/**
 * This function will draw the current instance like ```draw_self``` while also taking all of the visual helper variables into account automatically.
 */
function vh_draw_self()
{
    vh_draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha * real(visible));
}