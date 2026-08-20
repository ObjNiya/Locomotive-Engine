InstanceCreate(0, 0, obj_player);

var create_intro = function()
{
    var intro = CreateCutscene("data\\intro.mp4");
    intro.endEvent = function()
    {
        layer_destroy("Backgrounds_2");
    }
}

var splash = CreateCutscene(seq_splash_screen, true, false);
splash.endEvent = create_intro;
with (splash)
{
    new SegmentSkip(0, 183, true);
    new SegmentSkip(183, -1, true);
}

// TODO: Remove this and program the actual File Select

SetRoomEvent(ROOM_EVS.STEP, function() {
    if (InputPressed(INPUT_VERB.JUMP) && !instance_exists(par_cutscene) && !instance_exists(obj_loadingscreen))
    {
        texturegroup_load("texgroup_damian");
        texturegroup_load("texgroup_hub");
        
        var banks;
        
        with (obj_fmod_studio)
        {
            damianBank = fmod_studio_system_load_bank_file(fmod_path_bundle(bnk_damian), FMOD_STUDIO_LOAD_BANK.NORMAL);
            hubBank = fmod_studio_system_load_bank_file(fmod_path_bundle(bnk_hub), FMOD_STUDIO_LOAD_BANK.NORMAL);
            
            banks = [damianBank, hubBank];
        }

        with (obj_player)
            PlayerCreateSnds();
        
        var loadingscreen = LoadingscreenCreate(["texgroup_damian", "texgroup_hub"], banks);
        var skip = true;
        
        if (skip)
            RoomQueue(rm_hub_start, obj_spawn_a);
        else
            RoomQueue(rm_newfile_cutscene, obj_spawn_a);
        RoomTrans(obj_roomtrans_fade, "", function() {
            GameStateSet(GAME_STATES.HUB);
            
            texturegroup_unload("texgroup_gamestart");
            texturegroup_unload("texgroup_fileselect");
            fmod_studio_bank_unload(obj_fmod_studio.titleBank);
        });
    }
})