cc_collide_init()
enum playerState {
	nothing,
	normal,
	grab,
	mach2,
	mach3,
	machslide,
	bump,
	climbwall,
	machroll,
	superjump,
	superjumpprep,
	crouch,
	uppercut,
	taunt,
	groundpound,
	cutscene,
	hurt,
	hitstun,
	haul,
	finishingblow,
	noclip,
    
    // cape
    cape,
    capefall,
	ladder,
	slidekick,
	parry,
    
    // gimmicks
    zombie
}
roomstartx = 0
roomstarty = 0
sjumpvspstart = -17
sjumpvsp = sjumpvspstart
dashcloudinst = -4
palSelect = {
    number: 8,
    patsprite: -1
}
saved_vsp = 0
pipedDir = 1
piped = false
ladderx = 0
timeuntilhpback = 0
parry_inst = -4
taunt_to_parry_max = 10
parry_count = 0
parry_max = 8
targetDoor = "B"
flash = 0
horizontalHallwayDir = 0
horizontalHallwayMult = 0
horizontalHallwayMult_crouch = 0
verticalHallwayMult = 0
verticalHallwayDir = 0
input_buffer_jump = 0
coyote_time = 0
coyote = false
canJump = false
collideWall = false
airgrab = false
defineState = function(num, scr, _name) {
	states[num] = {
		script : scr,
		name : _name
	}
}
jumpstop = false
do_jumpstop = function() {
	var state_blacklist = []

}
jump_check = function(buffer) {
	if buffer {
		if input_buffer_jump > 0 && canJump {
			input_buffer_jump = 0
			return true
		}
	} else {
		return canJump && jump_pressed;
	}
	return false;
	
}
afterimages = {
	blur : [],
	mach : []
}
crazyruneffect = 0
step = false
afterimages_blur = []
blur = 5
mach = 0
afterimages_mach = []
stateName = ""
movespeed = 0
character = "D" // dih
xscale = 1
yscale = 1
tauntinfo = {
	sprite_index : 0,
	image_index : 0,
	image_speed : 0,
	movespeed : 0,
	hsp : 0,
	vsp : 0,
	state : 0
}
hitstuninfo = {
	sprite_index : 0,
	image_index : 0,
	image_speed : 0,
	movespeed : 0,
	hsp : 0,
	vsp : 0,
	state : 0
}
prev_state = playerState.normal
state_stateous = playerState.normal
depth = -5
state = playerState.normal
defineState(playerState.nothing, scr_player_nothing, "do nothing")
defineState(playerState.normal, scr_player_normal, "normal")
defineState(playerState.grab, scr_player_grab, "grab")
defineState(playerState.mach2, scr_player_mach2, "mach2")
defineState(playerState.mach3, scr_player_mach3, "mach3")
defineState(playerState.machslide, scr_player_machslide, "machslide")
defineState(playerState.bump, scr_player_bump, "bump")
defineState(playerState.climbwall, scr_player_climbwall, "climbwall")
defineState(playerState.machroll, scr_player_machroll, "machroll")
defineState(playerState.superjump, scr_player_superjump, "superjump")
defineState(playerState.superjumpprep, scr_player_superjumpprep, "super jump prep")
defineState(playerState.crouch, scr_player_crouch, "crouch")
defineState(playerState.uppercut, scr_player_uppercut, "uppercut")
defineState(playerState.taunt, scr_player_taunt, "taunt")
defineState(playerState.groundpound, scr_player_groundpound, "ground pound")
defineState(playerState.cutscene, scr_player_cutscene, "cutsceNE")
defineState(playerState.hurt, scr_player_hurt, "hurt")
defineState(playerState.hitstun, scr_player_hitstun, "hitstun")
defineState(playerState.haul, scr_player_grabbing, "grab enemy")
defineState(playerState.finishingblow, scr_player_finishingblow, "finishing blow")
defineState(playerState.cape, scr_player_cape, "cape")
defineState(playerState.capefall, scr_player_capefall, "cape fall")
defineState(playerState.ladder, scr_player_ladder, "ladder")
defineState(playerState.hurt, scr_player_hurt, "hurt")
defineState(playerState.parry, scr_player_parry, "parry")
defineState(playerState.slidekick, scr_player_slidekick, "slidekick")
defineState(playerState.zombie, scr_player_zombie, "zombie")
defineState(playerState.noclip, scr_player_noclip, "noclippoughhhHahhhaHHHhhhh")

dir = 0
chargeImg = 0
chargeFrames = 0
chargeShow = false
defineState = -4
taunteffect = -4
instakillmove = false
baddiegrabbedID = -4
mach2jumpsnd = fmod_event_create(sfx_mach2jump);
attacksnd = fmod_event_create("event:/sfx/player/grabdash")
locoMachSnd = fmod_event_create("event:/sfx/player/mach/damian")
fmod_event_play(locoMachSnd)
scale_xs = 1
scale_ys = 1
prev_hsp = 0
prev_vsp = 0
extrahsp = 0