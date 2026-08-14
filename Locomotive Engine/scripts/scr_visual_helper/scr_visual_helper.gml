/**
 * Creates variables on the current instance to transform and move the drawing of the instances' sprites without affecting collision, creating the following:
 * ```visualX```, ```visualY```, ```visualXScale```, ```visualYScale``` and ```visualAngle```.
 * There are dedicated draw functions for drawing while taking these variables into account, those functions starting with ```Vh```.
 */
function VisualHelperInit()
{
    visualX = 0;
    visualY = 0;
    
    visualXScale = 1;
    visualYScale = 1;
    visualAngle = 0;
}

/**
 * Draws the given sprite like ```draw_sprite_ext()```, while taking the variables created by ```VisualHelperInit()``` into account.
 * @parameter {Asset.GMSprite} sprite The sprite to draw.
 * @parameter {Real} subimg The sub-image (frame) of the sprite to draw (image_index or -1 correlate to the current frame of animation in the object).
 * @parameter {Real} x The x coordinate of where to draw the sprite.
 * @parameter {Real} y The y coordinate of where to draw the sprite.
 * @parameter {Real} xscale The horizontal scaling of the sprite, as a multiplier: 1 = normal scaling, 0.5 is half, etc.
 * @parameter {Real} yscale The vertical scaling of the sprite, as a multiplier: 1 = normal scaling, 0.5 is half, etc.
 * @parameter {Real} rot The rotation of the sprite. 0=right way up, 90=rotated 90 degrees counter-clockwise, etc.
 * @parameter {Real} alpha  	The alpha of the sprite (from 0 to 1 where 0 is transparent and 1 opaque).
 */
function VhDrawSpriteExt(sprite, subimg, x, y, xscale, yscale, rot, colour, alpha)
{
    draw_sprite_ext(sprite, subimg, x + visualX, y + visualY, xscale * visualXScale, yscale * visualYScale, rot + visualAngle, colour, alpha);
}

/**
 * Draws the current instance like ```draw_self()``` while taking the variables created by ```VisualHelperInit()``` into account.
 */
function VhDrawSelf()
{
    VhDrawSpriteExt(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha * real(visible));
}