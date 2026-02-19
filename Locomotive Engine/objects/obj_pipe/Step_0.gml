if instance_place(x, y + 1, obj_player) or instance_place(x, y - 1, obj_player) { 
    warp_set_door(x, y - 1)
    if targetDoor == "Pipe" {
        warp_set_door(x, y + 1)
    }
    var anim = "none", targetrm = noone
    with obj_player { 
        var losdowns = [playerState.machroll, playerState.groundpound, playerState.crouch]
        if sign(other.image_yscale) == 1 && down_held && array_contains(losdowns, state) {
            anim = "downpizzabox"
            targetrm = other.targetroom
        } else if sign(other.image_yscale) == -1 && up_held {
            anim = "uppizzabox"
            targetrm = other.targetroom
        }
    }
    if anim != "none" && !instance_exists(obj_cutscene) {
        with obj_player {
            targetDoor = other.targetDoor
            x = other.x
            pipedDir = sign(other.image_yscale)
            usesCollision = false
            image_speed = 0.35
        }
        fmod_event_oneshot(sfx_pipe)
        create_cutscene("warppipe", cs_warppipe, {
            anim,
            targetrm
        })
    }
     
}