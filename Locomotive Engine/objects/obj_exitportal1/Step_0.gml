if !palreturn 
	palindex += 0.02
else
	palindex = approach(palindex,1,0.02)
if palindex >= 8
	palreturn = true
if palindex <= 1
	palreturn = false

if !visible
    exit

if obj_player.state != playerState.cutscene && !global.panic && sprite_index != spr_exitportal_close {
    sprite_index = spr_exitportal_close
    image_index = 0
}
if animation_end() && sprite_index == spr_exitportal_close {
    visible = false
}

if obj_player.up_pressed && place_meeting(x, y, obj_player) && sprite_index == spr_exitportal && global.panic && !instance_exists(obj_cutscene) {
    var toppin_count = global.plushiefollow.waddle + global.plushiefollow.koopa + global.plushiefollow.squash + global.plushiefollow.cappy + global.plushiefollow.wario
    create_cutscene("exitLevel", cs_exitLevel, {
        level: global.currentLevel,
        rank: global.rank,
        points: global.collect,
        secret: global.secretfound,
        catripi: global.catripi,
        toppins: toppin_count,
        length: 50,
        angle: 270,
        fade: 0,
        
        timeout: 60
    })
    
    
}