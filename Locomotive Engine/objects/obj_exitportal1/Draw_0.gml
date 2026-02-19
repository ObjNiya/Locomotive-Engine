

pal_swap_set(spr_exitportal_palette, 1, 0)
draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,1)

pal_swap_set(spr_exitportal_palette, palindex, 0)
draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,bgalpha)

shader_reset()