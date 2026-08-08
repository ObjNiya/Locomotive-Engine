#macro CUTSCENE_SKIP_PROMPT_DURATION 120

stepEvent = -1;
endEvent = -1;

skips = [];

getCutsceneLen = -1;
getCutscenePos = -1;
setCutscenePos = -1;

performSkip = -1;

skipBind = INPUT_VERB.JUMP;
skipBindPressed = false;
skipBindTxt = -1;

skipTxt = scribble("[spr_keyboard_icons] Skip");
skipTxt.starting_format("spr_mediumfont", image_blend);
skipTxt.align(fa_left, fa_top);
skipTxt.blend(image_blend, image_alpha);

drawSkipTxt = function() {
    if (alarm[1] <= 0)
        return;
    
    var skip_x = AlignToGuiX(fa_left, 16);
    var skip_y = AlignToGuiY(fa_bottom, -48);
    
    skipTxt.draw(skip_x, skip_y);
    skipBindTxt.draw(skip_x + 16, skip_y);
}

guiSprite = -1;
appSprite = -1;

function SegmentSkip(from, to, insta_skip = false, skip_func = -1) constructor
{
    skipFrom = max(0, from);
    instaSkip = insta_skip;
    skipTo = to;
    skipFunc = skip_func;
    
    array_push(other.skips, self);
}

alarm[0] = 1;