if ds_list_find_index(global.saveroom, id) == -1 {
    global.secretfound++
    create_transfotext($"You found {global.secretfound} out of 3 secrets")
    
    ds_list_add(global.saveroom, id)
    instance_destroy()
}