event_inherited();
if (surface_exists(seqLayerSurf))
    draw_surface_ext(seqLayerSurf, x, y, image_xscale * global.guiMaxScale, image_yscale * global.guiMaxScale, image_angle, image_blend, image_alpha);
drawSkipTxt();