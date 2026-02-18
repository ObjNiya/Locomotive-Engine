if place_meeting(x - obj_player.hsp, y, obj_player) && !instance_exists(obj_cutscene) {
    create_cutscene("patriciodeath", cs_PatricioDeath, {
        alpha_fade: 0, 
        PunchImgIndex: 0,
        stored: {
            state: obj_player.state,
            movespeed: obj_player.movespeed,
            sprite_index: obj_player.sprite_index,
            image_index: obj_player.image_index
        }
    })
    mask_index = spr_masknull
}