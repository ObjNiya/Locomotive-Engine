if !global.key_inv {
    global.key_inv = true
    fmod_event_oneshot(sfx_collectkey)
    create_cutscene("keyget", cs_keyget)
    instance_destroy()
}