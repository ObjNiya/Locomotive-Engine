skipBindTxt = scribble(InputVerbGetBindingName(skipBind));
skipBindTxt.starting_format("spr_fnt_sign", image_blend);
skipBindTxt.align(fa_left, fa_top);
skipBindTxt.blend(image_blend, image_alpha);

loopTo = real(loopTo);
loopFrom = real(loopFrom);

if (loopFrom == -1)
    loopFrom = getCutsceneLen();

if (autoSkip)
    new SegmentSkip(0, -1, false);

array_foreach(skips, function(seg_skip, index) {
    var cutscene_len = getCutsceneLen();

    if (seg_skip.skipTo == -1)
        seg_skip.skipTo = cutscene_len;
    seg_skip.skipTo = min(cutscene_len, seg_skip.skipTo);

});

if (!suspendGame)
    exit;

appSprite = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false, false, 0, 0);

var gui_surf = obj_screensizer.guiSurf;
if (surface_exists(gui_surf))
    guiSprite = sprite_create_from_surface(gui_surf, 0, 0, surface_get_width(gui_surf), surface_get_height(gui_surf), false, false, 0, 0);

GamePause(true, false);
