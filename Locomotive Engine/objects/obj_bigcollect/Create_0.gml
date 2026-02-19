event_inherited();

depth = 201
// can be hidden through tiles with this depth

randomize()
sprite_index = asset_get_index($"spr_bigcollect{irandom_range(1, 5)}")
image_speed = 0.35 

value = 100

function got() {
    global.collect += value
    global.combotime = 60
    fmod_event_oneshot(sfx_bigcollect)
    change_tv(spr_tvcollect_damian, true, 60 * 3)
}