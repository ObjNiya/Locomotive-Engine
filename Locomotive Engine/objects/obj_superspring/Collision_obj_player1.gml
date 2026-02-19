with other {
    if state != playerState.superjump {
        if other.image_yscale == 1 {
			sprite_index = get_charspr("presentbox")
			state = playerState.superjump
			vsp = -10
		} else if other.image_yscale == -1 {
            sprite_index = get_charspr("rockethitwall")
            state = playerState.groundpound
            vsp = 20
        }
        hsp = 0
        movespeed = 0
        x = other.x
        other.image_index = 0
        if (other.sprite_index != other.activatespr)
        other.sprite_index = other.activatespr
        other.image_speed = 0.35
    }
}