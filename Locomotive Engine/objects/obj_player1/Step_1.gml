// good input system not like in ptp or nhb 
// wtf -Niya
up_held      = input_check_held("up")
up_pressed   = input_check_pressed("up")
jump_held    = input_check_held("jump")
jump_pressed = input_check_pressed("jump")
left_held    = input_check_held("left")
left_pressed = input_check_pressed("left")
right_held   = input_check_held("right")
right_pressed= input_check_pressed("right")
down_held    = input_check_held("down")
down_pressed = input_check_pressed("down")
mach_held    = input_check_held("mach")
mach_pressed = input_check_pressed("mach")
grab_held    = input_check_held("grab")
grab_pressed = input_check_pressed("grab")
taunt_held    = input_check_held("taunt")
taunt_pressed = input_check_pressed("taunt")
start_pressed = input_check_pressed("start")
moveH_pressed = right_pressed - left_pressed
moveH_held = right_held - left_held
extrahsp = approach(extrahsp, 0, 0.5)
//jump stop
if is(state, playerState.normal, playerState.mach2, playerState.mach3, playerState.crouch, playerState.haul) {// when to do jumpstop 
	if !jump_held && !jumpstop && vsp < 0.5 && !grounded {
		jumpstop = true
		vsp /= 20
	}
} else {
	jumpstop = false	
}
if grounded 
	jumpstop = false

//input buffers
if jump_pressed
	input_buffer_jump = 8


if input_buffer_jump > 0
	input_buffer_jump--

canJump = ((coyote_time > 0 && !grounded) || grounded)
collideWall = scr_collision_cc(x + xscale, y, ~typeExclude.SOLID)
collideCeiling = scr_collision_cc(x, y - 1, ~typeExclude.SOLID)

// coyote
if (grounded && vsp > 0)
    coyote_time = 6
if (vsp < 0)
    coyote_time = 0
if !is(state, playerState.cape, playerState.capefall, playerState.groundpound) {
	terminalVelocity = 20	
}
//if state != playerState.nothing
//	usesCollision = true
if state != playerState.grab
	fmod_event_stop(attacksnd, true)

if is_charspr("machroll") or is(state, playerState.crouch) or (is(state, playerState.cape) && is_charspr("capeslide")) {
    mask_index = spr_crouchmask
}
else {
    mask_index = spr_player_mask
    if scr_collision_cc(x, y, typeExclude.SLOPE) {
        mask_index = spr_crouchmask
    }
}

if state_stateous != state {
    prev_state = state_stateous
    state_stateous = state
}
prev_hsp = hsp
prev_vsp = vsp
