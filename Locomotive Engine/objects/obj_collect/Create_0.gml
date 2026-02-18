event_inherited();

value = 10
got = function() {
	global.collect += value
    global.combotime += 10
    global.combotime = clamp(global.combotime, 0, 60)
    fmod_event_oneshot(sfx_collect)
}
depth = 201
image_speed = 0.35