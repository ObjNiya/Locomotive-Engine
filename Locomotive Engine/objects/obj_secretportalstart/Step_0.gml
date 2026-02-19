if animation_end() {
    switch sprite_index {
        case spr_secretportal_spawnidle:
            if dropped
                instance_destroy()
            break
    }
}
if position_meeting(x, y, [obj_secretblock, obj_secretbigblock]) {
    with instance_place(x, y, [obj_secretblock, obj_secretbigblock]) {
        instance_destroy()
    }
}