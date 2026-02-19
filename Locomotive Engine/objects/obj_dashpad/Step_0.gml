if place_meeting(x, y, obj_player) {
    var x_scale = sign(image_xscale)
    
    with obj_player {
        xscale = x_scale
        movespeed = 12
        
        state = playerState.mach3
        set_charspr("dashpad")
        
        vsp = 0
        y = other.y - 14
    }
}