cutsceneStarted = false;
pillarMus = new MusicOverlay("pillar", mu_patrickpillar, false, 100, function() {
    return distance_to_pos(obj_patrick_pillar.x, obj_patrick_pillar.y, obj_player.x, obj_player.y, 150, 150)
})
//DESTROY_SAVEROOM;