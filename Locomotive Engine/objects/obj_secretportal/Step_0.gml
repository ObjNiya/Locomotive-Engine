if instance_place(x, y, obj_player) && !instance_exists(obj_cutscene) && active {
    ds_list_add(global.saveroom, id)
    fmod_event_oneshot3D(sfx_enteregg)
    create_cutscene("secretportal", cs_secretEnter, {
        secretPortal: id,
        paletteselecto: paletteselect
    })
}