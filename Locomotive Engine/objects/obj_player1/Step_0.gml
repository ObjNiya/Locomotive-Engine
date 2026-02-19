if (state >= 0 && state <= array_length(states) - 1) {
	var struct = states[state]
	script_execute(struct.script);
	stateName = struct.name	
}

if state == playerState.groundpound && vsp >= 2 {
	terminalVelocity = 40
	grav = 1
} else if state == playerState.cape {
	grav = 0.3
} else { 
	grav = 0.5
}
// El flash
if flash && alarm[0] == -1
	alarm[0] = 5

// Afterimges y particulas
var precalls = {
	"spr_cloudeffect" : -4,
	"spr_crazyrunothereffect" : -4,
	"spr_piledrivereffect" : -4,
	"spr_cloudeffect" : -4,
	"blur" : -4,
	"mach" : -4,
}
if state == playerState.mach3 && is_charspr("crazyrun") {
	precalls.spr_crazyrunothereffect = 14
	precalls.blur = 2
}
if state == playerState.groundpound && vsp > 0.5 {
	precalls.spr_piledrivereffect = 14
	precalls.spr_cloudeffect = 4
	precalls.mach = 7
}
if state == playerState.superjump && vsp != 0
	precalls.spr_cloudeffect = 6	
if state == playerState.uppercut && vsp < 0
	precalls.mach = 7
if is(state, playerState.grab, playerState.machroll, playerState.climbwall, playerState.superjump, playerState.groundpound)
	precalls.blur = 2
if is(state, playerState.mach2, playerState.mach3)
	precalls.mach = 7
trails_call(precalls)
instakillmove = is(state, playerState.mach3, playerState.superjump, playerState.uppercut, playerState.zombie) || (state = playerState.cape && movespeed >= 12)
if timeuntilhpback > 0
    timeuntilhpback--;
scr_playerSounds()

if (y > (room_height + 300) || y < -800) && !place_meeting(x, y, [obj_verticalhallway, obj_hallway]) && !instance_exists(obj_technicaldifficulty) {
	cam_shake(20)
	
	state = playerState.nothing
	hsp = 0
	vsp = 0
	usesCollision = false
	fmod_event_oneshot(sfx_bodyslamland)
	with instance_create(0, 0, obj_technicaldifficulty) {
		playerid = other.id
		
	}
}
cc_collide_player()