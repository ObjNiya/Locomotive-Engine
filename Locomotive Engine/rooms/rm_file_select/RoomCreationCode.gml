var create_intro = function()
{
    var intro = CreateCutscene("data\\intro.mp4");
    intro.endEvent = function()
    {
        layer_destroy("Backgrounds_2");
    }
}

var splash = CreateCutscene(seq_splash_screen, true, false);
splash.endEvent = create_intro;
with (splash)
{
    new SegmentSkip(0, 183, true);
    new SegmentSkip(183, -1, true);
}

// TODO: Remove this and program the actual File Select

SetRoomEvent(ROOM_EVS.STEP, function() {
    if (InputPressed(INPUT_VERB.JUMP) && !instance_exists(par_cutscene))
    {
        var skip = true;
        
        if (skip)
            RoomQueue(rm_hub_start, obj_spawn_a);
        else
            RoomQueue(rm_newfile_cutscene, obj_spawn_a);
        RoomTrans(obj_roomtrans_fade, "", function() {
            GameStateSet(GAME_STATES.HUB);
        });
    }
})